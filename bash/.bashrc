eval "$(rbenv init -)"
export CLICOLOR=1
export EDITOR="vim"

# Case-insensitive globbing (used in pathname expansion)
set completion-ignore-case On

# Android env
export ANDROID_HOME=/usr/local/opt/android-sdk

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# Enable z
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/profile.d/z.sh" ]; then
    source "$(brew --prefix)/etc/profile.d/z.sh"
fi

# Autocompletion for fastlane; run fastlane enable_auto_complet to
# generate that file
. ~/.fastlane/completions/completion.sh

# Open Xcode project or workspace from current directory in active xcode
function x() {
    local xcode="open -a $(xcode-select -p | awk -F'/' '{print $3}')"
    local project="$(ls | grep '.*\.xcworkspace$')"
    [[ -z $project ]] && project="$(ls | grep '.*\.xcodeproj$')"
    [[ -n $project ]] && $xcode $project
}

# Git completion and branch info in prompt
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

BLUE=$(tput setaf 4)
RESET=$(tput sgr0)
if [ "$SSH_CONNECTION" ]; then 
    PS1='\[$BLUE\]\u@\h:\W$(__git_ps1 "(%s)")\$ \[$RESET\]'
else
    PS1='\[$BLUE\]\W$(__git_ps1 "(%s)")\$ \[$RESET\]'
fi

# osx
alias o='open .'
alias ..='cd ..'
alias ...='cd ../..'
alias ,,='cd ..'
alias ,,,='cd ../..'alias ll="ls -la"
alias console="tail -40 -f /var/log/system.log"
alias cat='ccat'
alias ll="ls -lahL"

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dd="cd ~/Dropbox"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# git
alias g='tig status'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcam='git add -A; git commit -m'
alias cleanup_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias t='gittower .'
alias gd='git diff'
alias gP='git push'
alias gp='git pull --rebase'
alias gg='git log --graph --oneline --decorate --date=relative --all'

# system
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias hide-desktop-icons="defaults write com.apple.finder CreateDesktop -bool false; killall Finder;"
alias show-desktop-icons="defaults write com.apple.finder CreateDesktop -bool true; killall Finder;"
alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/creenSaverEngine'
alias serve='python -m SimpleHTTPServer'

# Ruby
alias be='bundle exec'
alias bi='bundle install'

# Xcode
alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias bump='agvtool bump -all'
alias format-objc='/Users/florian/Code/OpenSource/spacecommander/format-objc-files.sh -s'


# Carthage
alias cus='carthage update --platform iOS --use-ssh'

# GitUp
alias gup='open -a GitUp `git rev-parse --show-toplevel`'

# Focus
alias focus='open focus://toggle'

