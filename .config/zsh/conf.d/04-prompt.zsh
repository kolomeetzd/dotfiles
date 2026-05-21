#!/usr/bin/env zsh

# 04-prompt.zsh - Configures a custom prompt.

# reset_color='%f%k%b'

# 1. Prompt system init
autoload -Uz promptinit
promptinit

# 2. Global options

# Enables prompt substitution.
setopt prompt_subst

# 3. Helper functions

# Colorizes username (%n) based on $EUID.
function _current_user() {
  [[ $EUID -eq 0 ]] && print - '%F{1}%n%f' || print - '%F{8}%n%f'
}

# [user@host]
function _user_host() {
    print - '$(_current_user)%F{8}@%m%f'
}

function _line_tty() {
    print - '%F{8}/%y%f'
}

# Truncates current directory to ~/../dir if $PWD > 45 chars.
function _current_dir() {
    local pwd_s='%~'

    [[ ${#PWD} -gt 45 ]] && pwd_s='%-2~/../%1~'

    print -P '%F{8}$pwd_s%f'
}

# Colorizes prompt symbol based on privileges.
function _prompt_char() {
    [[ $EUID -eq 0 ]] && print - '%F{1}%#%f' || print - '%F{2}%#%f'
}

# Show if python virtual environment is being used.
function _venv_info {
    print -P '%F{6}[venv:$(basename $VIRTUAL_ENV)]%f'
}

# 4. Git integration: vcs_info + styles

autoload -Uz vcs_info

# Enables git integration for vcs_info.
#
# NOTE: Not required — git support is enabled by default.
#       Keep this commented line as a reference for future use.
# zstyle ':vcs_info:*' enable git

# # Formats the VCS prompt for SVN, SVK, and BZR.
#
# NOTE: Not required — I use only git.
#       Keep this line commented as a reference for future use.
# zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'

# Enables scanning for changes in the git repository.
zstyle ':vcs_info:git:*' check-for-changes true

# Fetches current revision identifier (commit hash for git).
# Makes %i available in formats/actionformats.
# Small performance cost.
# NOTE: Not required - we don't use %i in the prompt message.
#       Keep this line commented as a reference for future use.
# zstyle ':vcs_info:*' get-revision true

# Explicitly enables check for staged changes.
# Often redundant when `check-for-changes true` is set,
# but makes staged detection (%c) more reliable in some backends.
# NOTE: Not required - `check-for-check` is already set.
#       Keep this line commented as a reference for future use.
# zstyle ':vcs_info:*' check-for-staged-changes true

# Displays git status in normal state.
# %b - branch name, %c - staged changes marker, %u - unstaged changes marker.
zstyle ':vcs_info:git:*' formats '%F{4}/%b%f%c%u' # Blue text for branch name.
# Displays git status during special operations (e.g., rebase, merge, bisect).
# %a - current action being performed.
zstyle ':vcs_info:git:*' actionformats '%F{4}/%b%f::%F{6}a%%fc%u%f' # Cyan for action.

# Defines marker styles for changes in the git repository.
zstyle ':vcs_info:git:*' stagedstr   '%F{2} ●%f'  # Green dot for staged changes.
zstyle ':vcs_info:git:*' unstagedstr '%F{3} ●%f'  # Yellow dot for unstaged changes.

# Shows marker if there are untracked files in repository.
# NOTE: Make sure you have added unstaged (%u) to your 'formats'.
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        # This will show the marker if there are any untracked files in repo.
        git status --porcelain | grep -q '^?? ' 2> /dev/null ; then
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[unstaged]+='%F{1} ●%f' # Red dot for untracked files.
    fi
}

# NOTE: vcs_info also able to:
#       - Compare local changes to remote changes (+N/-N).
#       - Show remote branch name for remote-tracking branches.
#       - And more.
#       - See: <https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples>

# 5. precmd function

# Use precmd hook to rebuild PROMPT dynamically on every prompt.
# Static assignment would freeze $( ) expansions at setup time.
# Adds vcs_info functionality to existing setups.
function _thewayilikeit_precmd() {
    vcs_info

    [[ -n $VIRTUAL_ENV ]] && PROMPT="$(_current_dir) $(_venv_info)" || PROMPT="$(_current_dir)"
    [[ -n ${vcs_info_msg_0_} ]] && PROMPT+=" ${vcs_info_msg_0_}"

    PROMPT+=$'\n'
    PROMPT+="$(_prompt_char) "

    RPROMPT="$(_line_tty)%F{8}:%f$(_user_host)"
}

# 6. Theme setup

prompt_thewayilikeit_setup() {
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd _thewayilikeit_precmd
}

# 7. Register and load theme

# Add the theme to promptsys.
prompt_themes+=( thewayilikeit )
typeset -U prompt_themes

# Load it.
prompt thewayilikeit
