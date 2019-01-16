if test -d ~/Library/Android/sdk
	set -x ANDROID_HOME ~/Library/Android/sdk
	set -x ANDROID_NDK_HOME /Users/florian/Library/Android/sdk/ndk-bundle/
	set -x PATH $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $ANDROID_NDK_HOME $PATH
	alias emulator=$ANDROID_HOME/tools/emulator
end

# Google deport tool
# http://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html#_setting_up
set -x PATH ~/Code/Vendor/depot_tools $PATH
