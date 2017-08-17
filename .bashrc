export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export EDITOR="nvim"
alias e='$EDITOR'

# Homebrew
export PATH=$HOME/.bin:usr/local/bin:/usr/local/sbin:$PATH

# Python user install on macOS
export PATH=$HOME/Library/Python/2.7/bin:usr/local/bin:/usr/local/sbin:$PATH

# Case-insensitive globbing (used in pathname expansion)
set completion-ignore-case On

# Ruby
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH 
alias be='bundle exec'

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk/
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# Go
export GOPATH=$HOME/Code/
export PATH=$GOPATH/bin:$PATH

# User grc for more colors :)
source "`brew --prefix`/etc/grc.bashrc"

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

# Git completion and branch info in prompt
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
alias gca='git add -A && git commit -v'

PROMPT_COLOR=$(tput setaf 6)
RESET=$(tput sgr0)
if [ "$SSH_CONNECTION" ]; then 
    # PS1='\[$PROMPT_COLOR\]\u@\h:\W$(__git_ps1 "(%s)")\$ \[$RESET\]'
    PS1='\[$PROMPT_COLOR\]\u@\h:\W\$ \[$RESET\]'
else
    PS1='\[$PROMPT_COLOR\]\W\$ \[$RESET\]'
fi

# osx
alias o='open .'
alias ..='cd ..'
alias ...='cd ../..'
alias ,,='cd ..'
alias ,,,='cd ../..'alias ll="ls -la"
alias ll="ls -lahL"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# git
alias g='git status -sb'
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
alias gs='git status -sb'

# system
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias hide-desktop-icons="defaults write com.apple.finder CreateDesktop -bool false; killall Finder;"
alias show-desktop-icons="defaults write com.apple.finder CreateDesktop -bool true; killall Finder;"
alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/creenSaverEngine'
alias serve='python -m SimpleHTTPServer && open http://localhost:8000'

# Ruby
alias be='bundle exec'
alias bi='bundle install'

# radio
alias radio-frisky='mplayer http://stream2.friskyradio.com/frisky_mp3_hi/;*3'
alias radio-clubsandwich='mplayer http://fluxfm.hoerradar.de/flux-clubsandwich-mp3-hq'
alias radio-pure='mplayer http://www.radionetz.de:8000/purefm-bln.mp3'
alias radio-minimal='mplayer http://stream1.laut.fm/minimalcalling'
alias radio-smash='mplayer http://uk1.internet-radio.com:8106/;'

# Xcode
alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias bump='agvtool bump -all'
alias spacecommander='~/Code/Vendor/spacecommander/format-objc-files.sh -s'

# Focus
alias focus='open focus://toggle'

# node
export NVM_DIR="/Users/florian/.nvm"
alias loadnvm="[ -s '$NVM_DIR/nvm.sh' ] && . '$NVM_DIR/nvm.sh' && nvm use --lts"

# load fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Neovim ftw
alias vim=nvim
