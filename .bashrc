alias ll="ls -lahL"
alias t="gittower ."
alias o="open ."
alias ..="cd .."

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

export EDITOR="vim"
export CLICOLOR=1
export PATH="$HOME/.bin:$PATH:/opt/local/sbin"

# ruby - fastlane doesn't work with ruby < 2.3 :(
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

export PS1='\[\033[34m\]\W$(__git_ps1 "(%s)")$\[\033[0m\] '
