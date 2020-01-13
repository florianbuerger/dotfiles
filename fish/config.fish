set fish_greeting

set -x  PATH ~/.bin /Library/Frameworks/Python.framework/Versions/3.7/bin (brew --prefix)/sbin /usr/sbin $PATH
set -x  LANG en_US.UTF-8
set -x  EDITOR nvim

alias t="tmux new -A -s main"

# Generic version manager
source ~/.asdf/asdf.fish

eval (direnv hook fish)
 
alias ci="mosh --ssh='ssh -p 7001' --server=/usr/local/bin/mosh-server MacPro-Xeon-Standard-1016@connect.remotemac.io -p 7001"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

