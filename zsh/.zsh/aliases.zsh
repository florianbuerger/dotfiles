# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias ls="ls -F"

# Git
alias gsu='git submodule update --init --recursive'
alias gs='git status -sb'
alias gut='git'
alias cleanup_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gd='git diff'
alias gca='git add -A && git commit'

# Editor
alias s='subl .'

# Rails
alias tlog='tail -f log/development.log'
alias b='bundle exec'
alias bake='bundle exec rake'
alias rr='rbenv rehash'
alias bm='bin/m'

# Mac OS X
alias o='open .'
alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
alias hide_desktop_icons='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias show_desktop_icons='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
# Commands starting with % for pasting from web
alias %=' '
alias $=' '

# Xcode
alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData'
