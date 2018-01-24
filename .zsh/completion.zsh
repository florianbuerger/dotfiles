# let's use the tag name as group name
zstyle ':completion:*' group-name ''

# activate menu selection
zstyle ':completion:*' menu select

# activate approximate completion, but only after regular completion (_complete)
zstyle ':completion:::::' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# let's complete known hosts and hosts from ssh's known_hosts file
basehost="host1.example.com host2.example.com"
hosts=($((
( [ -r .ssh/known_hosts ] && awk '{print $1}' .ssh/known_hosts | tr , '\n'); echo $basehost; ) | sort -u) )

zstyle ':completion:*' hosts $hosts

# brew install zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
