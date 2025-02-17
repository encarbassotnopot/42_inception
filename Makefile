SHELL = bash
SRC = $(CURDIR)/srcs
FILE = $(SRC)/docker-compose.yml
DC = docker-compose -f $(FILE)
SECRETS = $(SRC)/secrets/

all: build run

build: certs
	$(DC) build

certs: | $(SECRETS)
	openssl req -x509 -out $(SECRETS)/server.crt -keyout $(SECRETS)/server.key \
	-newkey rsa:2048 -nodes -sha256 \
	-subj '/CN=inception' -extensions EXT -config <( \
	printf "[dn]\nCN=inception\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:ecoma-ba.42.fr\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")

$(SECRETS):
	mkdir $(SECRETS)

run:
	$(DC) up

rund:
	$(DC) up -d

clean:
	$(DC) down -v

re: clean all

.PHONY: all build certs run rund clean re
