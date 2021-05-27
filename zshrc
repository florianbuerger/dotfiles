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

setopt  autocd

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
alias gca='git commit --all'
alias gs='git switch'
alias gd='git difftool --tool=kitty --no-symlinks --dir-diff'
alias gco='git checkout'
alias gp='git push'
alias gt='gittower .'
alias ghw='gh pr view --web'
alias ghm='gh pr merge --squash --delete-branch && git pull'

alias ic='cd ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/'

alias be='bundle exec'
alias bi='bundle install'
alias bef='bundle exec fastlane'
alias e='mate'
alias rm='trash'
alias clear-quarantine='sudo xattr -r -d com.apple.quarantine'
alias fix-xcode-plugins='PATH=/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support:"$PATH" && lsregister -f /Applications/Xcode.app'

# ====
# Misc
# ===

if [[ -f $HOME/.secrets ]]; then
    source $HOME/.secrets
fi

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# -*- sh -*-

# Handle bookmarks. This uses the static named directories feature of
# zsh. Such directories are declared with `hash -d
# name=directory`. Both prompt expansion and completion know how to
# handle them. We populate the hash with directories.
#
# With autocd, you can just type `~-bookmark`. Since this can be
# cumbersome to type, you can also type `@@` and this will be turned
# into `~-` by ZLE.

() {
    MARKPATH=$ZSH/run/marks

    # Add some static entries
    hash -d log=/var/log
    hash -d doc=/usr/share/doc

    # Populate the hash
    for link ($MARKPATH/*(N@)) {
        hash -d -- -${link:t}=${link:A}
    }

    vbe-insert-bookmark() {
        emulate -L zsh
        LBUFFER=${LBUFFER}"~-"
    }
    zle -N vbe-insert-bookmark
    bindkey '@@' vbe-insert-bookmark

    # Manage bookmarks
    bookmark() {
        [[ -d $MARKPATH ]] || mkdir -p $MARKPATH
        if (( $# == 0 )); then
            # When no arguments are provided, just display existing
            # bookmarks
            for link in $MARKPATH/*(N@); do
                local markname=${(%):-%F{green}${link:t}%f}
                local markpath=${(%):-%F{blue}${link:A}%f}
                printf "%-30s → %s\n" $markname $markpath
            done
        else
            # Otherwise, we may want to add a bookmark or delete an
            # existing one.
            local -a delete
            zparseopts -D d=delete
            if (( $+delete[1] )); then
                # With `-d`, we delete an existing bookmark
                command rm $MARKPATH/$1
            else
                # Otherwise, add a bookmark to the current
                # directory. The first argument is the bookmark
                # name. `.` is special and means the bookmark should
                # be named after the current directory.
                local name=$1
                [[ $name == "." ]] && name=${PWD:t}
                ln -s $PWD $MARKPATH/$name
                hash -d -- -${name}=${PWD}
            fi
        fi
    }
}