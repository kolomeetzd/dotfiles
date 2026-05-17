#!/usr/bin/env zsh

# 06-keybinds.zsh - Manages shell keybindings.
#
# TODO: Refactor using <https://wiki.archlinux.org/title/Zsh#Key_bindings>.

bindkey -v

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^P' up-line-or-beginning-search
bindkey '^N' down-line-or-beginning-search
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line

## Fix Ctrl+Right/Left.
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
# Conflicts with <https://wiki.archlinux.org/title/Fzf#Zsh>.
# bindkey '^r' history-incremental-search-backward

bindkey -s '^[f' '~/.local/bin/tmux-sessionizer^M'
# bindkey -s '^[d' '~/.local/share/scripts/todo.sh^M'
bindkey -s '^[s' '~/.local/bin/tmux-sessionizer ~/.local/share/scripts/^M'
bindkey -s '^[t' '~/.local/bin/tmux-sessionizer ~/.config/tmux/^M'
bindkey -s '^[v' '~/.local/bin/tmux-sessionizer ~/.config/nvim/^M'
