#!/usr/bin/env zsh

# ~/.zshenv - Used for setting user's environment variables.
#
# It should not contain commands that produce output or assume the shell is attached to a TTY.
# When this file exists it will always be read.
#
# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!
#
# See: <https://wiki.archlinux.org/title/Zsh#Startup/Shutdown_files>

# Maintaine all XDG directory setup.
# See: <https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories>.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Set ZDOTDIR to re-home Zsh config files.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# Specify where Zsh should look for autoloadable user functions.
export ZFUNCDIR="$ZDOTDIR/functions"
fpath=($ZFUNCDIR $fpath)

# Use XDG dirs with `xinit`.
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc

# Override GnuPG home directory.
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# Configure Go to respect XDG Base Directory specification.
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# Configure Python to respect XDG Base Directory specification.
export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHONUSERBASE="$XDG_DATA_HOME/python"

# Configure Vagrant to respect XDG Base Directory specification.
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME/vagrant/aliases"

# Configure wget to respect XDG Base Directory specification.
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# Add directories to $PATH safely.
#
# NOTE: Glob qualifier (N) is unnecessary here because we're not doing pattern matching.
# - The paths are just directory names, not patterns.
# - It only affects pattern matching behavior when no matches are found.
# - Zsh sets the NULL_GLOB option for the current pattern if a directory
#   does not exist or produces no matches, and silently skips it
#   instead of throwing a "no matches found" error.
#
# See: <https://zsh.sourceforge.io/Doc/Release/Expansion.html#Glob-Qualifiers>.
path=(
  $HOME/.local/bin(N)
  /usr/local/go/bin(N)
  $path
)
