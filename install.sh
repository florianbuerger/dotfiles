#!/bin/bash

if ! type stow > /dev/null; then
	brew install stow
fi

ls -d */ | xargs stow -t "$HOME"
