set fish_greeting

set -x LANG "en_US.UTF-8"
# set -x LSCOLORS "ExfxcxdxBxegedabagacad"
set -x LSCOLORS Gxfxcxdxbxegedabagacad

set -x EDITOR "vim"
set -x PAGER "vimpager"

set -x PATH $HOME/.bin /usr/local/sbin $PATH

# Ruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

set fish_color_autosuggestion white
set fish_color_error red

set fish_pager_color_progress white
