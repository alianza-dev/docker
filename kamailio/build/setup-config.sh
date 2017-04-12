#!/bin/sh -e
CONFIG=${CONFIG:-"master"}
git clone -b 4.0 https://github.com/alianza-dev/kazoo-configs.git kazoo-configs
cd kazoo-configs
git reset --hard $CONFIG
cd ../
