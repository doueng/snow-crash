#!/bin/sh

# > objdump -D /bin/getflag | grep "<main>" -A 334
# This shows the success conditions of getflag

# All line nubers are the XXX part of 8048XXX:
#
# line  afd     -> call to getuid
# lines b0a-bbb -> test getuid against [3001..3014]
#                                     [0xbb8..0xbc6]
#                                    [flag01..flag14]

# Only four conditions are to change to successfully capture the flag14:
#  Keep in mind our uid is level14  : (2014 == 0x7de)
#  Target uid is flag14             : (3014 == 0xbc6)
#
#  - line b1a ->      77 ac    ja   (jumps if uid > 0xbbe)
#             Swap:   75 ac    jne  (jumps if uid != 0xbbe)
#             Jump:   line b68
#
#  - line b78 ->      same as above
#             Jump:   line b95
#
#  - line ba5 ->      0f 82 d4 01 00 00    jb   (jumps if uid < 0xbc4)
#             Swap:   0f 84 d4 01 00 00    je   (jumps if uid == 0xbc4)
#             Continues on
#
#  - line bbb ->      0f 84 24 02 00 00    je   (jumps if uid == 0xbc6)
#             Swap:   0f 85 24 02 00 00    jne  (jumps if uid != 0xbc6)
#             Jumps to the part where it prints flag14

# make a copy of getflag
cp /bin/getflag /tmp/getflag

# Prepare the vimscript to reverse conditions
# convert to hex
echo ":%!xxd"         > /tmp/switchy
# line b1a: swap ja -> jne
echo "/0000b10"      >> /tmp/switchy
echo ":s/774c/754c/" >> /tmp/switchy
# line b78: swap ja -> jne
echo "/0000b70"      >> /tmp/switchy
echo ":s/771b/751b/" >> /tmp/switchy
# line ba5: swap jb -> je
echo "/0000ba0"      >> /tmp/switchy
echo ":s/82d4/84d4/" >> /tmp/switchy
# line bbb: swap je -> jne
echo "/0000bb0"      >> /tmp/switchy
echo ":s/8424/8524/" >> /tmp/switchy
# convert back to binary
echo ":%!xxd -r"     >> /tmp/switchy
echo ":wq"           >> /tmp/switchy
echo                 >> /tmp/switchy

# Execute vimscript on local copy of getflag
vim -s /tmp/switchy /tmp/getflag

# Launch it
/tmp/getflag

