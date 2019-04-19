from __future__ import print_function
f = open('/home/user/level09/token', 'r')
s = f.read()
for i, c in enumerate(s):
        if ord(c) == 10:
                break
        print(chr(ord(c) - i), end='')
print("\n")
