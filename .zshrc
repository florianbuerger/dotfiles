# Load functions and completion
fpath=(~/.zsh/functions /usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u
autoload -U ~/.zsh/functions/*(:t)

# Matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# force US UTF8
export LC_ALL=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Load files
for file (~/.zsh/*.zsh) source $file

# Local secrets
if [[ -a ~/.secrets ]]; then
	source ~/.secrets
fi
