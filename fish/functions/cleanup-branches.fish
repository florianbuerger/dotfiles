function cleanup-branches
	git branch --merged | egrep -v "(^\*|master|develop|beta|release|alpha|internal)" | xargs git branch -d
end
