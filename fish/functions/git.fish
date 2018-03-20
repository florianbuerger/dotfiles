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
