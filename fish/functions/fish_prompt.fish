function fish_prompt
    set_color blue -o
    echo -n (basename $PWD)
    set_color normal -o
    echo -n "\$ "
end
