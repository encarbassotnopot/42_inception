FROM alpine:3

ARG WP_VERSION="6.7.2"
WORKDIR /tmp
RUN adduser -D ecoma-ba
RUN mkdir -p /home/ecoma-ba/data
VOLUME /home/ecoma-ba/data

RUN apk add --no-cache openrc php84-fpm wget

RUN wget https://wordpress.org/wordpress-$WP_VERSION.tar.gz
RUN tar -xzvf wordpress-$WP_VERSION.tar.gz -C /home/ecoma-ba/data
RUN chown -R ecoma-ba:ecoma-ba /home/ecoma-ba/data/wordpress
RUN chown -R ecoma-ba:ecoma-ba /var/log/php84

USER ecoma-ba
WORKDIR /home/ecoma-ba/data
COPY ./files/wp-config.php /home/ecoma-ba/data/wordpress/wp-config.php
COPY ./files/www.conf /etc/php84/php-fpm.d/www.conf

CMD [ "php-fpm84", "-FO" ]