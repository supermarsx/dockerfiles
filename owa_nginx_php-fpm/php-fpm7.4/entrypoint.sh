#!/bin/sh
CONTAINER_ALREADY_STARTED="CONTAINER_STARTED"
if [ ! -e $CONTAINER_ALREADY_STARTED ]
then
    touch $CONTAINER_ALREADY_STARTED
	echo "--- copy html backup ---"
    cp -fRv /var/www/_html/. /var/www/html
fi

echo "--- start supervisord ---"
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf