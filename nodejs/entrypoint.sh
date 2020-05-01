#!/bin/sh
CONTAINER_ALREADY_STARTED="CONTAINER_STARTED"
if [ ! -e $CONTAINER_ALREADY_STARTED ]
then
    touch $CONTAINER_ALREADY_STARTED
	echo "--- install dependencies ---"
    npm install
fi

echo "--- start supervisord ---"
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf