#!/usr/bin/env zsh

# file: $ZDOTDIR/conf.d/01-environment
#
# User environment variables.

# Set default editor to Neovim.
export EDITOR=nvim
export VISUAL=nvim

# Configure GPG to use current TTY for pinentry.
# See: <https://wiki.archlinux.org/title/GnuPG#Configure_pinentry_to_use_the_correct_TTY>.
export GPG_TTY="$(tty)"

# Pager configurations.
export MANPAGER="bat -p"
export MANWIDTH=${MANWIDTH:-80}
export LESS='-iXF -R --use-color -Dd+r$Du+b'
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"

# Cursor icon paths.
export XCURSOR_PATH="/usr/share/icons"

# Redirect game savefiles to XDG-compliant locations.
export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME/renpy"
export RENPY_MULTIPERSISTENT="$XDG_DATA_HOME/renpy_shared"

# Set Winetricks prefix to XDG data directory.
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
