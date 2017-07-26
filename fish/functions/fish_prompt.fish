function machine_info
  if begin; set -q SSH_CLIENT; or set -q SSH_TTY; end 
    echo -n '🌎  :: '
    set_color cyan
    echo -n -s "$USER" @ (prompt_hostname)
    set_color normal
    echo -n '::'
  else
    echo -n '🐼  '
  end
end

function fish_prompt
	set_color $fish_color_cwd
  machine_info
	set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n ' >> '
end	
