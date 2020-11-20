export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=vim

export GEM_HOME=~/.gem

export ANDROID_HOME=~/Library/Android/sdk
export GOPATH=~/Code/Vendor/go
export GOROOT=/usr/local/opt/go/libexec

export PATH=~/.bin:$GEM_HOME/bin:/usr/local/bin:/usr/local/sbin:~/Library/Python/2.7/bin:$PATH

# enable completions
autoload -U compinit  && compinit

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# history search with up/down arrow
bindkey '^[[A' up-line-or-search # up arrow
bindkey '^[[B' down-line-or-search # down arrow 

# ====
# Prompt
# ====

autoload -U colors && colors
autoload -U promptinit && promptinit

PROMPT='%F{blue}%1~%f$ '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}%b%f'
zstyle ':vcs_info:*' enable git

# ====
# Alias
# ====

alias ll='ls -laG'
alias g='git status -sb'
alias gc='git commit'
alias gca='git commit --all'
alias gs='git switch'
alias gd='git diff'

alias ic='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/'

alias ..='cd ..'
alias be='bundle exec'
alias bi='bundle install'
alias bef='bundle exec fastlane'
alias x='xed .'
alias e='nova'
alias xcversion='FASTLANE_USER=ci@flightyapp.com xcversion'

# ====
# Misc
# ===

if [[ -f $HOME/.secrets ]]; then
    source $HOME/.secrets
fi

# z (autojump)
. ~/.zsh/z/z.sh

# direnv
# https://direnv.net/
eval "$(direnv hook zsh)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

