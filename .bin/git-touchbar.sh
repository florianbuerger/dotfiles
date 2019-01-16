#!/bin/bash

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh

echo $(__git_ps1 '%s')
