#!/usr/bin/env zsh

# 04-prompt.zsh - Configures a custom prompt.

# Prompt initialization.
autoload -Uz promptinit
promptinit

prompt off
setopt prompt_subst

# Colorize the prompt char depending of user.
function _prompt_char() {
  if [[ $EUID -eq 0 ]]; then
    echo '%F{9}%#%f'
  else
    echo '%F{10}%#%f'
  fi
}

# Get the current directory length and reduce it to <= 45.
function _current_directory() {
  local _max_pwd_length="45"
  if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
    echo '%-2~/../%1~'
  else
    echo '%~'
  fi
}

# Show Git status.
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{2} ●%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow} ●%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'
zstyle ':vcs_info:*' enable git

precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats '%F{12}/%b%c%u%f%F{12}%f'
    } else {
        zstyle ':vcs_info:*' formats '%F{12}/%b%c%u%f%F{red} ●%f%F{12}%f'
    }
    vcs_info
}

# Show current vi mode.
function vi_mode_prompt_info() {
  VIM_PROMPT="%F{8}✗ n %f"
  VIM_RPROMPT="%F{8}→ i %f"

  echo "${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/$VIM_RPROMPT}"
}

# Show if virtual environment is being used.
function venv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Helps format RPROMPT.
function _current_user() {
  if [[ $(echo "$USER") != "root" ]]; then
    echo "%n";
  else
    echo "%f%F{1}%n%f%F{8}";
  fi
}


# Format custom prompt.
function zle-line-init zle-keymap-select {
  PROMPT='%{%f%k%b%}
 %F{8}$(_current_directory)%f ${vcs_info_msg_0_}
 $(venv_info)$(_prompt_char) '
 RPROMPT='%{$(echotc UP 1)%}$(vi_mode_prompt_info)%F{8}/%l:$(_current_user)@%M%f%{$(echotc DO 1)%}'

  zle reset-prompt
  zle -R
}

# Other settings.
zle -N zle-line-init
zle -N zle-keymap-select

DISABLE_UPDATE_PROMPT=true
