abbr -a gco git checkout
abbr -a gs git switch
abbr -a gca 'git add -A && git commit'
abbr -a gcam 'git add -A && git commit -m'
abbr -a gd git diff
abbr -a gdc git diff --cached
abbr -a gt gittower .
abbr -a gf git fetch
abbr -a gp git push
abbr -a g git status -sb
abbr -a gc git commit
abbr -a gu git unmerged

abbr -a gm git merge --ff-only
abbr -a gmn git merge --no-ff

alias gg='git log --graph --abbrev-commit --decorate --format=oneline'
alias ggr='git log --graph --abbrev-commit --decorate --format=oneline HEAD..origin/(git rev-parse --abbrev-ref HEAD)'
