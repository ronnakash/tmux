#!/bin/bash

icon_nvim=""
icon_zsh=""

set -x

# Loop over each window and set its icon based on its name
tmux list-windows -F "#{window_index}:#{window_name}" | while IFS=: read -r index name; do
    case "$name" in
        "nvim") tmux set-window-option -t "$index" @catppuccin_window_current_text "#W $icon_nvim" ;;
        "zsh") tmux set-window-option -t "$index" @catppuccin_window_current_text "#W $icon_zsh" ;;
        *) tmux set-window-option -t "$index" @catppuccin_window_current_text "#W" ;;
    esac
done

