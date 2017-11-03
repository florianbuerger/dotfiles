# update_terminal_cwd() {
#     # Identify the directory using a "file:" scheme URL,
#     # including the host name to disambiguate local vs.
#     # remote connections. Percent-escape spaces.
#     local SEARCH=' '
#     local REPLACE='%20'
#     local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
#     printf '\e]7;%s\a' "$PWD_URL"
# }
# autoload add-zsh-hook
# add-zsh-hook chpwd update_terminal_cwd
# update_terminal_cwd

set-window-title() {
  # /Users/clessg/projects/dotfiles -> ~/p/dotfiles
  window_title="\e]0;${${PWD/#"$HOME"/~}/projects/p}\a"
  echo -ne "$window_title"
}

autoload add-zsh-hook
add-zsh-hook chpwd set-window-title
set-window-title
