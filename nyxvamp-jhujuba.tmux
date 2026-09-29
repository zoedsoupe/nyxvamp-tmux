# nyxvamp - jhujuba variant (tmux)
# author: zoedsoupe <zoey.spessanha@zeetech.io>
#
# Pink-tinted mid-dark theme, sitting between veil and radiance.
# Sweeter than veil, with warm pinks and coral on a plum background.
#
# Usage:
#   set -g @nyxvamp_status_position 'bottom'   # bottom | top
#   set -g @nyxvamp_date_format '%Y-%m-%d'
#   set -g @nyxvamp_time_format '%H:%M'

# === palette ===
# bg              #392735   plum background
# fg              #EDD7E4   soft pink-white foreground
# surface         #493644   slightly lighter (status bar, current window pill seam)
# selection       #64485E   selection / cursorline
# dim             #AB8EA7   inactive text / line numbers
# gray            #8A6E86   pane border / recessed elements
# keyword         #EEA2D4   pink keywords / current window
# error           #F2798F   hot pink accent / errors / cursor
# constant        #FDA293   coral constants / atoms
# number          #F7BD8F   peach numbers / warnings / sync mode
# string          #A1E0AD   green strings / copy mode
# function        #91C3F6   blue functions / time
# type            #C9C3F9   lavender types / mode label
# hint            #83CEC8   cyan hints
# diff_add        #92D094   green additions
# diff_delete     #E17D7E   red deletions
# diff_change     #E3C78E   amber changes

# === options ===
%if "#{?@nyxvamp_status_position,1,0}"
set -gF status-position "#{@nyxvamp_status_position}"
%else
set -g  status-position bottom
%endif

set -g  status on
set -g  status-justify left
set -g  status-style "fg=#EDD7E4,bg=#493644"
set -g  status-left-length 40
set -g  status-right-length 80

# === status segments ===
set -g  status-left "#[fg=#392735,bg=#F2798F,bold] #S #[fg=#F2798F,bg=#493644,nobold] "

%if "#{?@nyxvamp_show_mode_indicator,1,1}"
set -g status-right "#[fg=#C9C3F9,bg=#493644] #{tmux_mode_indicator} #[fg=#91C3F6]#{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#AB8EA7]· #[fg=#EEA2D4]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%else
set -g status-right "#[fg=#91C3F6,bg=#493644] #{?@nyxvamp_time_format,#{@nyxvamp_time_format},%H:%M} #[fg=#AB8EA7]· #[fg=#EEA2D4]#{?@nyxvamp_date_format,#{@nyxvamp_date_format},%Y-%m-%d} "
%endif

# === windows ===
set -g  window-status-separator ""
set -g  window-status-format "#[fg=#AB8EA7,bg=#493644] #I #[fg=#EDD7E4]#W "
set -g  window-status-current-format "#[fg=#493644,bg=#EEA2D4]#[fg=#392735,bg=#EEA2D4,bold] #I #W #[fg=#EEA2D4,bg=#493644,nobold]"
set -g  window-status-activity-style "fg=#F7BD8F,bg=#493644"
set -g  window-status-bell-style "fg=#F2798F,bg=#493644,bold"

# === panes ===
set -g  pane-border-style "fg=#8A6E86"
set -g  pane-active-border-style "fg=#F2798F"

# === messages / command prompt ===
set -g  message-style "fg=#EDD7E4,bg=#493644"
set -g  message-command-style "fg=#EEA2D4,bg=#493644"

# === modes ===
set -g  mode-style "fg=#392735,bg=#EEA2D4,bold"
set -g  clock-mode-colour "#F2798F"

# === mode-indicator plugin (optional) ===
set -g  @mode_indicator_prefix_prompt " WAIT "
set -g  @mode_indicator_prefix_mode_style "bg=#F2798F,fg=#392735,bold"
set -g  @mode_indicator_copy_prompt    " COPY "
set -g  @mode_indicator_copy_mode_style    "bg=#A1E0AD,fg=#392735,bold"
set -g  @mode_indicator_sync_prompt    " SYNC "
set -g  @mode_indicator_sync_mode_style    "bg=#F7BD8F,fg=#392735,bold"
set -g  @mode_indicator_empty_prompt   " TMUX "
set -g  @mode_indicator_empty_mode_style   "bg=#91C3F6,fg=#392735,bold"
