#!/bin/sh -e

git clone $REPO kamailio

cd kamailio
git checkout $COMMIT
git reset --hard $COMMIT
