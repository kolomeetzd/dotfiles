#!/usr/bin/env zsh

# 06-keybinds.zsh - Manages shell keybindings.
#
# TODO: Refactor using <https://wiki.archlinux.org/title/Zsh#Key_bindings>.

bindkey -v

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Fix Ctrl+Right/Left.
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^h" backward-delete-char
bindkey "^w" backward-kill-word
# Conflicts with <https://wiki.archlinux.org/title/Fzf#Zsh>.
# bindkey "^r" history-incremental-search-backward

# Tmux sessionizer defaults.
bindkey -s "^[f" "$HOME/.local/bin/zsesh^M"
bindkey -s "^[t" "$HOME/.local/bin/zsesh $XDG_CONFIG_HOME/nvim^M"
bindkey -s "^[v" "$HOME/.local/bin/zsesh $XDG_CONFIG_HOME/tmux^M"

# bindkey -s "^[d" "$HOME/.local/bin/todo.sh^M"
