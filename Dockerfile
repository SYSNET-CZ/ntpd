FROM alpine:latest

ENV TZ=Europe/Prague
RUN apk add --no-cache openntpd
COPY conf/ntpd.conf /etc/ntpd.conf
EXPOSE 123/udp
HEALTHCHECK CMD ntpctl -s status || exit 1
ENTRYPOINT [ "/usr/sbin/ntpd", "-v", "-d", "-s" ]
