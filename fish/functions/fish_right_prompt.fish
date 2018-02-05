function fish_right_prompt
	set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
	echo -n -s $git_branch
	
	if test -f Gemfile; or test -f Rakefile
		set -l ruby_version (chruby | sed -n -e 's/ \* //p')
		set_color red
		echo -n -s " $ruby_version"
		set_color normal
	end
end

