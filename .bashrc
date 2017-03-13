alias ll="ls -lahL"
alias t="gittower ."
alias o="open ."
alias ..="cd .."

export EDITOR="vim"
export CLICOLOR=1
export PATH="$HOME/.bin:$PATH:/opt/local/sbin"

# ruby - fastlane doesn't work with ruby < 2.3 :(
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# prompt
function parse_git_branch {
git branch --no-color 2> /dev/null \
  | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1)/"
}

export PS1='\[\033[34m\]\W$(parse_git_branch)$\[\033[0m\] '
