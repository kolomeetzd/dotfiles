# Default editor.
export EDITOR=nvim
export VISUAL=nvim

# <https://wiki.archlinux.org/title/GnuPG#Configure_pinentry_to_use_the_correct_TTY>
export GPG_TTY="$(tty)"

# Change the delay of pressing Esc key in `vi` mode.
# TODO: Move to the rest of key binding settings.
export KEYTIMEOUT=1

# Pagers settings.
export MANPAGER="bat -p"
export MANWIDTH=${MANWIDTH:-80}
export LESS='-iXF -R --use-color -Dd+r$Du+b'
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"

# Where to find cursor icons.
export XCURSOR_PATH="/usr/share/icons"

# Do not store game (e.g., Roadwarden) savefiles in `$HOME`.
export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME/renpy"
export RENPY_MULTIPERSISTENT="$XDG_DATA_HOME/renpy_shared"

# Make Winetricks use XDG-alike location.
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
