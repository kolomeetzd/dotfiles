# Default editor.
export EDITOR=nvim
export VISUAL=nvim

# <https://wiki.archlinux.org/title/GnuPG#Configure_pinentry_to_use_the_correct_TTY>
# TODO: Move into separate file.
export GPG_TTY="$(tty)"

# Change the delay of pressing Esc key in `vi` mode.
# TODO: Move to the rest of key binding settings.
export KEYTIMEOUT=1

# Pagers settings.
export MANPAGER="bat"
export MANWIDTH=${MANWIDTH:-80}
export LESS='-iXF -R --use-color -Dd+r$Du+b'
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"

# Custom paths.
export GOPATH="${XDG_DATA_HOME}/go"
export VAGRANT_HOME="${XDG_DATA_HOME}/vagrant"
export XCURSOR_PATH="/usr/share/icons"

# X11 settings I configured previously but
# don't recall the purpose.
# Keeping them here for future reference.
#
# export LIBVA_DRIVER_NAME=vdpau
# export VDPAU_DRIVER=nvidia
# export XDG_SESSION_TYPE=x11
# export QT_QPA_PLATFORMTHEME=gtk2
# export DESKTOP_SESSION=gnome
# export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# export SAL_USE_VCLPLUGIN=gtk3
