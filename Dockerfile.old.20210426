FROM alpine:latest
RUN apk update && apk upgrade && \
    apk add --no-cache \
    make automake m4 git gdbm gdbm-dev util-linux gcc \ 
    openldap-back-mdb openldap-overlay-all openldap openldap-clients \ 
    nghttp2 libc-dev openssl-dev libc-utils autoconf libtool rsyslog-gssapi libpsl 
RUN git clone https://github.com/curl/curl.git && \
    echo pwd: && pwd && ls -larth && du -h /curl  && cd /curl && pwd && ls -larth 
# cd ./curl && pwd && \
#./configure --with-openssl --with-zlib -with-gssapi \
#   --enable-ldap --enable-ldaps --with-libpsl --with-nghttp2 && \
#   ls -larth && make -j 8 -l 90 && \
#   make -j 8 -l 90 install
ENTRYPOINT ["/usr/local/bin/curl"]
