alias ls='ls --color=auto'
alias ll='ls -l'

alias grep='grep --color=auto'
alias diff='diff --color=auto'

# bat --style=plain --paging=never
alias more='bat -pp'

alias cp='nocorrect cp -v'
alias mv='nocorrect mv -v'
alias rm='nocorrect rm -v'
alias git='nocorrect /usr/bin/git'

alias -s {epub,pdf,djvu}='zathura'

alias steam='LANG=ru_RU.UTF8 /usr/bin/steam'

alias weather='curl -s -q wttr.in/stavropol'

alias lint='nocorrect go run github.com/golangci/golangci-lint/cmd/golangci-lint@v1.61.0 run ./...'
alias test='go test ./... -cover -coverprofile=./cover.out -covermode=atomic -race -count 1'

alias dotfiles='/usr/bin/git --git-dir="${HOME}/personal/dotfiles/" --work-tree="$HOME"'

alias wget='wget --hsts-file="$XDG_STATE_HOME/wget/wget-hsts"'
