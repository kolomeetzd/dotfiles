#!/usr/bin/env zsh

# file: $ZDOTDIR/conf.d/05-colors.zsh
#
# Manage output colors configurations.

# Use XDG dirs for color setup.
eval $(dircolors "$XDG_CONFIG_HOME"/dircolors)

# Re-use Xresources colors in the Linux virtual console.
# See: <https://wiki.archlinux.org/title/Color_output_in_console#Virtual_console>.
if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" "$XDG_CONFIG_HOME/X11/xresources" | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi
