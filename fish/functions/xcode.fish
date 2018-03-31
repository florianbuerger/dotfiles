abbr -a ddd rm -rf ~/Library/Developer/Xcode/DerivedData

function xcode_beta
  sudo xcode-select -s /Applications/Xcode-beta.app
  ddd
end

function xcode_release
  sudo xcode-select -s /Applications/Xcode.app
  ddd
end
