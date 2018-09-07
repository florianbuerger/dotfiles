if test -d ~/Library/Android/sdk
  set -x ANDROID_HOME ~/Library/Android/sdk
	set -x PATH $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
	alias emulator=$ANDROID_HOME/tools/emulator
end