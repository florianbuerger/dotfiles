set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'no'
# set __fish_git_prompt_showuntrackedfiles 'no'
#set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch magenta
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead ' ↑'
set __fish_git_prompt_char_upstream_behind ' ↓'
set __fish_git_prompt_char_upstream_equal ''

function fish_right_prompt
  set last_status $status

  set_color normal

  printf '%s ' (__fish_git_prompt "%s")

  set_color normal
end
