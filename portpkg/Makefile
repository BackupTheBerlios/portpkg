PROGNAME=portpkg

DESTDIR=
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
CONFDIR=/etc/portpkg
MANDIR=$(PREFIX)/man/man1
VERSION=cvs

default: all

all:
	@echo "All done. Now type make install!"

install:
	# directories
	install -d $(DESTDIR)$(CONFDIR)/plugins
	install -d $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(MANDIR)
	# configuration
	install -m 644 mirrors $(DESTDIR)$(CONFDIR)/
	install -m 644 virtual $(DESTDIR)$(CONFDIR)/
	install -m 644 synonyms $(DESTDIR)$(CONFDIR)/
	install -m 644 plugins/sync.* $(DESTDIR)$(CONFDIR)/plugins/
	install -m 644 plugins/report.* $(DESTDIR)$(CONFDIR)/plugins/
	install -m 644 plugins/export.* $(DESTDIR)$(CONFDIR)/plugins/
	install -m 644 plugins/addon.* $(DESTDIR)$(CONFDIR)/plugins/
	# local.conf.sample
	echo -e "\
	#\n\
	# This is the default configuration if no external configuration file is\n\
	# present.\n\
	#\n\
	# Place this file either in $(CONFDIR) as local.conf or in your home\n\
	# directory as ~/.portpkg.conf!\n\
	#\n\
	" >$(DESTDIR)$(CONFDIR)/local.conf.sample
	grep "^[A-Z0-9_]*=.* # ." portpkg >>$(DESTDIR)$(CONFDIR)/local.conf.sample
	# man page
	install -m 644 portpkg.1 $(DESTDIR)$(MANDIR)/
	# executables
	install -m 755 portpkg $(DESTDIR)$(BINDIR)/
	install -m 755 pp-config $(DESTDIR)$(BINDIR)/
	install -m 755 checkpkg $(DESTDIR)$(BINDIR)/
	install -m 755 autoport $(DESTDIR)$(BINDIR)/

install-unstable:
	# install gui
	install -d $(DESTDIR)$(PREFIX)/share/applications
	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
	install -m 755 gportpkg $(DESTDIR)$(BINDIR)/
	install -m 644 logo.png $(DESTDIR)$(PREFIX)/share/pixmaps/portpkg.png
	install -m 644 logo.svg $(DESTDIR)$(PREFIX)/share/pixmaps/portpkg.svg
	install -m 644 gportpkg.desktop $(DESTDIR)$(PREFIX)/share/applications/
	# ash seems to be much faster
	for i in portpkg pp-config checkpkg autoport gportpkg; do \
	    sed -i "1s,^#!/bin/sh,#!/bin/ash," $(DESTDIR)$(BINDIR)/$$i; \
	done

release:
	rm -rf /tmp/portpkg-$(VERSION)
	rm -f /tmp/portpkg-$(VERSION).tar.bz2
	mkdir -p /tmp/portpkg-$(VERSION)
	cp -a . /tmp/portpkg-$(VERSION)
	cd /tmp/portpkg-$(VERSION) && \
	    find -name CVS -depth -exec rm -rf {} \; && \
	    sed -i "s,^ENGINE_VER=.*$$,ENGINE_VER=$(VERSION)," portpkg
	cd /tmp && \
	    tar cjf portpkg-$(VERSION).tar.bz2 portpkg-$(VERSION)
