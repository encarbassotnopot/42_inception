FROM alpine:3.21

RUN apk add --no-cache mariadb mariadb-client
RUN apk add --no-cache openrc
RUN apk add --no-cache mariadb-server-utils

VOLUME /home/ecoma-ba/data
RUN mkdir -p /home/ecoma-ba/data
RUN chown -R mysql:mysql /home/ecoma-ba

COPY ./files/my.cnf /etc/my.cnf
COPY ./files/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chown -R mysql:mysql /home/ecoma-ba
RUN mariadb-install-db

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
USER mysql
WORKDIR /home/ecoma-ba/data

CMD ["mariadbd"]
