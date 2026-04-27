# nyxvamp - obsidian variant (tmux)
# author: zoedsoupe <zoey.spessanha@zeetech.io>
#
# Very dark theme with near-black background and muted colors,
# tuned for focused nighttime sessions.
#
# Usage:
#   set -g @nyxvamp_status_position 'bottom'   # bottom | top
#   set -g @nyxvamp_date_format '%Y-%m-%d'
#   set -g @nyxvamp_time_format '%H:%M'

# === palette ===
# bg              #000A0F   near-black background
# fg              #C0C0CE   muted lavender foreground
# surface         #1E1E20   status bar / current window pill seam
# inactive_bg     #0E0E10   inactive status / cursor text
# overlay         #2E2E30   selection
# pink            #F28FAD   accent / errors / cursor
# rose            #F5C2E7   keywords / current window
# blue            #7FAFD7   functions / time
# green           #8FBF8F   strings / copy mode
# cyan            #7BB5A8   hints
# peach           #D8A080   numbers / warnings / sync mode
# lavender        #A0A0D0   types / mode label
# comment         #5E5A76   inactive text / pane border / line numbers

# === options ===
%if "#{?@nyxvamp_status_position,1,0}"
set -gF status-position "#{@nyxvamp_status_position}"
%else
set -g  status-position bottom
%endif

set -g  status on
set -g  status-justify left
set -g  status-style "fg=#C0C0CE,bg=#1E1E20"
set -g  status-left-length 40
set -g  status-right-length 80

# === status segments ===
set -g  status-left "#[fg=#000A0F,bg=#F28FAD,bold] #S #[fg=#F28FAD,bg=#1E1E20,nobold] "

%if "#{?@nyxvamp_show_mode_indicator,1,1}"
set -g status-right "#[fg=#A0A0D0,bg=#1E1E20] #{tmux_mode_indicator} #[fg=#7FAFD7]#{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#5E5A76]· #[fg=#F5C2E7]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%else
set -g status-right "#[fg=#7FAFD7,bg=#1E1E20] #{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#5E5A76]· #[fg=#F5C2E7]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%endif

# === windows ===
set -g  window-status-separator ""
set -g  window-status-format "#[fg=#5E5A76,bg=#1E1E20] #I #[fg=#C0C0CE]#W "
set -g  window-status-current-format "#[fg=#1E1E20,bg=#F5C2E7]#[fg=#000A0F,bg=#F5C2E7,bold] #I #W #[fg=#F5C2E7,bg=#1E1E20,nobold]"
set -g  window-status-activity-style "fg=#D8A080,bg=#1E1E20"
set -g  window-status-bell-style "fg=#F28FAD,bg=#1E1E20,bold"

# === panes ===
set -g  pane-border-style "fg=#5E5A76"
set -g  pane-active-border-style "fg=#F28FAD"

# === messages / command prompt ===
set -g  message-style "fg=#C0C0CE,bg=#1E1E20"
set -g  message-command-style "fg=#F5C2E7,bg=#1E1E20"

# === modes ===
set -g  mode-style "fg=#000A0F,bg=#F5C2E7,bold"
set -g  clock-mode-colour "#F28FAD"

# === mode-indicator plugin (optional) ===
set -g  @mode_indicator_prefix_prompt " WAIT "
set -g  @mode_indicator_prefix_mode_style "bg=#F28FAD,fg=#000A0F,bold"
set -g  @mode_indicator_copy_prompt    " COPY "
set -g  @mode_indicator_copy_mode_style    "bg=#8FBF8F,fg=#000A0F,bold"
set -g  @mode_indicator_sync_prompt    " SYNC "
set -g  @mode_indicator_sync_mode_style    "bg=#D8A080,fg=#000A0F,bold"
set -g  @mode_indicator_empty_prompt   " TMUX "
set -g  @mode_indicator_empty_mode_style   "bg=#7FAFD7,fg=#000A0F,bold"
