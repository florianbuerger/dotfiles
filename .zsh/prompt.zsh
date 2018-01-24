autoload -Uz vcs_info colors
zstyle ':vcs_info:*' enable git
precmd() {
	vcs_info
}

zstyle ':vcs_info:git*' formats "%{$reset_color%}%{$fg[white]%}%b%{$reset_color%}"
zstyle ':vcs_info:git*' actionformats "%{$reset_color%}%{$fg[white]%}%b|%a%{$reset_color%}"

function machine_info() {
  if [[ -n "$SSH_CLIENT" ]]; then
    local user=`whoami`
    echo "%{$fg_bold[black]%}$user@%m%:{$reset_color%}"
  fi
}

function ruby_info() {
  # Show versions only for Ruby-specific folders
  [[ -f Gemfile || -f Rakefile ]] || return

  local ruby_version=$(chruby | sed -n -e 's/ \* //p')

  [[ "${ruby_version}" == "system" ]] && return

  echo "%{$reset_color%}%{$fg[red]%} $ruby_version %{$reset_color%}"
}

PROMPT='$(machine_info)%{$fg[blue]%}%c%{$reset_color%}%{$reset_color%}\$ '
RPROMPT='${vcs_info_msg_0_}$(ruby_info)%{$reset_color%}'
