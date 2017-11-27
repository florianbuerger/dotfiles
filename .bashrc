export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export EDITOR="vim"
alias e='$EDITOR'

if [ "$(uname)" == "Darwin" ]; then
	# Homebrew
	export PATH=$HOME/.bin:usr/local/bin:/usr/local/sbin:$PATH
	# Python user install on macOS
	export PATH=$HOME/Library/Python/2.7/bin:usr/local/bin:/usr/local/sbin:$PATH
fi

# Case-insensitive globbing (used in pathname expansion)
set completion-ignore-case On

# Ruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
alias be='bundle exec'
alias bi='bundle install'

# Android
if [ -d $HOME/Library/Android/sdk ]; then
	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH
	alias emulator=$ANDROID_HOME/tools/emulator
fi

# Add tab completion for many Bash commands
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Enable z
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh

# Autocompletion for fastlane; run fastlane enable_auto_complet to
# generate that file
[ -f ~/.fastlane/completions/completion.sh ] && . ~/.fastlane/completions/completion.sh

# Git completion and branch info in prompt
if [ -d /Applications/Xcode.app ]; then
	source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
	source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
fi

# DIR='\[\e[37m\]\W\[\e[m\]'
# GIT_INFO='$(__git_ps1 "(%s)")'
# SSH="\[\e[37m\]\u@\h:\[\e[m\]"

if [ "$SSH_CONNECTION" ]; then
	export PS1='\[\e[32m\]\u@\h:\[\e[m\]\[\e[34m\]\W$(__git_ps1 "(%s)")\\$\[\e[m\] '
else
  export PS1='\[\e[m\]\[\e[34m\]\W$(__git_ps1 "(%s)")\\$\[\e[m\] '
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
alias gs='git status -sb'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gco='git checkout'
alias gca='git add -A && git commit -v'
alias gcam='git add -A; git commit -m'
alias cleanup_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias t='gittower .'
alias gd='git diff'
alias gP='git push'
alias gp='git pull --rebase'
alias gg='git log --graph --oneline --decorate --date=relative --all'
alias gt='gittower .'

# system
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias hide-desktop-icons="defaults write com.apple.finder CreateDesktop -bool false; killall Finder;"
alias show-desktop-icons="defaults write com.apple.finder CreateDesktop -bool true; killall Finder;"
alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/creenSaverEngine'
alias serve='python -m SimpleHTTPServer && open http://localhost:8000'

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
alias xcode-beta='sudo xcode-select -s /Applications/Xcode-beta.app'
alias xcode-release='sudo xcode-select -s /Applications/Xcode.app'

# node
export NVM_DIR="/Users/florian/.nvm"
alias loadnvm="[ -s '$NVM_DIR/nvm.sh' ] && . '$NVM_DIR/nvm.sh' && nvm use --lts"

# load fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# UPDATE ALLL THE THINGS
alias update_everything='gem update && gem clean && brew update && brew upgrade && brew prune && brew cleanup'

# Use colored cat
if hash ccat 2>/dev/null; then
	alias cat=ccat
fi

# iTerm integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
