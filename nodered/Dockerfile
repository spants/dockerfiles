# Dockerfile for Node-RED - pulls latest master code from git
FROM phusion/baseimage:0.9.16
MAINTAINER spants <tony@spants.com>
 
# based on the original by @cpswan and mods by ceejay

# make sure everything is up to date - update and upgrade
RUN apt-get update -y
# RUN apt-get upgrade -y
 
# install dependencies
RUN apt-get install python-software-properties wget curl unzip git g++ make -y
 
# Note the new setup script name for Node.js v0.12
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

# Then install with:
RUN sudo apt-get install -y nodejs

# Install node-red
RUN sudo npm install -g --unsafe-perm node-red

# install node-red node_modules

RUN cd /usr/lib/node_modules/node-red && npm install eyes js2xmlparser fs.notify node-red-contrib-ibmpush node-red-contrib-googlechart node-red-contrib-nest node-red-contrib-splitter
RUN cd /usr/lib/node_modules/node-red && npm install json-db-node-red node-red-contrib-freeboard node-red-contrib-sunevents node-red-node-badwords node-red-node-exif
RUN cd /usr/lib/node_modules/node-red && npm install node-red-node-geofence node-red-node-mysql node-red-node-ping node-red-node-wol node-red-node-web-nodes node-red-node-base64 node-red-node-geohash node-red-node-twilio
RUN cd /usr/lib/node_modules/node-red && npm install node-red-node-pushbullet node-red-node-aws node-red-contrib-ibm-watson-iot node-red-contrib-timeseries 
RUN cd /usr/lib/node_modules/node-red && npm install node-red-node-emoncms node-red-contrib-hue node-red-contrib-blynk node-red-contrib-pebble-watch node-red-node-twitter node-red-contrib-graphs
RUN cd /usr/lib/node_modules/node-red && npm install node-red-contrib-influxdb node-red-contrib-bigtimer node-red-contrib-firebase 
RUN cd /usr/lib/node_modules/node-red && npm install node-red-contrib-ui node-red-contrib-admin node-red-node-smooth node-red-contrib-scx-ibmiotapp

# Install dependancies for node-red-contrib-json
RUN sudo apt-get install -y jq
RUN cd /usr/lib/node_modules/node-red && npm install JSONSelect JSONPath node-red-contrib-json 

# Install dependancies for node-red-contrib-eibd 
RUN cd /usr/lib/node_modules/node-red && npm install node-red-contrib-eibd 

# Install dependancies for node-red-contrib-hive (modded)
RUN cd /usr/lib/node_modules/node-red && npm install https://github.com/aklambeth/bg-hive-api#v1.0.4
RUN cd /usr/lib/node_modules/node-red && npm install https://github.com/aklambeth/node-red-contrib-hive#v0.1.1

# Install socket.io client
#RUN cd /usr/lib/node_modules/node-red && npm install https://github.com/socketio/socket.io-client#0.9
#RUN cd /usr/lib/node_modules/node-red && npm install https://github.com/closer8888/node-red-contrib-socketio-client

# expose port
EXPOSE 1880

# set volumes
VOLUME /data 
 
# Set the default command to execute
# when creating a new container
CMD node-red -v --userDir /data flow.json