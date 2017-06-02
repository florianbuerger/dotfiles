function e --description 'alias e=subl'
	if count $argv > /dev/null
    subl $argv
  else
    subl .
  end
end
