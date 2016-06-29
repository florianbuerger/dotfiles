# Editor
export EDITOR='nvim'

# Paths
export GEM_HOME=$HOME/.gem
export PATH="$HOME/.bin:$GEM_HOME/bin:usr/local/bin:/usr/local/sbin:$PATH"

# Colors
export CLICOLOR=1
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
setopt PROMPT_SUBST

# RENV
autoload -U ~/.rbenv/shims
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

# Timer
REPORTTIME=10 # print elapsed time when more than 10 seconds

# Quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Tetris
autoload -U tetris
zle -N tetris
bindkey ^T tetris

# Misc options
setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
