ZSH_HOME=~/Code/Personal/dotfiles/zsh

source $ZSH_HOME/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/

# Theme
antigen theme jdavis/zsh-files themes/jdavis

# Plugins
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z
antigen bundle ssh-agent
antigen bundle node
antigen bundle npm
antigen bundle brew
antigen bundle brew-cask
antigen bundle gem
antigen bundle osx

# For sudo-ing aliases
# https://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '

# radio
alias radio-frisky='mplayer http://stream2.friskyradio.com/frisky_mp3_hi/;*3'
alias radio-clubsandwich='mplayer http://fluxfm.hoerradar.de/flux-clubsandwich-mp3-hq'
alias radio-pure='mplayer http://www.radionetz.de:8000/purefm-bln.mp3'
alias radio-minimal='mplayer http://stream1.laut.fm/minimalcalling'
alias radio-smash='mplayer http://uk1.internet-radio.com:8106/;'
