# Use hub wrapper
# eval "$(hub alias -s)"

alias gsu='git submodule update --init --recursive'
alias gs='git status -sb'
alias gut='git'
alias cleanup_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gd='git diff'
alias gc='git commit'
alias gca='git add -A && git commit'
alias gcam='git add -A && git commit -m'
alias gcams='"/Users/florian/Code/Vendor/spacecommander"/format-objc-files.sh -s && git add -A && git commit -m'
alias gg='git log --graph --abbrev-commit --decorate --format=oneline'
alias gt='gittower .'
alias gp='git push'
