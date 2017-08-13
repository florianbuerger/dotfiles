# Editor
alias e='$EDITOR'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias ls="ls -F"
alias cat="ccat"

# Mac OS X
alias o='open .'
alias screensaver='/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
alias hide_desktop_icons='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias show_desktop_icons='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
alias server='open http://localhost:8000 && python -m SimpleHTTPServer'
alias flushdns='dscacheutil -flushcache && sudo killall -HUP mDNSResponder && echo "Be sure to reset Google Chrome as well: 'chrome://net-internals/#dns'"'
alias f='open focus://toggle'

# Commands starting with % for pasting from web
alias %=' '
alias $=' '

# Xcode
alias ddd='rm -rf ~/Library/Developer/Xcode/DerivedData'
alias xcode-beta='sudo xcode-select -s /Applications/Xcode-beta.app'
alias xcode-release='sudo xcode-select -s /Applications/Xcode.app'
alias bump='agvtool next-version -all'
alias swiftformat="/usr/local/bin/swiftformat --indent 4"

# Brew
alias brewup='brew update && brew doctor && brew outdated && brew upgrade && brew cleanup -s --prune=1'
