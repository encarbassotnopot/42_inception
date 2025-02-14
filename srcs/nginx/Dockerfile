FROM alpine:3.21

RUN adduser -D ecoma-ba
RUN mkdir -p /home/ecoma-ba/data
VOLUME /home/ecoma-ba/data

RUN apk add --no-cache nginx

COPY ./files/nginx.conf /etc/nginx/nginx.conf
WORKDIR /home/ecoma-ba/data
EXPOSE 443

CMD ["nginx"]
