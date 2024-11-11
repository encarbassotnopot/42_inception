all: build run

SRC = $(CURDIR)/srcs/
FILE = $(SRC)/docker-compose.yml
DC = sudo docker-compose -f $(FILE)
SECRETS = $(SRC)/secrets/

build: certs
	$(DC) build

certs: | $(SECRETS)
	openssl req -x509 -newkey rsa-pss -pkeyopt rsa_keygen_bits:2048 -subj "/CN=ca" -sha256 -nodes -keyout $(SECRETS)/ca.key -out $(SECRETS)/ca.cer
	openssl req -newkey rsa-pss -pkeyopt rsa_keygen_bits:2048 -subj "/CN=server" -sha256 -nodes -keyout $(SECRETS)/server.key -out $(SECRETS)/server.csr
	openssl x509 -req -CAcreateserial -in $(SECRETS)/server.csr -sha256 -CA $(SECRETS)/ca.cer -CAkey $(SECRETS)/ca.key -out $(SECRETS)/server.cer

$(SECRETS):
	mkdir $(SECRETS)

run:
	$(DC) up

rund:
	$(DC) up -d

clean:
	$(DC) down
	$(DC) rm 

.PHONY: all build run rund clean
