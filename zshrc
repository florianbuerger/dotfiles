# ======================================
#   Plugins
# ======================================

eval "$(fasd --init auto)"
eval "$(direnv hook zsh)"
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# ===================
#    AUTOCOMPLETION
# ===================
autoload -Uz compinit
compinit

autoload bashcompinit
bashcompinit

zmodload -i zsh/complist

WORDCHARS=''

unsetopt menu_complete # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# autocompletion with an arrow-key driven interface
zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
    clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
    gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
    ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
    named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
    operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
    rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
    usbmux uucp vcsa wwwrun xfs '_*'

zstyle '*' single-ignored show

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# ===================
#    MISC SETTINGS
# ===================

# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

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
setopt LOCAL_TRAPS   # allow functions to have local traps
setopt COMPLETE_IN_WORD
setopt extended_glob

# ======================================
#   HISTORY
# ======================================

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_VERIFY
setopt SHARE_HISTORY                    # share history between sessions
setopt EXTENDED_HISTORY                 # add timestamps to history
setopt APPEND_HISTORY                   # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS             # dont record dupes in history
setopt HIST_REDUCE_BLANKS

# ======================================
#   ALIAS
# ======================================

alias o='open .'
alias ..='cd ..'
# alias ls='ls --color'
alias la="ls -lhFAG"
alias ll="ls -lahL"
alias glow="glow -s light -w 80"

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
alias g='git status -sb'
alias gs='git switch'
alias gut='git'
alias gd='git diff'
alias gc='git commit'
alias gco='git checkout'
alias gca='git add -A && git commit'
alias gcamend='gca --amend --no-edit'
alias gg='git log --graph --abbrev-commit --decorate --format=oneline'
alias ggr='git log --graph --abbrev-commit --decorate --format=oneline HEAD..origin/$(git rev-parse --abbrev-ref HEAD)'
alias gt='gittower .'
alias cleanup-branches='git branch --merged | egrep -v "(^\*|master|dev|beta|release)" | xargs git branch -d'
alias gm='git merge --ff-only'
alias gmn='git merge --no-ff'
alias gp='git push'

alias e=code
alias ci="mosh --ssh='ssh -p 7001' --server=/usr/local/bin/mosh-server MacPro-Xeon-Standard-1016@connect.remotemac.io -p 7001"
alias rm="trash"

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

# ======================================
#   Prompt
# ======================================

autoload -U colors && colors
autoload -Uz vcs_info
autoload -U promptinit
promptinit
setopt promptsubst

if [ "$TERM_PROGRAM" = "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
        local SEARCH=' '
        local REPLACE='%20'
        local PWD_URL="file://$HOST${PWD//$SEARCH/$REPLACE}"
        printf '\e]7;%s\a' "$PWD_URL"
    }
    autoload add-zsh-hook
    add-zsh-hook chpwd update_terminal_cwd
    update_terminal_cwd
fi

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' actionformats "%{$fg[yellow]%}%b (%a)%{$reset_color%}"
zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}%b%{$reset_color%}"
precmd() {
    vcs_info
}

PROMPT_PATH=
PROMPT_SYMBOL=%#

PROMPT='%{%F{cyan}%}%1~%{$reset_color%}%# '
RPROMPT='${vcs_info_msg_0_}'

# ======================================
#   Languages
# ======================================

# iOS
alias ios_sim_statusbar="xcrun simctl status_bar booted override --time '9:41' --cellularMode active --batteryState charged"
alias x="xed ."
[ -f $HOME/.zsh/ios-simulator.zsh ] && source $HOME/.zsh/ios-simulator.zsh

# Ruby
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
alias be='bundle exec'
alias bi='bundle install'

# Android
alias emulator=$ANDROID_HOME/tools/emulator

# ======================================
#   TOOLS
# ======================================

alias z='fasd_cd -d' # cd, same functionality as j in autojump

# open man pages in Preview, usage help <comand>
function help() {
    man -t $1 | open -f -a /System/Applications/Preview.app
}

# FZF
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# ctrl+o opens Visual Studio Code on current folder or file
FZF_DEFAULT_OPTS="--height 80% --bind='ctrl-o:execute-silent(code {})+abort'"

# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\/.*;\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"

# netlify
if [ -f '$HOME/.netlify/helper/path.zsh.inc' ]; then source '$HOME/.netlify/helper/path.zsh.inc'; fi

# ssh agent (via keychain -> brew install keychain)
eval `keychain --eval --agents ssh --inherit any id_rsa --quiet`

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
