FROM alpine:3.19

RUN apk add --no-cache nginx

COPY ./files/nginx.conf /etc/nginx/nginx.conf
COPY ./files/index.html /www/index.html
EXPOSE 80 443
ENTRYPOINT ["nginx"]
