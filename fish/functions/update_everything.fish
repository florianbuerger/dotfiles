function update_everything
  gem update
  gem clean
  brew update
  brew upgrade
  brew prune
  brew cleanup
end
