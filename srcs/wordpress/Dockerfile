FROM alpine:3.19

ARG WP_VERSION="6.6.2"
WORKDIR /tmp
RUN mkdir -p /home/ecoma-ba/data
VOLUME /home/ecoma-ba/data

RUN apk add --no-cache openrc php83-fpm wget

RUN wget https://wordpress.org/wordpress-$WP_VERSION.tar.gz
RUN tar -xzvf wordpress-$WP_VERSION.tar.gz -C /home/ecoma-ba/data
