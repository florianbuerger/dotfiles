# ctrl+o opens Visual Studio Code on current folder or file
set FZF_DEFAULT_OPTS "--height 80% --bind='ctrl-o:execute-silent(code {})+abort'"

# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
set FZF_CTRL_T_OPTS "--preview-window wrap --preview '
if test -f {};
    file --mime {} | grep -q \"text\/.*;\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
else if test -d {};
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
end'"
