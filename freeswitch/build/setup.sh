#!/bin/sh -e

git clone $REPO freeswitch

cd freeswitch
git checkout $COMMIT
git reset --hard $COMMIT
cd ..
