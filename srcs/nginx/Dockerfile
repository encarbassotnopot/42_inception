FROM alpine:3.19

RUN apk add --no-cache nginx

COPY ./files/nginx.conf /etc/nginx/nginx.conf
COPY ./files/index.html /www/index.html
COPY ./secrets/server.crt /etc/nginx/ssl/server.crt
COPY ./secrets/server.key /etc/nginx/ssl/server.key
EXPOSE 443
ENTRYPOINT ["nginx"]
