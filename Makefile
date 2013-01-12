NAME = sdk-client
PREFIX = /usr
BINDIR = $(PREFIX)/bin

EXECUTABLES = src/install-rpm

all:
	@echo "No build needed"

install:
	@echo "Installing application...";
	mkdir -p $(DESTDIR)$(BINDIR)
	cp -r $(EXECUTABLES) $(DESTDIR)$(BINDIR)

.PHONY: all install
