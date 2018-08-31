# ===================
#   ENV
# ===================

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR='nvim'
bindkey -e # restore emacs keybindings

# Colors
export CLICOLOR=1
autoload colors; colors;
setopt PROMPT_SUBST
source "$HOME/.local/share/nvim/plugged/gruvbox/gruvbox_256palette.sh"

path=(~/.bin /usr/local/sbin ~/.cargo/bin $path)

# ===================
#   AUTOCOMPLETION
# ===================

fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)
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

# git-flow completions
if [[ -f /usr/local/share/zsh/site-functions/git-flow-completion.zsh ]]; then
  source /usr/local/share/zsh/site-functions/git-flow-completion.zsh
fi

# =============
#   ANDROID
# =============

export ANDROID_HOME='/Users/florian/Library/Android/sdk'
path+=($ANDROID_HOME/tools/bin $ANDROID_HOME/tools $ANDROID_HOME/platform-tools)
alias emulator=$ANDROID_HOME/tools/emulator

# ===================
#   HISTORY
# ===================

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

# ===================
#   ALIAS
# ===================

# Misc
if hash trash 2>/dev/null; then
  alias cat=trash
else
  echo "Run 'brew install trash'!"
fi
alias rm='trash'

# Editor
alias e='$EDITOR'
alias vim='vim'

# cd
alias ..='cd ..'

# ls
alias la="ls -lhFAG"
alias cat="ccat"

# Mac OS X
alias o='open .'
alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
alias hide_desktop_icons='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias show_desktop_icons='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
alias flushdns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder && echo "Be sure to reset Google Chrome as well: 'chrome://net-internals/#dns'"'
alias f='open focus://toggle'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

# Commands starting with % for pasting from web
alias %=' '
alias $=' '

# Xcode
alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias xcode-beta='sudo xcode-select -s /Applications/Xcode-beta.app'
alias xcode-release='sudo xcode-select -s /Applications/Xcode.app'
alias bump='agvtool next-version -all'
alias swiftformat="/usr/local/bin/swiftformat --indent 4"
alias sp='/Users/florian/Code/Vendor/spacecommander/format-objc-files.sh -s'

# UPDATE ALLL THE THINGS
alias update_everything='gem update && gem clean && brew update && brew upgrade && brew prune && brew cleanup && mas upgrade'

# Git
alias git='hub'
alias gsu='git submodule update --init --recursive'
alias gs='git status -sb'
alias gut='git'
alias gd='git diff'
alias gc='git commit'
alias ga='git add -p'
alias gca='git add -A && git commit'
alias gcam='git add -A && git commit -m'
alias gcams='"/Users/florian/Code/Vendor/spacecommander"/format-objc-files.sh -s && git add -A && git commit -m'
alias gg='git log --graph --abbrev-commit --decorate --format=oneline'
alias gt='gittower .'
alias gp='git push'
alias gup='git pull --rebase && git push'
alias t='tig status'
alias cleanup-branches='git branch --merged | egrep -v "(^\*|master|dev|beta|release)" | xargs git branch -d'

alias ts='tmux new-session -s'
alias ta='tmux attach -t'

# xterm-256color-italic will not be available on remote machines
alias ssh='TERM=xterm-256color ssh'
alias mosh='TERM=xterm-256color mosh'

# ===================
#   KEY BINDINGS
# ===================

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

# ===================
#   NODEJS
# ===================

NPM_PACKAGES="${HOME}/.npm-packages"
path+=($NPM_PACKAGES/bin)
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export NVM_DIR="$HOME/.nvm"
alias loadnvm=". $(brew --prefix nvm)/nvm.sh && nvm use --lts"
path+=(~/.yarn/bin)

# ===================
#   PROMPT
# ===================

autoload -Uz vcs_info colors
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' check-for-changes true
zstyle ':vcs_info:git*' stagedstr "%F{red}"
zstyle ':vcs_info:git*' unstagedstr "%F{red}"
precmd() {
  vcs_info
}

zstyle ':vcs_info:git*' formats "%F{green}%c%u%b%f"
zstyle ':vcs_info:git*' actionformats "%F{green}%b|%a%f"

function machine_info() {
  if [[ -n "$SSH_CLIENT" ]]; then
    local user=`whoami`
    echo "%{%F{green}%}$user@%F{yellow}%m%:%f"
  fi
}

PROMPT='$(machine_info)%F{blue}\$%f '
RPROMPT='${vcs_info_msg_0_}'

update_terminal_cwd() {
    # Identify the directory using a "file:" scheme URL,
    # including the host name to disambiguate local vs.
    # remote connections. Percent-escape spaces.
    local SEARCH=' '
    local REPLACE='%20'
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    printf '\e]7;%s\a' "$PWD_URL"

    tab_label=${PWD/${HOME}/\~} # use 'relative' path
    echo -ne "\e]2;${tab_label}\a" # set window title to full string
    echo -ne "\e]1;${tab_label: -24}\a" # set tab title to rightmost 24 characters
}
autoload add-zsh-hook
add-zsh-hook chpwd update_terminal_cwd
update_terminal_cwd

# ===================
#   RUBY
# ===================

eval "$(rbenv init -)"

alias be='bundle exec'
alias bi='bundle install'

# ===================
# Python
# ===================
path+=(~/Library/Python/2.7/bin)

# ===================
#   MISC SETTINGS
# ===================

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

# ===================
#   TOOLS
# ===================

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iOS simulator
[ -f ~/.zsh/ios-simulator.zsh ] && source ~/.zsh/ios-simulator.zsh

# fasd
eval "$(fasd --init auto)"
