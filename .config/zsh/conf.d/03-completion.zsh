#!/usr/bin/env zsh

# 03-completion.zsh - Manages Zsh's completion system.
#
# - Configures menu selection, case sensitivity, etc.
# - Sources completion plugins (e.g., fzf).
# - Keep this file lightweight; move heavy logic to functions.
# - Must be placed in $ZDOTDIR/conf.d (loaded by .zshrc).

# USER CONFIGURATION

# Use XDG dirs for completion.
# <https://wiki.archlinux.org/title/XDG_Base_Directory#Partial>
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

# Enable autocompletion with an arrow-key driven interface.
zstyle ':completion:*' menu select
# Complete a command starting with sudo.
zstyle ':completion::complete:*' gain-privileges 1

# May incur a performance penalty due to constant rehashing.
# Use pacman hook to automatically request a rehash instead.
# See: <https://wiki.archlinux.org/title/Zsh#On-demand_rehash>.
#
# zstyle ':completion:*' rehash true

# Configure `completer` style that determines
# what completion methods are tried.
#
# NOTE: The order matters - each strategy is tried in sequence until one succeeds.
# - Try basic completion first.
# - If that fails, attempt to correct typos.
# - If still no match, find approximate matches.
# - Finally, try expanding any aliases before completing.
zstyle ':completion:*' completer _complete _correct _approximate _expand_alias

# Configure `expand` style that determines
# how partial matches are displayed/expanded.
#
# NOTE: This configuration doesn't affect the menu selection behavior.
# It completes partial matches at the beginning (`prefix`) or
# at the end (`suffix`) of words.
# - When there's exactly one match.
# - User is not in menu selection mode.
# - <Tab> pressed multiple times (to trigger expansion).
zstyle ':completion:*' expand prefix suffix

# Configure group name display and description formattig in completion menu.
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}%B%d%b%f'

# Configure default colors for 'file' group completion items (files, directories, etc.).
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# EXTERNAL SOURCES

# Fzf completion.
#
# See: <https://wiki.archlinux.org/title/Fzf#Zsh>.
source <(fzf --zsh)

# Git completion.
#
# - Apparently, Zsh includes built-in Git completion
#   (see: <https://git-scm.com/book/en/v2/Appendix-A:-Git-in-Other-Environments-Git-in-Zsh>).
# - Git's contrib repo provides `git-completion.zsh`
#   (see: <https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh>).
#   TODO: verify if manual sourcing is needed.
#   source /usr/share/git/completion/git-completion.zsh
# - `zsh-completions` package adds support for: gist, git-flow, git-pulls, git-revise, git-wtf
#   TODO: check if base Git commands are covered.
#   (see: <https://github.com/zsh-users/zsh-completions/tree/master/src>)
# - Prefer native Zsh completion unless additional features are required.
