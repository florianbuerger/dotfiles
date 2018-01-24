# Editor
export EDITOR='vim'

# Colors
export CLICOLOR=1
autoload colors; colors;
#export LSCOLORS="Gxfxcxdxbxegedabagacad"
setopt PROMPT_SUBST

# Timer
REPORTTIME=10 # print elapsed time when more than 10 seconds

# Quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# allow sudo for aliases
alias sudo='sudo '

# Misc options
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt COMPLETE_IN_WORD
