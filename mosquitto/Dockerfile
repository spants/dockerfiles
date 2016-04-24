FROM linuxserver/baseimage
# Thanks to Linuxserver.io for the great template
MAINTAINER spants <tony@spants.com>


# install packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install wget build-essential libwrap0-dev libssl-dev python-distutils-extra libc-ares-dev uuid-dev libwebsockets-dev -y
RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src
RUN wget http://mosquitto.org/files/source/mosquitto-1.4.8.tar.gz
RUN tar xvzf ./mosquitto-1.4.8.tar.gz
WORKDIR /usr/local/src/mosquitto-1.4.8
RUN make WITH_WEBSOCKETS=yes
RUN make install

# add some files 
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# expose ports
EXPOSE 1883 9001

# set volumes
VOLUME /config 

