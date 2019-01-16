export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export HISTCONTROL=ignoreboth:erasedups
export VISUAL=vim

if [ "$(uname)" == "Darwin" ]; then
	export PATH=$HOME/.bin:/usr/local/bin:/usr/local/sbin:$PATH
fi

# Force qt@5.5 & mysql@5 for HockeyApp
export PATH=/usr/local/opt/mysql@5.5/bin:/usr/local/opt/qt@5.5/bin:$PATH

# Load ssh agent
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
ssh-add -A 2>/dev/null;

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
set completion-ignore-case On

# Android
if [ -d "$HOME/Library/Android/sdk" ]; then
	export ANDROID_HOME=$HOME/Library/Android/sdk
	export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH
	alias emulator=$ANDROID_HOME/tools/emulator
fi

# Add tab completion for many Bash commands
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Git completion and branch info in prompt
XCODE="$(xcode-select -p)"
if [ -d $XCODE ]; then
	source $XCODE/usr/share/git-core/git-completion.bash
	source $XCODE/usr/share/git-core/git-prompt.sh
fi

# osx
alias o='open .'
alias ..='cd ..'
alias ...='cd ../..'
alias ,,='cd ..'
alias ,,,='cd ../..'
alias ll="ls -lahL"

# Enable aliases to be sudo’ed
alias sudo='sudo '

# git
alias git='hub'
alias g='git status -sb'
alias gs='git status -sb'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gco='git checkout'
alias gca='git add -A && git commit -v'
alias gcam='git add -A; git commit -m'
alias gd='git diff'
alias gP='git push'
alias gp='git pull --rebase'
alias gg='git log --graph --oneline --decorate --date=relative --all'
alias gt='gittower .'
alias gst='git stash'
alias gsta='git stash apply'
alias gstc='git stash clear'
alias gm='git merge --ff-only'
alias gmn='git merge --no-ff'
alias cleanup_branches='git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d'

# system
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias hide-desktop-icons="defaults write com.apple.finder CreateDesktop -bool false; killall Finder;"
alias show-desktop-icons="defaults write com.apple.finder CreateDesktop -bool true; killall Finder;"
alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/creenSaverEngine'
alias serve='python -m SimpleHTTPServer && open http://localhost:8000'
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

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
alias xcode-beta='sudo xcode-select -s /Applications/Xcode-beta.app && ddd'
alias xcode-release='sudo xcode-select -s /Applications/Xcode.app && ddd'
alias bef='bundle exec fastlane'

# UPDATE ALLL THE THINGS
alias update_everything='gem update && gem clean && brew update && brew upgrade && brew prune && brew cleanup && sudo softwareupdate -ia'

# Reset dns cache
alias flushdns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder && echo "Be sure to reset Google Chrome as well: 'chrome://net-internals/#dns'"'

# Ruby & NodeJS
# asdf version manager
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
alias be='bundle exec'
alias bi='bundle install'
alias f='bundle exec fastlane'

if [ "$SSH_CLIENT" ]; then
  PS1='\[\e[31m\]\u@\h\[\e[m\]:\[\e[37m\]\W\[\e[m\]\\$ '
else
  PS1='\[\e[37m\]\W$(__git_ps1 "(%s)")\\$\[\e[m\] '
fi

# force new line when the previous output didn't include it
# https://unix.stackexchange.com/questions/60459/how-to-make-bash-put-prompt-on-a-new-line-after-cat-command
shopt -s promptvars
PS1='$(printf "%$((COLUMNS-1))s\r")'$PS1

# jump around
fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
alias j='fasd_cd -d'
