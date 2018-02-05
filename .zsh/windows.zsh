update_terminal_cwd() {
    # # Identify the directory using a "file:" scheme URL,
    # # including the host name to disambiguate local vs.
    # # remote connections. Percent-escape spaces.
    # local SEARCH=' '
    # local REPLACE='%20'
    # local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
    # printf '\e]7;%s\a' "$PWD_URL"

    tab_label=${PWD/${HOME}/\~} # use 'relative' path
    echo -ne "\e]2;${tab_label}\a" # set window title to full string
    echo -ne "\e]1;${tab_label: -24}\a" # set tab title to rightmost 24 characters
}
autoload add-zsh-hook
add-zsh-hook chpwd update_terminal_cwd
update_terminal_cwd
