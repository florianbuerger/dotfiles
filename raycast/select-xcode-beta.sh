#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Select Xcode Beta
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ⚠️
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description Select /Applications/Xcode-beta.app
# @raycast.author Florian Bürger
# @raycast.authorURL https://github.com/florianbuerger

sudo xcode-select -s /Applications/Xcode-beta.app
echo ""
xcode-select -p
