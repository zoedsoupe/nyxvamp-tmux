# nyxvamp - veil variant (tmux)
# author: zoedsoupe <zoey.spessanha@zeetech.io>
#
# Versatile theme for both day and night, featuring bright accents
# on a dark purple background.
#
# Usage:
#   set -g @nyxvamp_show_mode_indicator 'on'   # default 'on' if mode-indicator plugin loaded
#   set -g @nyxvamp_status_position 'bottom'   # bottom | top
#   set -g @nyxvamp_date_format '%Y-%m-%d'
#   set -g @nyxvamp_time_format '%H:%M'

# === palette ===
# bg              #1E1E2E   dark purple background
# fg              #D9E0EE   light lavender foreground
# surface         #2E2E3E   slightly lighter (status bar, current window pill seam)
# overlay         #494D64   selection / cursorline
# pink            #F28FAD   accent / errors / cursor
# rose            #F5C2E7   keywords / current window
# blue            #96CDFB   functions / time
# green           #ABE9B3   strings / copy mode
# cyan            #8BD5CA   hints
# peach           #F8BD96   numbers / warnings / sync mode
# lavender        #C9CBFF   types / mode label
# comment         #6E6A86   inactive text / pane border / line numbers

# === options ===
%if "#{?@nyxvamp_status_position,1,0}"
set -gF status-position "#{@nyxvamp_status_position}"
%else
set -g  status-position bottom
%endif

set -g  status on
set -g  status-justify left
set -g  status-style "fg=#D9E0EE,bg=#2E2E3E"
set -g  status-left-length 40
set -g  status-right-length 80

# === status segments ===
set -g  status-left "#[fg=#1E1E2E,bg=#F28FAD,bold] #S #[fg=#F28FAD,bg=#2E2E3E,nobold] "

%if "#{?@nyxvamp_show_mode_indicator,1,1}"
set -g status-right "#[fg=#C9CBFF,bg=#2E2E3E] #{tmux_mode_indicator} #[fg=#96CDFB]#{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#6E6A86]· #[fg=#F5C2E7]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%else
set -g status-right "#[fg=#96CDFB,bg=#2E2E3E] #{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#6E6A86]· #[fg=#F5C2E7]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%endif

# === windows ===
set -g  window-status-separator ""
set -g  window-status-format "#[fg=#6E6A86,bg=#2E2E3E] #I #[fg=#D9E0EE]#W "
set -g  window-status-current-format "#[fg=#2E2E3E,bg=#F5C2E7]#[fg=#1E1E2E,bg=#F5C2E7,bold] #I #W #[fg=#F5C2E7,bg=#2E2E3E,nobold]"
set -g  window-status-activity-style "fg=#F8BD96,bg=#2E2E3E"
set -g  window-status-bell-style "fg=#F28FAD,bg=#2E2E3E,bold"

# === panes ===
set -g  pane-border-style "fg=#6E6A86"
set -g  pane-active-border-style "fg=#F28FAD"

# === messages / command prompt ===
set -g  message-style "fg=#D9E0EE,bg=#2E2E3E"
set -g  message-command-style "fg=#F5C2E7,bg=#2E2E3E"

# === modes ===
set -g  mode-style "fg=#1E1E2E,bg=#F5C2E7,bold"
set -g  clock-mode-colour "#F28FAD"

# === mode-indicator plugin (optional) ===
set -g  @mode_indicator_prefix_prompt " WAIT "
set -g  @mode_indicator_prefix_mode_style "bg=#F28FAD,fg=#1E1E2E,bold"
set -g  @mode_indicator_copy_prompt    " COPY "
set -g  @mode_indicator_copy_mode_style    "bg=#ABE9B3,fg=#1E1E2E,bold"
set -g  @mode_indicator_sync_prompt    " SYNC "
set -g  @mode_indicator_sync_mode_style    "bg=#F8BD96,fg=#1E1E2E,bold"
set -g  @mode_indicator_empty_prompt   " TMUX "
set -g  @mode_indicator_empty_mode_style   "bg=#96CDFB,fg=#1E1E2E,bold"
