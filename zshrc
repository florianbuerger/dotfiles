# ======================================
#   Plugins
# ======================================


# zplug "MichaelAquilina/zsh-you-should-use"

eval "$(fasd --init auto)"
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/you-should-use/you-should-use.plugin.zsh

# ======================================
#   ENV
# ======================================

export CLICOLOR=1
autoload colors; colors;

path=(
    ~/.bin
    /usr/local/opt/coreutils/libexec/gnubin # prefer coreutils
    /usr/local/opt/qt@5.5/bin
    /usr/local/opt/mysql@5.5/bin
    /usr/local/sbin
    ~/.cargo/bin
    ~/Code/Vendor/depot_tools
    $path
)

eval `dircolors ~/.dircolors`

# Load ssh agent
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

# ======================================
#   AUTOCOMPLETION
# ======================================

fpath=(
	/usr/local/share/zsh-completions
	/usr/local/share/zsh/site-functions
	$HOME/.asdf/completions
	$fpath
)

autoload -Uz compinit
compinit

zmodload -i zsh/complist

WORDCHARS=''

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# autocompletion with an arrow-key driven interface
zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

zstyle '*' single-ignored show

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# Timer
REPORTTIME=10 # print elapsed time when more than 10 seconds

# Quote pasted URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# allow sudo for aliases
alias sudo='sudo '

# Misc options
setopt NO_BG_NICE # dont nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt COMPLETE_IN_WORD
setopt extended_glob

# ======================================
#   HISTORY
# ======================================

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions
setopt EXTENDED_HISTORY # add timestamps to history
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # dont record dupes in history
setopt HIST_REDUCE_BLANKS

# ======================================
#   ALIAS
# ======================================

alias o='open .'
alias ..='cd ..'
alias ls='ls --color'
alias la="ls -lhFAG"
alias ll="ls -lahL"

# Mac OS X
alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
alias hide_desktop_icons='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias show_desktop_icons='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
alias flushdns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder && echo "Be sure to reset Google Chrome as well: chrome://net-internals/#dns'
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

# Commands starting with % for pasting from web
alias %=' '
alias $=' '

# Xcode
alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias bump='agvtool next-version -all'

# UPDATE ALLL THE THINGS
alias update_everything='gem update && gem clean && brew update && brew upgrade && brew prune && brew cleanup && sudo softwareupdate -ia'

# Git
alias git='hub'
alias gs='git status -sb'
alias gut='git'
alias gd='git diff'
alias gc='git commit'
alias gco='git checkout'
alias gca='git add -A && git commit'
alias gg='git log --graph --abbrev-commit --decorate --format=oneline'
alias ggr='git log --graph --abbrev-commit --decorate --format=oneline HEAD..origin/$(git rev-parse --abbrev-ref HEAD)'
alias gt='gittower .'
alias cleanup-branches='git branch --merged | egrep -v "(^\*|master|dev|beta|release)" | xargs git branch -d'
alias gm='git merge'
alias gp='git push'

# ======================================
#   KEY BINDINGS
# ======================================

bindkey -e # restore emacs keybindings
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[5D' beginning-of-line
bindkey '^[[5C' end-of-line
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Only useful in Terminal.app
# update_terminal_cwd() {
#     # Identify the directory using a "file:" scheme URL,
#     # including the host name to disambiguate local vs.
#     # remote connections. Percent-escape spaces.
#     local SEARCH=' '
#     local REPLACE='%20'
#     local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
#     printf '\e]7;%s\a' "$PWD_URL"
#     # echo -ne "\e]1;$PWD\a"
# }
# autoload add-zsh-hook
# add-zsh-hook chpwd update_terminal_cwd
# add-zsh-hook precmd vcs_info
# update_terminal_cwd

# ======================================
#   Prompt
# ======================================

setopt prompt_subst
autoload -U promptinit; promptinit

# prompt defaults, unless these have already been overridden
[ -z "$PROMPT_PURE_SUCCESS_COLOR" ] && PROMPT_PURE_SUCCESS_COLOR="%F{cyan}"
[ -z "$PROMPT_PURE_NO_SUBMODULES" ] && PROMPT_PURE_NO_SUBMODULES="--ignore-submodules"
[ -z "$PROMPT_PURE_DIR_COLOR" ] && PROMPT_PURE_DIR_COLOR="%F{red}"
[ -z "$PURE_NO_SSH_USERNAME" ] && PURE_NO_SSH_USERNAME=1
[ -z "$PURE_GIT_PULL" ] && PURE_GIT_PULL=0

prompt pure

# ======================================
#   Languages
# ======================================

# Generic version manager
. $HOME/.asdf/asdf.sh

# Ruby
alias be='bundle exec'
alias bi='bundle install'

# Android
export ANDROID_HOME='/Users/florian/Library/Android/sdk'
path+=(
    $ANDROID_HOME/tools/bin
    $ANDROID_HOME/tools
    $ANDROID_HOME/platform-tools
)
alias emulator=$ANDROID_HOME/tools/emulator

# ======================================
#   TOOLS
# ======================================

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

[ -f ~/.zsh/ios-simulator.zsh ] && source ~/.zsh/ios-simulator.zsh

alias firefox-debug='/Applications/Firefox.app/Contents/MacOS/firefox -start-debugger-server'
alias chrome-debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9223 "localhost:8080"'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
