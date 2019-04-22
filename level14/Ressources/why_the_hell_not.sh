#!/bin/bash

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

# This version captures the flag of every level from 00 to 14
# Why ? You ask.
# Because why the hell not ?

echo /tmp/getflag{00..14} | xargs -n 1 cp /bin/getflag

# flag 00
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b30"          >> /tmp/switchy
echo ":s/84ba/85ba/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 01
echo ":e /tmp/getflag01" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b30"          >> /tmp/switchy
echo ":s/0f87/0f85/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 02
echo ":e /tmp/getflag02" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b20"          >> /tmp/switchy
echo ":s/8414/8514/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 03
echo ":e /tmp/getflag03" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b20"          >> /tmp/switchy
echo ":s/771f/751f/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 04
echo ":e /tmp/getflag04" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b20"          >> /tmp/switchy
echo ":s/771f/751f/"     >> /tmp/switchy
echo "/0000b50"          >> /tmp/switchy
echo ":s/0f84/0f85/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 05
echo ":e /tmp/getflag05" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b20"          >> /tmp/switchy
echo ":s/771f/751f/"     >> /tmp/switchy
echo "/0000b50"          >> /tmp/switchy
echo ":s/8744/8544/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 06
echo ":e /tmp/getflag06" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b10"          >> /tmp/switchy
echo ":s/84b6/85b6/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 07
echo ":e /tmp/getflag07" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b10"          >> /tmp/switchy
echo ":s/774c/754c/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 08
echo ":e /tmp/getflag08" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b10"          >> /tmp/switchy
echo ":s/774c/754c/"     >> /tmp/switchy
echo "/0000b80"          >> /tmp/switchy
echo ":s/848e/858e/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 09
echo ":e /tmp/getflag09" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b10"          >> /tmp/switchy
echo ":s/774c/754c/"     >> /tmp/switchy
echo "/0000b80"          >> /tmp/switchy
echo ":s/0f87/0f85/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 10
echo ":e /tmp/getflag10" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b10"          >> /tmp/switchy
echo ":s/774c/754c/"     >> /tmp/switchy
echo "/0000b60"          >> /tmp/switchy
echo ":s/84e8/85e8/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 11
echo ":e /tmp/getflag11" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b10"          >> /tmp/switchy
echo ":s/774c/754c/"     >> /tmp/switchy
echo "/0000b70"          >> /tmp/switchy
echo ":s/771b/751b/"     >> /tmp/switchy
echo "/0000ba0"          >> /tmp/switchy
echo ":s/82d4/85d4/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 12
echo ":e /tmp/getflag12" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b10"          >> /tmp/switchy
echo ":s/774c/754c/"     >> /tmp/switchy
echo "/0000b70"          >> /tmp/switchy
echo ":s/771b/751b/"     >> /tmp/switchy
echo "/0000b90"          >> /tmp/switchy
echo ":s/0f84/0f85/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag 13
echo ":e /tmp/getflag13" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b10"          >> /tmp/switchy
echo ":s/774c/754c/"     >> /tmp/switchy
echo "/0000b70"          >> /tmp/switchy
echo ":s/771b/751b/"     >> /tmp/switchy
echo "/0000ba0"          >> /tmp/switchy
echo ":s/82d4/84d4/"     >> /tmp/switchy
echo "/0000bb0"          >> /tmp/switchy
echo ":s/0f84/0f85/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":w"                >> /tmp/switchy

# flag14:
echo ":e /tmp/getflag14" >> /tmp/switchy
echo ":%!xxd"            >> /tmp/switchy
echo "/0000b10"          >> /tmp/switchy
echo ":s/774c/754c/"     >> /tmp/switchy
echo "/0000b70"          >> /tmp/switchy
echo ":s/771b/751b/"     >> /tmp/switchy
echo "/0000ba0"          >> /tmp/switchy
echo ":s/82d4/84d4/"     >> /tmp/switchy
echo "/0000bb0"          >> /tmp/switchy
echo ":s/8424/8524/"     >> /tmp/switchy
echo ":%!xxd -r"         >> /tmp/switchy
echo ":wq"               >> /tmp/switchy
echo                     >> /tmp/switchy

# Execute vimscript on local copy of getflag

vim -s /tmp/switchy /tmp/getflag00

# Launch it
for i in `echo {00..14}`
do
	echo -n "flag$i :"
	/tmp/getflag$i | cut -d ":" -f 2
done

