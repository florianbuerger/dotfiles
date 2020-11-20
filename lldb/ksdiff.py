# 
# See README.md for install details.
# 
# (lldb) ksdiff <any lldb command>; <any lldb command>
#
# e.g.
#
# (lldb) ksdiff po myArray1; po myArray2
#

import lldb
import subprocess
import tempfile

diff_tool_path = '/usr/local/bin/ksdiff'

def ksdiff(debugger, command, result, dict):
	res = lldb.SBCommandReturnObject()
	comminter = debugger.GetCommandInterpreter()

	commands = command.split(';')

	comminter.HandleCommand(commands[0], res)
	if not res.Succeeded():
		print('error: ' + commands[0])
		return
	lhs_output = res.GetOutput()
	lhs_file = tempfile.NamedTemporaryFile(delete=False)
	lhs_file.write(lhs_output)
	lhs_file.close()

	comminter.HandleCommand(commands[1], res)
	if not res.Succeeded():
		print('error:' + commands[1])
		return
	rhs_output = res.GetOutput()
	rhs_file = tempfile.NamedTemporaryFile(delete=False)
	rhs_file.write(rhs_output)
	rhs_file.close()
	
	subl = subprocess.Popen([diff_tool_path, lhs_file.name, rhs_file.name])
