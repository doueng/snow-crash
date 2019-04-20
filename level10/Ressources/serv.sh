#!/bin/sh

############ SERVER #############
while :
do
	nc -l localhost 6969 | grep -v '.*( )*.'
done

