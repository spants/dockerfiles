FROM linuxserver/baseimage

# Thanks to Linuxserver.io for the great template
MAINTAINER spants <tony@spants.com>

# set install packages as variable
ENV APTLIST="build-essential ruby1.9.1-dev nodejs libsqlite3-dev postgresql-server-dev-9.3"

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST -qy && \

# cleanup 
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Install dashing and bundle
RUN gem install dashing --no-rdoc --no-ri && \
gem install bundle --no-rdoc --no-ri

# add some files 
ADD defaults/ /defaults/
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh

# expose ports
EXPOSE 3030

# set volumes
VOLUME /config 
