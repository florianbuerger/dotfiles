set c_reset (set_color normal)
set c_cyan (set_color cyan)
set c_light (set_color aaa)
set c_green (set_color green)
set c_magenta (set_color magenta)

# Fish git prompt
# set __fish_git_prompt_showdirtystate 'false'
set __fish_git_prompt_color_branch aaa

# Status Chars
# set __fish_git_prompt_char_dirtystate '*'

function fish_prompt

  printf "%s" $c_reset

  set separator "$c_reset :: "

# User & hose only when in SSH
if begin; set -q SSH_CLIENT; or set -q SSH_TTY; end 
  printf "%s%s" $c_bold (whoami)
  printf "%s" $separator
  printf "%s%s" $c_green (hostname -s)
  printf "%s" $separator
end

  printf "%s%s" $c_bold (prompt_pwd)
  printf "%s" (__fish_git_prompt " :: %s") 

  echo

  printf "%s%s " "\$" $c_reset
end

# I would totally put this in a separate file, but because functions are
# lazy-loaded, the prompt won't actually register this handler until it's
# defined. But fish *knows* to load `fish_prompt` so we're ok if it's over here.
function postexec --on-event fish_postexec
  echo
end
