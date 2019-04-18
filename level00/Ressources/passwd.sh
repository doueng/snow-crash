# Get /usr/sbin/john from server :
scp -P 4242 level00@127.0.0.1:/usr/sbin/john .
chmod 644 john 

# Rot 11 it :
cat john | tr 'A-Za-z' 'L-ZA-Kl-za-k'
