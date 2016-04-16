#!/bin/bash

# copy over the files if they are missing
if [ ! -f "/config/mosquitto.conf" ]; then
cp -R /defaults/* /config
mkdir /config/data
mkdir /config/log
#touch /config/log/mosquitto.log
fi

# copy over an empty password if missing
if [ ! -f "/config/passwords.mqtt" ]; then
touch /config/passwords.mqtt
fi

# add unencrypted password file to the beginning of password.mqtt
if [  -f "/config/passwords.txt" ]; then
mosquitto_passwd -U /config/passwords.txt
cat  /config/passwords.mqtt >> /config/passwords.txt
rm /config/passwords.mqtt
mv /config/passwords.txt /config/passwords.mqtt
fi

chmod -R 666 /config
chown -R abc:abc /config
