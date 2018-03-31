set fish_greeting

set -x EDITOR vim
set -x MANPAGER vimpager

set -x PATH $HOME/.bin /usr/local/bin /usr/local/sbin $PATH

# Android
if test -d $HOME/Library/Android/sdk
  set -x ANDROID_HOME $HOME/Library/Android/sdk
  set -x PATH $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
end

abbr -a emulator $ANDROID_HOME/tools/emulator

# Git
abbr -a g git status
abbr -a gs git status -sb
abbr -a gc git commit

function gca
  git add -A $argv
  git commit
end

function gcam
  git add -A
  git commit -m "$argv"
end

# node
set -x NPM_PACKAGES $HOME/.npm-packages
set -x PATH $NPM_PACKAGES/bin $PATH
set -x MANPATH $NPM_PACKAGES/share/man $MANPATH

# ruby
status --is-interactive; and source (rbenv init -|psub)
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

abbr -a be bundle exec
abbr -a bi bundle install
abbr -a bef bundle exec fastlane

# python
eval (python -m virtualfish)