export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export CLICOLOR=1
autoload colors; colors;
export EDITOR=nvim

export ANDROID_HOME='$HOME/Library/Android/sdk'

path=(
    /usr/local/bin
    /usr/local/opt/openssl/bin
    ~/.bin
    /usr/local/sbin
    ~/Library/Python/3.7/bin
    $ANDROID_HOME/tools/bin
    $ANDROID_HOME/tools
    $ANDROID_HOME/platform-tools
    $path
)
