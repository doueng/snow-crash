
# First download john the ripper :
curl -O https://www.openwall.com/john/k/john-1.9.0.tar.gz;
tar -xvf john-1.9.0.tar.gz;
cd john-1.9.0/src;
make clean linux-x86-64;

# Copy the /etc/passwd file from snowcrash iso :
scp -P 4242 level00@127.0.0.1:/etc/passwd .

# run the ripper on it :
./john-1.9.0/run/john passwd
./john-1.9.0/run/john --show passwd | grep flag01 | cut -d ':' -f 2
