FROM alpine:latest
RUN apk update && apk upgrade
RUN apk add --no-cache \
    make automake git gdbm gdbm-dev util-linux gcc openldap openldap-clients \ 
    nghttp2 libc-dev openssl-dev libc-utils autoconf libtool rsyslog-gssapi libpsl
RUN git clone https://github.com/curl/curl.git
RUN cd /curl && ./buildconf  
RUN cd /curl && ./configure --with-zlib -with-gssapi --enable-ldap --enable-ldaps \
    --with-libpsl --with-nghttp2
RUN cd /curl && ls -larth && make -j 8 -l 90
RUN cd /curl && make -j 8 -l 90 install
ENTRYPOINT ["/usr/local/bin/curl"]

# FROM scratch
# COPY --from=0 /etc/hosts /etc/hosts
# COPY --from=0 /etc/passwd /etc/passwd
# COPY --from=0 /usr/lib/ /usr/lib/
# COPY --from=0 /lib/ /lib/

