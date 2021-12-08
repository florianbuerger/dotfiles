# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# rbenv
eval "$(rbenv init - zsh)"

fpath=(~/.zsh/functions /opt/homebrew/share/zsh/site-functions $fpath)

# completions
autoload -Uz compinit
compinit

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' menu yes select
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

bindkey -e
# history search with up/down arrow
bindkey '^[[A' up-line-or-search # up arrow
bindkey '^[[B' down-line-or-search # down arrow
bindkey '^R' history-incremental-search-backward

setopt autocd

# ====
# Prompt
# ====

autoload -Uz colors && colors
autoload -Uz promptinit && promptinit
setopt prompt_subst

autoload -Uz vcs_info

PROMPT='%F{blue}%1~%f$ '

zstyle ':vcs_info:git:*' formats '%F{240}%b%f'
zstyle ':vcs_info:*' enable git
RPROMPT=\$vcs_info_msg_0_

precmd_functions+=(vcs_info)
function window_title() {
  print -Pn "\e]0;%~\a"
}
precmd_functions+=(window_title)

# ====
# Alias
# ====

alias ll='ls -laG'
alias g='git status -sb'
alias gc='git commit'
alias gca='git add -A; git commit'
alias gs='git switch'
alias gd='git diff'
alias gco='git checkout'
alias gp='git push'
alias gt='gittower .'
alias ghw='gh pr view --web'
alias ghm='gh pr merge --squash --delete-branch && git pull'
alias gship='gh pr merge --merge --delete-branch && git pull'

alias ic='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/'

alias be='bundle exec'
alias bi='bundle install'
alias bef='bundle exec fastlane'
alias clear-quarantine='sudo xattr -r -d com.apple.quarantine'
alias lsregister=/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister
alias fix-xcode-plugins="lsregister -f `xcode-select -p |  awk -F/ '{print "/"$2"/"$3}'`"
alias deriveddata=osascript -e "tell application \"Finder\" to move POSIX file \"/Users/florian/Library/Developer/Xcode/DerivedData\" to trash" -e "tell application \"Finder\" to empty trash"
alias xb='sudo xcode-select -s /Applications/Xcode-beta.app; xcode-select -p'
alias xr='sudo xcode-select -s /Applications/Xcode.app; xcode-select -p'

. ~/.fastlane/completions/completion.sh

if [[ -f $HOME/.secrets ]]; then
    source $HOME/.secrets
fi

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
