FROM linuxserver/baseimage
# Thanks to Linuxserver.io for the great template
MAINTAINER spants <tony@spants.com>

# set install packages as variable
ENV APTLIST="mosquitto"

# install packages
RUN add-apt-repository ppa:mosquitto-dev/mosquitto-ppa -y && \
apt-get update -q && \
apt-get install \
$APTLIST -qy && \

# cleanup 
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add some files 
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# expose ports
EXPOSE 1883 9001

# set volumes
VOLUME /config 

