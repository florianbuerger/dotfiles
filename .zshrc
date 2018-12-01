# ======================================
#   Plugins
# ======================================

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "MichaelAquilina/zsh-you-should-use"
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug "zsh-users/zsh-history-substring-search"
zplug "paulirish/git-open", as:plugin, if:"[[ $(command -v git) ]]"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

PURE_PROMPT_SYMBOL="%%"
PURE_CMD_MAX_EXEC_TIME=15

if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

# ======================================
#   ENV
# ======================================

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VISUAL='nvim'
export CLICOLOR=1
autoload colors; colors;

path=(
	~/.bin
	/usr/local/opt/qt@5.5/bin
	/usr/local/opt/mysql@5.5/bin
	/usr/local/sbin
	~/.cargo/bin
	~/Code/Vendor/depot_tools
	$path
)

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

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

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
#   Languages
# ======================================

# Generic version manager
. $HOME/.asdf/asdf.sh

# Ruby
alias be='bundle exec'
alias bi='bundle install'

# Python
path+=(~/Library/Python/2.7/bin)

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

[ -f ~/.zsh/ios-simulator.zsh ] && source ~/.zsh/ios-simulator.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
function p() {
  cd ~/Code/`find ~/Code -type d -maxdepth 2 -depth 2 -print | cut -d '/' -f5,6 | fzf -1 -q "$1"`
}

alias firefox-debug='/Applications/Firefox.app/Contents/MacOS/firefox -start-debugger-server'
alias chrome-debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9223 "localhost:8080"'

