#!/bin/bash

# -------------------- SET ROOT USER --------------------------------------------------------------------------------

echo $ROOT_PASS > /root/pw.txt
echo "root:$(cat /root/pw.txt)" | chpasswd

# -------------------- APACHE INIT ----------------------------------------------------------------------------------

sudo a2enmod cgi
service apache2 restart

# apache2ctl -k start -X -D PERLDB

# -------------------- Apache IMGS Folder ---------------------------------------------------------------------------

mkdir /var/www/html/imgs
chmod 777 /var/www/html/imgs

# -------------------- SSH INIT -------------------------------------------------------------------------------------

# /usr/sbin/sshd -D &
# wait ${!}

exec /usr/sbin/sshd -D
