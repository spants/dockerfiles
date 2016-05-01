docker-mosquitto
================

An Alpine 3.3 Docker image for mosquitto 1.4.8 with websockets and password support
based on jllopis/docker-mosquitto

## Run

    docker run -d -p 1883:1883 -p 9001:9001 -v /mnt/user/docker/appdata/mqtt:/config spants/mqtt

Exposes Port 1883 (MQTT) 9001 (Websocket MQTT)


