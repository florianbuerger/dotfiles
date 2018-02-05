set fish_greeting

set -x EDITOR vim
set -x MANPAGER vimpager

set -x PATH $HOME/.bin /usr/local/bin /usr/local/sbin $PATH

# fzf
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# node
set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $NPM_PACKAGES/bin $PATH
set -x MANPATH $NPM_PACKAGES/share/man $MANPATH

# ruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
abbr -a be bundle exec
abbr -a bi bundle install

# android
if test -d $HOME/Library/Android/sdk
  set -x ANDROID_HOME $HOME/Library/Android/sdk
  set -x PATH $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
end

abbr -a emulator $ANDROID_HOME/tools/emulator

function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end
