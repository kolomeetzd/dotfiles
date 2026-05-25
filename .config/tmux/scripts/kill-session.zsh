#!/usr/bin/env zsh

local w_count=$(tmux display-message -p "#{session_windows}")
local p_count=$(tmux display-message -p "#{window_panes}")
local p_cmd=$(tmux display-message -p "#{pane_current_command}")

if [ $w_count -gt 1 ] || [ $p_count -gt 1 ] \
    || [ $p_cmd != "$(basename $SHELL)" ]; then
        tmux display-message "Cancel kill-session."
        exit 0
fi

local sesh_count=$(tmux list-sessions -F "#{session_name}" | wc -l)
if [ $sesh_count -ge 2 ]; then
    tmux switch-client -ln
fi

local sesh_current=$(tmux display-message -p "#{session_name}")
tmux kill-session -t $(tmux display-message -p "#{session_name}")
