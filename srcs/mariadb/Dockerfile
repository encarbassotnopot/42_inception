FROM alpine:3.21

RUN apk add --no-cache mariadb mariadb-client

RUN mkdir -p /home/ecoma-ba/data/mariadb
VOLUME /home/ecoma-ba/data
RUN mkdir -p /home/ecoma-ba/data
RUN chown -R mysql:mysql /home/ecoma-ba

COPY ./files/my.cnf /etc/my.cnf
COPY ./files/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chown -R mysql:mysql /home/ecoma-ba
RUN mariadb-install-db --skip-test-db
COPY --chown=mysql:mysql --chmod=755 ./files/setup.sh /home/ecoma-ba/data/setup.sh 

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld

USER mysql
WORKDIR /home/ecoma-ba/data

RUN /home/ecoma-ba/data/setup.sh

CMD [ "mariadbd" ]