#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Select Xcode Release
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🚢
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description Select /Applications/Xcode.app
# @raycast.author Florian Bürger
# @raycast.authorURL https://github.com/florianbuerger

sudo xcode-select -s /Applications/Xcode.app
echo ""
xcode-select -p
