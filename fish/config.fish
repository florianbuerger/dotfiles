set fish_greeting

set -x LANG en_US.UTF-8

set -x EDITOR nvim
set -x MANPAGER vimpager

set -x FZF_DEFAULT_COMMAND 'ag -g ""'

set -gx PATH ~/.bin $PATH

abbr -a ta tmux attach -t
abbr -a ts tmux new-session -s

# Android
if test -d ~/Library/Android/sdk
  set -x ANDROID_HOME ~/Library/Android/sdk
	set -x PATH $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
	alias emulator=$ANDROID_HOME/tools/emulator
end

