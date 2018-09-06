function p
  # Jump into a selected project from `~/Projects`
  cd ~/Code/(find ~/Code -type d -maxdepth 2 -depth 2 -print | cut -d '/' -f5,6 | fzf -1 -q "$argv[1]")
end
