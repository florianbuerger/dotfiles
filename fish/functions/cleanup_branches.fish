function cleanup_branches --description alias\ cleanup_branches=git\ branch\ --merged\ \|\ grep\ -v\ \"\\\*\"\ \|\ xargs\ -n\ 1\ git\ branch\ -d
	git branch --merged | grep -v "\*" | xargs -n 1 git branch -d $argv;
end
