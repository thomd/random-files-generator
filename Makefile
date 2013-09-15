PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin
MANDIR ?= ${PREFIX}/share/man
VERSION := $(shell bin/files -v)

install:
	install -d ${DESTDIR}${BINDIR}
	install -m 755 bin/files ${DESTDIR}${BINDIR}
	install -d ${DESTDIR}${MANDIR}/man1
	install -m 644 man/files.1 ${DESTDIR}${MANDIR}/man1

uninstall:
	rm -f ${DESTDIR}${BINDIR}/files
	rm -f ${DESTDIR}${MANDIR}/man1/files.1

test:
# https://github.com/sstephenson/bats
	bats test/files.bats

man: man/files.1

man/files.1: man/files.1.md
# https://github.com/kapouer/marked-man
	marked-man --version=${VERSION} man/files.1.md > man/files.1

.PHONY: install uninstall test man


