# Misc
if hash trash 2>/dev/null; then
  alias cat=trash
else
  echo "Run 'brew install trash'!"
fi
alias rm='trash'

# Editor
alias e='$EDITOR'
alias vim='vim'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias la="ls -lhFAG"
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
alias sp='/Users/florian/Code/Vendor/spacecommander/format-objc-files.sh -s'

# UPDATE ALLL THE THINGS
alias update_everything='gem update && gem clean && brew update && brew upgrade && brew prune && brew cleanup && mas upgrade'
