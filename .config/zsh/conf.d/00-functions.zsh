#!/usr/bin/env zsh

# file: ~/.config/zsh/conf.d/00-functions.zsh
#
# Specifies where Zsh should look for autoloadable user functions.

export ZFUNCDIR="$ZDOTDIR/functions"
[[ -d $ZFUNCDIR ]] || mkdir -p "$ZFUNCDIR"

fpath=("$ZFUNCDIR" "${(@)fpath}")
typeset -U fpath
