#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/kamailio/kamailio.git"}
COMMIT=4.4.5
CONFIG=4.0.0

echo $COMMIT > etc/commit

if [ -d "etc/kazoo-configs" ]; then
	cd etc/kazoo-configs
	git checkout $CONFIG
	git reset --hard $CONFIG
	cd ../../
else
	git clone -b $CONFIG https://github.com/alianza-dev/kazoo-configs.git etc/kazoo-configs
fi

docker build $BUILD_FLAGS \
	--build-arg REPO=$REPO \
	--build-arg CONFIG=ef98bf453cb81475bbf5ccbc0635749a975b093c \
	-t $NETWORK/kamailio \
	.
