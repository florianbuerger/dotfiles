# Defined in - @ line 0
function gca --description 'alias gca=git add -A; git commit'
	git add -A; git commit $argv;
end
