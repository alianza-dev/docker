#!/bin/bash
COMMAND=${1:-"console"}
export KAZOO_CONFIG=$HOME/config/$CONFIG_FILE_NAME
echo "Using config:" $KAZOO_CONFIG
export KAZOO_NODE=$NODE_NAME@$(hostname)
export KAZOO_APPS=sysconf,blackhole,callflow,cdr,conference,crossbar,fax,hangups,media_mgr,milliwatt,omnipresence,pivot,registrar,reorder,stepswitch,teletype,trunkstore,webhooks,ecallmgr
export RELX_REPLACE_OS_VARS=true
export KZname="-name $KAZOO_NODE"

cd kazoo
exec _rel/kazoo/bin/kazoo $COMMAND $*
