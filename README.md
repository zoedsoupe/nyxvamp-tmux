# nyxvamp (tmux)

a minimalist theme collection, inspired by a blend of gothic and emo aesthetics with transfem symbolism. it combines deep purples and soft yellows with neutral tones to create strong contrasts and a comfortable terminal multiplexer environment that reflects individuality.

## variations

1. **veil**: versatile theme for both day and night, featuring bright accents on a dark background.

<img src="./assets/nyxvamp-veil.png" />

2. **obsidian**: dark theme for focused nighttime coding sessions.

<img src="./assets/nyxvamp-obsidian.png" />

3. **radiance**: light theme optimized for daylight use, ensuring excellent readability.

<img src="./assets/nyxvamp-radiance.png" />

4. **jhujuba**: pink-tinted mid-dark theme, sweeter than veil.

5. **transparent**: veil colors with `bg=default` everywhere — for terminals with background opacity.

<img src="./assets/nyxvamp-transparent.png" />

## usage

1. download theme files
 - `nyxvamp-veil.tmux`
 - `nyxvamp-obsidian.tmux`
 - `nyxvamp-radiance.tmux`
 - `nyxvamp-jhujuba.tmux`
 - `nyxvamp-transparent.tmux`
2. place into a tmux themes directory
 - unix: `~/.config/tmux/themes/`
 - macos: `~/.config/tmux/themes/`
3. source the theme from your `~/.tmux.conf` (or `~/.config/tmux/tmux.conf`)

```tmux
source-file ~/.config/tmux/themes/nyxvamp-veil.tmux
```

reload tmux config: `tmux source-file ~/.tmux.conf` or `prefix + r` if bound.

## options

set these **before** sourcing the theme file:

| option | values | default |
|---|---|---|
| `@nyxvamp_status_position` | `bottom` \| `top` | `bottom` |
| `@nyxvamp_time_format` | strftime string | `%H:%M` |
| `@nyxvamp_date_format` | strftime string | `%Y-%m-%d` |
| `@nyxvamp_show_mode_indicator` | `on` \| `off` | `on` |

example:

```tmux
set -g @nyxvamp_status_position 'top'
set -g @nyxvamp_time_format '%H:%M:%S'
source-file ~/.config/tmux/themes/nyxvamp-veil.tmux
```

## recommended plugins

the theme integrates with [tmux-plugins/tmux-mode-indicator](https://github.com/MunifTanjim/tmux-mode-indicator) for a colored prefix/copy/sync mode badge in the status-right. install via tpm:

```tmux
set -g @plugin 'MunifTanjim/tmux-mode-indicator'
```

without the plugin the theme falls back to a plain time/date status-right (set `@nyxvamp_show_mode_indicator 'off'` to skip the placeholder).

## requirements

- tmux 3.0+ (uses `%if` conditionals and 24-bit color)
- a true-color terminal: ensure `set -g default-terminal "tmux-256color"` and `set -ag terminal-overrides ",xterm-256color:RGB"` (or your `$TERM`'s equivalent) are set in your config

## contribution

if you have suggestions or improvements, feel free to contribute or reach out.
