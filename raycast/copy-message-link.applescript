#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Copy Message Link
# @raycast.mode compact

# Documentation:
# @raycast.description Copy link to selected message in Mail.app
# @raycast.author Florian BŸrger
# @raycast.authorURL https://github.com/florianbuerger

tell application "Mail"
	set selectedMessages to selection
	set theMessage to item 1 of selectedMessages
	set messageid to message id of theMessage
	-- Make URL (must use URL-encoded values for "<" and ">")
	set urlText to "message://" & "%3c" & messageid & "%3e"
	set the clipboard to (urlText)
	log "Copied to Clipboard"
end tell
