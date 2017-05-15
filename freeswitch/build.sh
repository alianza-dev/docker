#!/bin/sh -e
NETWORK=${NETWORK:-"kazoo"}
REPO=${2:-"https://freeswitch.org/stash/scm/fs/freeswitch.git"}
FREESWITCH_BRANCH=v1.6
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
  --build-arg COMMIT=$FREESWITCH_BRANCH \
  --build-arg REPO=$REPO \
  -t $NETWORK/freeswitch \
  .
