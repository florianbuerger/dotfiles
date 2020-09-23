set fish_greeting

set -x  PATH ~/.bin $HOME/Library/Python/3.8/bin /Library/Frameworks/Python.framework/Versions/3.7/bin (brew --prefix)/sbin /usr/sbin $PATH
set -x  LANG en_US.UTF-8
set -x  EDITOR vim

alias t="tmux new -A -s main"
alias cat="bat --theme=ansi-light"
alias ll="exa -l --color always"
alias la="exa -la --color always"

# Generic version manager
source ~/.asdf/asdf.fish

eval (direnv hook fish)
 
alias ci="mosh --ssh='ssh -p 7001' --server=/usr/local/bin/mosh-server MacPro-Xeon-Standard-1016@connect.remotemac.io"
