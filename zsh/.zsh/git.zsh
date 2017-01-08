# alias hub to git
eval "$(hub alias -s)"

alias g='git status -sb'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcam='git add -A; git commit -m'
alias cleanup_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias t='gittower .'
alias gd='git diff'
alias gP='git push'
alias gp='git pull --rebase'
alias gg='git log --graph --oneline --decorate --date=relative --all'
alias gs='git status -sb'