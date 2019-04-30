#!/bin/sh
# Read the pcap dump on SC :
tcpdump -qns 0 -X -r /home/user/level02/level02.pcap | grep Password -A 1000 | grep "tcp 1" -A 4 | grep 0x0030
echo "ft_waNDReL0L"

# The packet value is the last byte in Hex
# 7f stands for delete
# 0d for carriage return -> end of password transmission

