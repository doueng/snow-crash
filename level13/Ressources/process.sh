#!/bin/sh

# objdump -d level13 | grep "<main>" -A 25

# Exec checks if uid is equal to a value
# 804859a:  3d 92 10 00 00      cmp
# 804859f:  74 2a               je
# Goal:     75 2a               jne

# Change condition
# 0000590: e4f0 83ec 10e8 e6fd ffff 3d92 1000 0074  ..........=....t
# -------: ---- ---- ---- ---- ---- ---- ---- --75  ----------------

# Copy binary
cp ~/level13 /tmp/lvl13

# Create vimscript
echo ":%!xxd"         > /tmp/vswap13
echo "/000059"       >> /tmp/vswap13
echo ":s/0074/0075/" >> /tmp/vswap13
echo ":%!xxd -r"     >> /tmp/vswap13
echo ":wq"           >> /tmp/vswap13
echo                 >> /tmp/vswap13

# Exec vimscript on copy of binary
vim -s /tmp/vswap13 /tmp/lvl13

# Launch it
/tmp/lvl13
