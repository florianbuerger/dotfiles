set fish_greeting

set -x LANG en_US.UTF-8

set -x EDITOR vim

set -gx PATH ~/.bin /usr/local/sbin $PATH
set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths

eval (direnv hook fish)
