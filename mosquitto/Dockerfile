FROM alpine:3.3

EXPOSE 1883
EXPOSE 9883


# set volumes
VOLUME /config 
# VOLUME ["/var/lib/mosquitto", "/etc/mosquitto", "/etc/mosquitto.d"]

RUN addgroup -S mosquitto && \
    adduser -S -H -h /var/empty -s /sbin/nologin -D -G mosquitto mosquitto

ENV PATH=/usr/local/bin:/usr/local/sbin:$PATH
ENV MOSQUITTO_VERSION=v1.4.8

COPY run.sh /
RUN buildDeps='git alpine-sdk openssl-dev libwebsockets-dev c-ares-dev util-linux-dev hiredis-dev curl-dev libxslt docbook-xsl'; \
    chmod +x /run.sh && \
    mkdir -p /var/lib/mosquitto && \
    touch /var/lib/mosquitto/.keep && \
    mkdir -p /etc/mosquitto.d && \
    apk update && \
    apk add $buildDeps hiredis libwebsockets libuuid c-ares openssl curl ca-certificates && \
    git clone git://git.eclipse.org/gitroot/mosquitto/org.eclipse.mosquitto.git && \
    cd org.eclipse.mosquitto && \
    git checkout ${MOSQUITTO_VERSION} -b ${MOSQUITTO_VERSION} && \
    sed -i -e "s|(INSTALL) -s|(INSTALL)|g" -e 's|--strip-program=${CROSS_COMPILE}${STRIP}||' */Makefile */*/Makefile && \
    sed -i "s@/usr/share/xml/docbook/stylesheet/docbook-xsl/manpages/docbook.xsl@/usr/share/xml/docbook/xsl-stylesheets-1.78.1/manpages/docbook.xsl@" man/manpage.xsl && \
    # wo WITH_MEMORY_TRACKING=no, mosquitto segfault after receiving first message
    make WITH_MEMORY_TRACKING=no WITH_SRV=yes WITH_WEBSOCKETS=yes && \
    make install && \
    apk del $buildDeps && rm -rf /var/cache/apk/*


# add some files 
ADD defaults/ /defaults/
# ADD mosquitto.conf /etc/mosquitto/mosquitto.conf

ENTRYPOINT ["/run.sh"]
CMD ["mosquitto"]








