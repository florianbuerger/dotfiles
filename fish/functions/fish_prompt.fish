function fish_prompt
    set_color yellow
    echo -n (basename $PWD)
    set_color normal
	echo -n $normal '$ '
end
