function fish_right_prompt
	set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
	set_color white
	echo -n -s $git_branch
	set_color normal

	if test -f Gemfile; or test -f Rakefile
		set -l ruby_version (rbenv version | sed -e 's/ .*//')
		if test -n $ruby_version
			set -l global_ruby (rbenv global)
			if test $ruby_version != $global_ruby
				set_color red
				echo -n -s " (ruby $ruby_version)"
				set_color normal
			end
		end
	end

	if set -q VIRTUAL_ENV
	    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
	end
end

