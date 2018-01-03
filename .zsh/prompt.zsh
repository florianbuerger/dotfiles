autoload -Uz vcs_info colors
zstyle ':vcs_info:*' enable git
precmd() {
	vcs_info
}

zstyle ':vcs_info:git*' formats "%{$reset_color%} on %{$fg_bold[yellow]%}%b%{$reset_color%}"
zstyle ':vcs_info:git*' actionformats "%{$reset_color%} on %{$fg_bold[magenta]%}%b|%a%{$reset_color%}"

function machine_info() {
  if [[ -n "$SSH_CLIENT" ]]; then
    local user=`whoami`
    echo "%{$fg_bold[black]%}$user at %m%{$reset_color%}"
  fi
}

function ruby_info() {
  # Show versions only for Ruby-specific folders
  [[ -f Gemfile || -f Rakefile ]] || return

  local ruby_version=$(chruby | sed -n -e 's/ \* //p')

  [[ "${ruby_version}" == "system" ]] && return

  # Add 'v' before ruby version that starts with a number
  [[ "${ruby_version}" =~ ^[0-9].+$ ]] && ruby_version="v${ruby_version}"
  
  echo "%{$reset_color%} using %{$fg_bold[white]%}$ruby_version%{$reset_color%}"
}

PROMPT='
$(machine_info)in %{$fg_bold[red]%}%2~%{$reset_color%}${vcs_info_msg_0_}$(ruby_info)
%{$reset_color%}\$ '
