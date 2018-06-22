set fish_greeting

set -x EDITOR vim
set -x MANPAGER vimpager

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -x PATH $HOME/.bin /usr/local/bin /usr/local/sbin $PATH

abbr -a be bundle exec
abbr -a bi bundle install
abbr -a bef bundle exec fastlane
abbr -a bep bundle exec pod

# Local secrets (e.g. fastlane user/password)
if test -e ~/.secrets.fish
    . ~/.secrets.fish
end
