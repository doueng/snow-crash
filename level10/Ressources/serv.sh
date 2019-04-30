#!/bin/sh

# Continualy listen on port 6969 for flag
# Discards empty output

############ SERVER #############
while [ ! -s /tmp/flag10 ]
do
	nc -l localhost 6969 | grep -v '.*( )*.' > /tmp/flag10
done

echo -n "FLAG10: "
cat /tmp/flag10

