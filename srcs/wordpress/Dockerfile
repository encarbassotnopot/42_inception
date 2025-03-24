FROM alpine:3.21

ARG WP_VERSION="6.7.2"
WORKDIR /tmp
RUN adduser -D ecoma-ba
RUN mkdir -p /home/ecoma-ba/data
VOLUME /home/ecoma-ba/data

RUN apk add --no-cache wget
RUN apk add --no-cache php84 php84-fpm php84-mysqli php84-phar php84-mbstring

RUN wget https://wordpress.org/wordpress-$WP_VERSION.tar.gz
RUN tar -xzvf wordpress-$WP_VERSION.tar.gz -C /home/ecoma-ba/data

COPY ./files/wp-config.php /home/ecoma-ba/data/wordpress/wp-config.php
COPY ./files/www.conf /etc/php84/php-fpm.d/www.conf
COPY --chown=ecoma-ba:ecoma-ba --chmod=755 ./files/entrypoint.sh /home/ecoma-ba/data/entrypoint.sh

RUN chown -R ecoma-ba:ecoma-ba /home/ecoma-ba
RUN chown -R ecoma-ba:ecoma-ba /var/log/php84

WORKDIR /home/ecoma-ba/data
USER ecoma-ba

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

CMD [ "./entrypoint.sh" ]
