#!/bin/bash

# copy over the files if they are missing
if [ ! -f "/config/start.sh" ]; then
cp -R /defaults/* /config
chmod -R 666 /config
chmod +x /config/start.sh
fi

chown -R abc:abc /config
