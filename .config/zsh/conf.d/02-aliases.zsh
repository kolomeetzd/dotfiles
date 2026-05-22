#!/usr/bin/env zsh

# file: $ZDOTDIR/conf.d/02-aliases
#
# Common command aliases.

# Colorized ls output.
alias ls='ls --color=auto'
alias ll='ls -l'

# Colorized grep/diff output.
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Plain-text pager using bat.
# bat --style=plain --paging=never
alias more='bat -pp'

# Verbose file operations with correction disabled.
alias cp='nocorrect cp -v'
alias mv='nocorrect mv -v'
alias rm='nocorrect rm -v'
alias git='nocorrect /usr/bin/git'

# Open supported files with zathura.
alias -s {epub,pdf,djvu}='zathura'

# Force locale for Steam.
alias steam='LANG=ru_RU.UTF8 /usr/bin/steam'

# Quick weather lookup.
alias weather='curl -s -q wttr.in/stavropol'

# Go linting with golangci-lint.
alias lint='nocorrect go run github.com/golangci/golangci-lint/cmd/golangci-lint@v1.61.0 run ./...'

# Run Go tests with coverage, race detection, and atomic mode.
alias test='go test ./... -cover -coverprofile=./cover.out -covermode=atomic -race -count 1'

# Manage dotfiles via bare git repo.
alias dotfiles='/usr/bin/git --git-dir="${HOME}/personal/dotfiles/" --work-tree="$HOME"'

# Persist wget HSTS data in XDG state dir.
alias wget='wget --hsts-file="$XDG_STATE_HOME/wget/wget-hsts"'
