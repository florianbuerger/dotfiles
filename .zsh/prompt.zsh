autoload -Uz vcs_info colors
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}

zstyle ':vcs_info:git*' formats "(%b)"
zstyle ':vcs_info:git*' actionformats "(%b|%a)"

function machine_info() {
  if [[ -n "$SSH_CLIENT" ]]; then
    local user=`whoami`
    echo "%{$fg[blue]%}$user@%m:%{$reset_color%}"
  fi
}

PROMPT='$(machine_info)%{$fg[white]%}%c${vcs_info_msg_0_}%{$reset_color%}%# '
