# Defined in - @ line 0
function gcam --description 'alias gcam=git add -A; git commit -m'
	git add -A; git commit -m $argv;
end
