
# All Git Town commands
set git_town_commands abort continue hack kill new-pull-request prune-branches rename-branch repo ship sync undo 

# Indicates through its error code whether the command line to auto-complete
# already contains a Git Town command or not.
#
# - doesn't have command yet: exit code 0
# - has command already: exit code 1
function __fish_complete_git_town_no_command
  for cmd in (commandline -otc)
    if contains $cmd $git_town_commands
      return 1
    end
  end
  return 0
end


# Define autocompletion for the Git Town commands themselves.
#
# These only get autocompleted if there is no Git Town command present in the
# command line already.
# This is done through __fish_complete_git_town_no_command
complete --command git --arguments 'abort' --description 'Aborts the last run git-town command' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'continue' --description 'Displays your Git Town configuration' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'hack' --description 'Creates a new feature branch off the main development branch' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'kill' --description 'Removes an obsolete feature branch' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'new-pull-request' --description 'Creates a new pull request' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'prune-branches' --description 'Deletes local branches whose tracking branch no longer exists' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'rename-branch' --description 'Renames a branch both locally and remotely' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'repo' --description 'Opens the repository homepage' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'ship' --description 'Deliver a completed feature branch' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'sync' --description 'Updates the current branch with all relevant changes' --condition '__fish_complete_git_town_no_command' --no-files
complete --command git --arguments 'undo' --description 'Undoes the last run git-town command' --condition '__fish_complete_git_town_no_command' --no-files


# Define autocompletion of Git branch names.
#
# This is only enabled for commands that take branch names.
# This is achieved through __fish_complete_git_town_command_takes_branch
complete --command git --arguments "(git branch | tr -d '* ')" --no-files
