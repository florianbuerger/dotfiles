# Load functions and completion
fpath=(~/.zsh/functions /usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)
autoload -U compinit
compinit
autoload -U ~/.zsh/functions/*(:t)

# Matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Load files
for file (~/.zsh/*.zsh) source $file

# Local secrets
if [[ -a ~/.secrets ]]; then
	source ~/.secrets
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
