NAME = sdk-client
PREFIX = /usr
BINDIR = $(PREFIX)/bin
CONFDIR = /etc
UNITDIR = /lib/systemd/system

EXECUTABLES = src/install-rpm src/sdk-shutdown src/sdk-setup-emulan
CONF = etc/*

all:
	@echo "No build needed"

install:
	@echo "Installing application...";
	mkdir -p $(DESTDIR)$(BINDIR)
	cp -r $(EXECUTABLES) $(DESTDIR)$(BINDIR)

	mkdir -p $(DESTDIR)$(CONFDIR)
	cp -r $(CONF) $(DESTDIR)$(CONFDIR)

	mkdir -p $(DESTDIR)/opt/sdk/
#	chown -R $(DEVICEUSER) nemo /opt/sdk

#	sdk-client-emul
	mkdir -p $(DESTDIR)$(UNITDIR)
	cp --no-dereference systemd/* $(DESTDIR)/$(UNITDIR)/


.PHONY: all install
