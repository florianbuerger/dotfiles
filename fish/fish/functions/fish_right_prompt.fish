function fish_right_prompt
  if git status >/dev/null ^/dev/null
    set_color green -o
    if not test (git status | tail -1) = "nothing to commit, working tree clean"
      set_color red -o
    end
    echo -n (git branch | grep '*' | cut -c3-)
    echo -n " "
  end
end
