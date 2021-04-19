export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=vim

export GEM_HOME=~/.gem

export ANDROID_HOME=~/Library/Android/sdk
export GOPATH=~/Code/Vendor/go
export GOROOT=/usr/local/opt/go/libexec

export PATH=~/.bin:$GEM_HOME/bin:$GEM_HOME/ruby/2.6.0/bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:~/Library/Python/2.7/bin:$PATH

# enable completions
fpath=(~/.zsh/functions $fpath)
autoload -U compinit
compinit
autoload -U ~/.zsh/functions/*(:t)

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
setopt prompt_subst

PROMPT='%F{blue}%1~%f$ '
precmd_functions+=(vcs_info)
# function set_window_title() { print -Pn - '\e]0;%~\a' }
# precmd_functions+=(set_window_title)

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%F{240}%b%f'
zstyle ':vcs_info:*' enable git
RPROMPT=\$vcs_info_msg_0_

# ====
# Alias
# ====

alias ll='ls -laG'
alias g='git status -sb'
alias gc='git commit'
alias gca='git commit --all'
alias gs='git switch'
alias gd='git diff'
alias gco='git checkout'
alias gp='git push'
alias gt='gittower .'

alias ic='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/'

alias ..='cd ..'
alias be='bundle exec'
alias bi='bundle install'
alias bef='bundle exec fastlane'
alias e='code'

# ====
# Misc
# ===

if [[ -f $HOME/.secrets ]]; then
    source $HOME/.secrets
fi

[[ -s /Users/florian/.autojump/etc/profile.d/autojump.sh ]] && source /Users/florian/.autojump/etc/profile.d/autojump.sh
