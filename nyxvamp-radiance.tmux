# nyxvamp - radiance variant (tmux)
# author: zoedsoupe <zoey.spessanha@zeetech.io>
#
# Light theme optimized for daylight use, ensuring excellent readability
# with deep purples and warm accents on an off-white background.
#
# Usage:
#   set -g @nyxvamp_status_position 'bottom'   # bottom | top
#   set -g @nyxvamp_date_format '%Y-%m-%d'
#   set -g @nyxvamp_time_format '%H:%M'

# === palette ===
# bg              #F7F7FF   off-white background
# fg              #1E1E2E   deep navy foreground
# surface         #E8E8F0   light gray (status bar)
# overlay         #E8D5FF   light purple selection
# pink            #9F1239   accent / errors / pink (high-contrast)
# rose            #9655FF   deep purple keywords / current window
# blue            #005F87   functions / time
# yellow          #B8860B   strings (dark golden rod)
# cyan            #8BD5CA   hints
# peach           #C2410C   numbers / warnings / sync mode
# lavender        #6B46C1   types / mode label
# comment         #5A5570   inactive text / pane border / line numbers

# === options ===
%if "#{?@nyxvamp_status_position,1,0}"
set -gF status-position "#{@nyxvamp_status_position}"
%else
set -g  status-position bottom
%endif

set -g  status on
set -g  status-justify left
set -g  status-style "fg=#1E1E2E,bg=#E8E8F0"
set -g  status-left-length 40
set -g  status-right-length 80

# === status segments ===
set -g  status-left "#[fg=#F7F7FF,bg=#9655FF,bold] #S #[fg=#9655FF,bg=#E8E8F0,nobold] "

%if "#{?@nyxvamp_show_mode_indicator,1,1}"
set -g status-right "#[fg=#6B46C1,bg=#E8E8F0] #{tmux_mode_indicator} #[fg=#005F87]#{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#5A5570]· #[fg=#9655FF]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%else
set -g status-right "#[fg=#005F87,bg=#E8E8F0] #{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#5A5570]· #[fg=#9655FF]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%endif

# === windows ===
set -g  window-status-separator ""
set -g  window-status-format "#[fg=#5A5570,bg=#E8E8F0] #I #[fg=#1E1E2E]#W "
set -g  window-status-current-format "#[fg=#E8E8F0,bg=#E8D5FF]#[fg=#1E1E2E,bg=#E8D5FF,bold] #I #W #[fg=#E8D5FF,bg=#E8E8F0,nobold]"
set -g  window-status-activity-style "fg=#C2410C,bg=#E8E8F0"
set -g  window-status-bell-style "fg=#9F1239,bg=#E8E8F0,bold"

# === panes ===
set -g  pane-border-style "fg=#5A5570"
set -g  pane-active-border-style "fg=#9655FF"

# === messages / command prompt ===
set -g  message-style "fg=#1E1E2E,bg=#E8E8F0"
set -g  message-command-style "fg=#9655FF,bg=#E8E8F0"

# === modes ===
set -g  mode-style "fg=#F7F7FF,bg=#9655FF,bold"
set -g  clock-mode-colour "#9655FF"

# === mode-indicator plugin (optional) ===
set -g  @mode_indicator_prefix_prompt " WAIT "
set -g  @mode_indicator_prefix_mode_style "bg=#9F1239,fg=#F7F7FF,bold"
set -g  @mode_indicator_copy_prompt    " COPY "
set -g  @mode_indicator_copy_mode_style    "bg=#B8860B,fg=#F7F7FF,bold"
set -g  @mode_indicator_sync_prompt    " SYNC "
set -g  @mode_indicator_sync_mode_style    "bg=#C2410C,fg=#F7F7FF,bold"
set -g  @mode_indicator_empty_prompt   " TMUX "
set -g  @mode_indicator_empty_mode_style   "bg=#005F87,fg=#F7F7FF,bold"
