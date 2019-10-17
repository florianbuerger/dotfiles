#!/usr/bin/env python
import sys
import subprocess
import urllib

# Opens an array of constraints in wtfautolayout.com for visualization.
#
# Usage: set a symbolic breakpoint for UIViewAlertForUnsatisfiableConstraints
# and add a Shell Command action that runs this script,
# and calls with this parameter:
# @(NSString *)[(id)$arg2 description]@

# Argument 0 is the path to the script itself, so we start
# counting arguments from 1. Any commas followed by spaces
# in the original text are interpreted as argument delimiters,
# so we need to join them back together with another comma and space.
# They also come in with backslash escapes for characters such as
# single and double quotes, so we decode those string escapes as well.
input = ", ".join(sys.argv[1:]).decode('string_escape')

# The input is an NSString, so it's wrapped in this: @"".
# We remove a double-quote from the end and an at-double-quote
# from the beginning.
stripped_input = input.rstrip('"').lstrip('@"')

# Use urllib to URL-encode special characters.
quoted_log = urllib.quote(stripped_input)

url = 'https://www.wtfautolayout.com/?constraintlog=%s' % quoted_log

# Open the URL in the user's default browser.
subprocess.call(['open', url])