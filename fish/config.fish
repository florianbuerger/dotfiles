set fish_greeting

set -x EDITOR vim
set -x MANPAGER vimpager

set -x PATH $HOME/.bin /usr/local/bin /usr/local/sbin $PATH

# node
set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $NPM_PACKAGES/bin $PATH
set -x MANPATH $NPM_PACKAGES/share/man $MANPATH
