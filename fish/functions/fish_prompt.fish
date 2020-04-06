function fish_prompt
    echo ''

    set_color cyan
	# echo -n (basename $PWD)
    echo -n (prompt_pwd)
    # echo -n ' '
    set_color normal
    
    set -g __fish_git_prompt_showupstream auto
    set -g __fish_git_prompt_char_upstream_equal ''
    set -g __fish_git_prompt_char_upstream_ahead ' ⇡'
    set -g __fish_git_prompt_char_upstream_behind ' ⇣'
    set -g __fish_git_prompt_showcolorhints
    echo -n (__fish_git_prompt ' %s')

    echo ''

    set_color normal
    echo -n '$ '
end

# function fish_prompt
#     if not test $status -eq 0
#         set_color $fish_color_error
#     else if test -n "$SSH_TTY"
#         set_color FF69B4
#     else
#         set_color $fish_color_cwd
#     end

#     echo -n '$ '
#     set_color normal
# end
