#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://github.com/kamailio/kamailio.git"}
KAMAILIO_BRANCH=4.4
CONFIG_BRANCH=alz-4.0

if [ ! -d "etc/kazoo-configs" ]; then
       git clone https://github.com/alianza-dev/kazoo-configs.git ./etc/kazoo-configs
fi

cd etc/kazoo-configs
git fetch
git checkout $CONFIG_BRANCH
git reset --hard $CONFIG_BRANCH
cd ../../

docker build $BUILD_FLAGS \
	--build-arg COMMIT=$KAMAILIO_BRANCH \
	--build-arg REPO=$REPO \
	--build-arg CONFIG=ef98bf453cb81475bbf5ccbc0635749a975b093c \
	-t $NETWORK/kamailio \
	.
