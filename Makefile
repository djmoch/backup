# See LICENSE file for copyright and license information
.POSIX:

VERSION = 1.0.1-dev0

DIST_SRC = \
	Makefile \
	backup \
	backup.service \
	backup.timer \
	config \
	LICENSE \
	README

PREFIX = /usr/local
LIBEXECDIR = ${PREFIX}/libexec
SYSCONFDIR = /etc

all: install

install:
	install -Dm755 backup ${DESTDIR}${LIBEXECDIR}/backup/backup
	install -Dm600 config ${DESTDIR}${SYSCONFDIR}/backup

uninstall:
	rm -f ${DESTDIR}${LIBEXECDIR}/backup/backup
	rm -f ${DESTDIR}${SYSCONFDIR}/backup

dist:
	mkdir backup-${VERSION}
	cp -r ${DIST_SRC} backup-${VERSION}
	tar cf - backup-${VERSION} | gzip > backup-${VERSION}.tar.gz

distclean:
	rm -rf backup-*

.PHONY: all install uninstall
