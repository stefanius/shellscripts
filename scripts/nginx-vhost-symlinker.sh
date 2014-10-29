#!/bin/sh
find / -name "*.vhost" | while read file; do

SYMLINK=/etc/nginx/sites-enabled/$(basename $file)

if [ -f $SYMLINK ];
then
   echo "Symlink $SYMLINK already defined"
else
   ln -s ${file} ${SYMLINK%.*}.conf
fi

done

sudo service nginx status
sudo service nginx stop
sudo service nginx status
sudo service nginx start
sudo service nginx status
sudo service nginx reload
exit 0