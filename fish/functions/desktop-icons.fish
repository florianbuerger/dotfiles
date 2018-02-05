function hide_desktop_icons
  defaults write com.apple.finder CreateDesktop -bool false
  killall Finder
end

function show_desktop_icons
  defaults write com.apple.finder CreateDesktop -bool true
  killall Finder
end
