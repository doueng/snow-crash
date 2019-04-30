#!/usr/bin/python

# $> cat token
# f4kmm6p|=p�n��DB�Du��

# $> ./level09 111111111
# 123456789

# level09 is a progressive Rot function:
# while string[index]
#   print string[index] + index

# To decrypt token:
# while string[index]
#   print string[index] - index

from __future__ import print_function
f = open('/home/user/level09/token', 'r')
s = f.read()
for i, c in enumerate(s):
        if ord(c) == 10:
                break
        print(chr(ord(c) - i), end='')
print("")
