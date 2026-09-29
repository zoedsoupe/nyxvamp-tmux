# nyxvamp - transparent variant (tmux)
# author: zoedsoupe <zoey.spessanha@zeetech.io>
#
# Inherits veil colors but lets the terminal background show through
# (status bar, windows, messages all use bg=default). Intended for
# transparent terminals (e.g. ghostty with background-opacity).
#
# Usage:
#   set -g @nyxvamp_status_position 'bottom'   # bottom | top
#   set -g @nyxvamp_date_format '%Y-%m-%d'
#   set -g @nyxvamp_time_format '%H:%M'

# === palette (foreground only — backgrounds default to terminal) ===
# fg              #D9E0EE   light lavender foreground
# bright_text     #FFFFFF   maximum-contrast text
# pink            #FF6B9D   bright pink accent
# rose            #F5C2E7   keywords / current window
# blue            #5DADE2   header / functions / time
# green           #ABE9B3   strings
# peach           #F8BD96   numbers / warnings
# lavender        #C9CBFF   types / mode label
# directory       #E8D5FF   directories
# comment         #8C88A6   inactive text / pane border

# === options ===
%if "#{?@nyxvamp_status_position,1,0}"
set -gF status-position "#{@nyxvamp_status_position}"
%else
set -g  status-position bottom
%endif

set -g  status on
set -g  status-justify left
set -g  status-style "fg=#D9E0EE,bg=default"
set -g  status-left-length 40
set -g  status-right-length 80

# === status segments ===
set -g  status-left "#[fg=#FF6B9D,bg=default,bold] #S #[fg=#8C88A6,bg=default,nobold]│ "

%if "#{?@nyxvamp_show_mode_indicator,1,1}"
set -g status-right "#[fg=#C9CBFF,bg=default]#{tmux_mode_indicator} #[fg=#5DADE2]#{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#8C88A6]· #[fg=#F5C2E7]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%else
set -g status-right "#[fg=#5DADE2,bg=default]#{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#8C88A6]· #[fg=#F5C2E7]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%endif

# === windows ===
set -g  window-status-separator " "
set -g  window-status-format "#[fg=#8C88A6,bg=default] #I #[fg=#D9E0EE]#W "
set -g  window-status-current-format "#[fg=#F5C2E7,bg=default,bold]▎#I #W "
set -g  window-status-activity-style "fg=#F8BD96,bg=default"
set -g  window-status-bell-style "fg=#FF6B9D,bg=default,bold"

# === panes ===
set -g  pane-border-style "fg=#8C88A6"
set -g  pane-active-border-style "fg=#FF6B9D"

# === messages / command prompt ===
set -g  message-style "fg=#FFFFFF,bg=default"
set -g  message-command-style "fg=#F5C2E7,bg=default"

# === modes ===
set -g  mode-style "fg=#1E1E2E,bg=#F5C2E7,bold"
set -g  clock-mode-colour "#FF6B9D"

# === mode-indicator plugin (optional) ===
set -g  @mode_indicator_prefix_prompt " WAIT "
set -g  @mode_indicator_prefix_mode_style "bg=#FF6B9D,fg=#1E1E2E,bold"
set -g  @mode_indicator_copy_prompt    " COPY "
set -g  @mode_indicator_copy_mode_style    "bg=#ABE9B3,fg=#1E1E2E,bold"
set -g  @mode_indicator_sync_prompt    " SYNC "
set -g  @mode_indicator_sync_mode_style    "bg=#F8BD96,fg=#1E1E2E,bold"
set -g  @mode_indicator_empty_prompt   " TMUX "
set -g  @mode_indicator_empty_mode_style   "bg=#5DADE2,fg=#1E1E2E,bold"
