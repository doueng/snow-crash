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
rm -rf /tmp/.getflag.swp
rm -rf /tmp/getflag

cp /bin/getflag /tmp/getflag
chmod 777 /tmp/getflag


# Prepare the vimscript to reverse conditions
# convert to hex
if [ ! -s /tmp/switch14 ]
then	
	echo ":set nobackup"   > /tmp/switch14

	echo ":%!xxd"         >> /tmp/switch14
	# line b1a: swap ja -> jne
	echo "/0000b10"       >> /tmp/switch14
	echo ":s/774c/754c/"  >> /tmp/switch14
	# line b78: swap ja -> jne
	echo "/0000b70"       >> /tmp/switch14
	echo ":s/771b/751b/"  >> /tmp/switch14
	# line ba5: swap jb -> je
	echo "/0000ba0"       >> /tmp/switch14
	echo ":s/82d4/84d4/"  >> /tmp/switch14
	# line bbb: swap je -> jne
	echo "/0000bb0"       >> /tmp/switch14
	echo ":s/8424/8524/"  >> /tmp/switch14
	# convert back to binary
	echo ":%!xxd -r"      >> /tmp/switch14
	echo ":wq"            >> /tmp/switch14
	echo                  >> /tmp/switch14

	chmod 644 /tmp/switch14
fi

# Execute vimscript on local copy of getflag
vim -s /tmp/switch14 /tmp/getflag

# Launch it
/tmp/getflag

