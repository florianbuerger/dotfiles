set fish_greeting
set -g fish_prompt_pwd_dir_length 0

set -x LANG "en_US.UTF-8"
set -x LSCOLORS "ExfxcxdxBxegedabagacad"

set -x EDITOR "vim"
set -x VISUAL "vim"
set -x PAGER "less"
set -x LESS "-R"

switch (uname)
case Darwin
  alias ls "ls -G"
case "*"
  alias ls "ls --color=auto"
end

alias l "ls"
alias ll "ls -hl"
alias la "ll -a"

set -x PATH $HOME/.bin /usr/local/sbin $PATH

# Ruby
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

set -l primary_color cyan --bold
set -l secondary_color yellow --bold
set -l error_color red

set fish_color_normal $secondary_color
set fish_color_command $primary_color
set fish_color_quote $secondary_color
set fish_color_redirection $secondary_color
set fish_color_end $secondary_color
set fish_color_error $error_color
set fish_color_param $secondary_color
set fish_color_comment $secondary_color
set fish_color_match $secondary_color
set fish_color_search_match $secondary_color
set fish_color_operator $secondary_color
set fish_color_escape $secondary_color
set fish_color_cwd $secondary_color
