#!/bin/sh -e
LOCAL=/usr/local/kamailio/etc/kamailio/local.cfg

MY_IP=$(hostname -i)

# ip address
/bin/sed -i "s/MY_IP_ADDRESS!.*!/MY_IP_ADDRESS!$MY_IP!/g" $LOCAL

# domain
/bin/sed -i "s/kamailio.2600hz.com/$HOSTNAME/g" $LOCAL

# rabbitmq
/bin/sed -i "s/MY_AMQP_URL!.*!/MY_AMQP_URL!kazoo:\/\/guest:guest@$RABBITMQ:5672!/g" $LOCAL

/bin/sed -i "s/MY_AMQP_SECONDARY_URL!.*!/MY_AMQP_SECONDARY_URL!kazoo:\/\/guest:guest@$RABBITMQ_SECONDARY:5672!/g" $LOCAL

/bin/sed -i "s/MY_AMQP_TERTIARY_URL!.*!/MY_AMQP_TERTIARY_URL!kazoo:\/\/guest:guest@$RABBITMQ_TERTIARY:5672!/g" $LOCAL

# advertise
if [ ! -z "$EXT_IP" ]
then
	/bin/sed -i "s/listen=UDP_SIP/listen=UDP_SIP advertise $EXT_IP:5060/" $LOCAL
fi
