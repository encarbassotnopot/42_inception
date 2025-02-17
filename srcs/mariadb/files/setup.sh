#!/bin/sh
mariadbd &

pid=$!

echo "Waiting for mariadb to come online"
until mariadb -e "SELECT 1" >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

echo
echo "Setting up database"
mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;\
CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$DB_PASSWORD';\
GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%';\
FLUSH PRIVILEGES;"

kill -SIGTERM $pid
wait $pid