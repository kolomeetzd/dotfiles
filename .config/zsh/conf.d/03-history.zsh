#!/usr/bin/env zsh

# 03-history.zsh - Configures Zsh's history system with XDG-compliant storage.
# - Sets history file location in `$XDG_STATE_HOME/zsh`.
# - Configures size limits and duplicate handling.
# - Should be placed in `$ZDOTDIR/conf.d`.

# Use XDG dirs for history files.
[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# Limit the maximum number of events to keep
# in the internal history list (`HISTSIZE`) and
# in the history file (`SAVEHIST`).
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

# Turn on spelling correction or commands and
# for all arguments.
setopt correctall

# Don't store history commands starting with space.
setopt hist_ignore_space

# Remove duplicate entries from history list.
setopt hist_ignore_all_dups

# Enable shared history between sessions.
setopt share_history

# Do not execute immediately upon history expansion.
setopt hist_verify
