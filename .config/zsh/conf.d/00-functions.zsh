#!/usr/bin/env zsh

# file: $ZDOTDIR/conf.d/00-functions.zsh
#
# User function autoload setup.

# Specify where Zsh should look for autoloadable user functions.
export ZFUNCDIR="$ZDOTDIR/functions"
[[ -d $ZFUNCDIR ]] || mkdir -p "$ZFUNCDIR"

# Update $fpath.
fpath=("$ZFUNCDIR" "${(@)fpath}")
typeset -U fpath

# Lazy-load (autoload) function form $ZFUNCDIR.
autoload -Uz $ZFUNCDIR/*(.:t)
