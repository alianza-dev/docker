#!/bin/sh -e
NETWORK=${1:-"kazoo"}
for CONTAINER in monster-ui kazoo rabbitmq freeswitch couchdb
do
	if [ "$(docker inspect -f {{.State.Running}} $CONTAINER.$NETWORK)" = "true" ]
	then
		echo `bin/get-ip $CONTAINER.$NETWORK` $CONTAINER.$NETWORK
	fi
done
exit
