NAME = sdk-client
PREFIX = /usr
BINDIR = $(PREFIX)/bin
CONFDIR = $(PREFIX)/etc
SYSTEMDDIR = $(PREFIX)/lib/systemd/system

EXECUTABLES = src/install-rpm src/sdk-shutdown
CONF = etc/*

all:
	@echo "No build needed"

install:
	@echo "Installing application...";
	mkdir -p $(DESTDIR)$(BINDIR)
	cp -r $(EXECUTABLES) $(DESTDIR)$(BINDIR)

	mkdir -p $(DESTDIR)$(CONFDIR)
	cp -r $(EXECUTABLES) $(DESTDIR)$(BINDIR)
	mkdir -p $(DESTDIR)$(SYSTEMDDIR)/sysinit.target.wants/
	cp -r systemd/etc-ssh-authorized_keys.mount $(DESTDIR)$(SYSTEMDDIR)
	ln -s ../etc-ssh-authorized_keys.mount $(DESTDIR)$(SYSTEMDDIR)/sysinit.target.wants/

	mkdir -p $(DESTDIR)/opt/sdk/
	chown -R $DEVICEUSER /opt/sdk


.PHONY: all install
