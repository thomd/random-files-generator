DESTDIR ?= /usr/local
BINDIR = ${DESTDIR}/bin
MANDIR = ${DESTDIR}/share/man
VERSION := $(shell bin/files -v)

install:
	install -d ${BINDIR}
	install -m 755 bin/files ${BINDIR}
	install -d ${MANDIR}/man1
	install -m 644 man/files.1 ${MANDIR}/man1

uninstall:
	rm -f ${BINDIR}/files
	rm -f ${MANDIR}/man1/files.1

test:
# https://github.com/sstephenson/bats
	bats test/files.bats

man: man/files.1

man/files.1: man/files.1.md
# https://github.com/kapouer/marked-man
	marked-man --version=${VERSION} man/files.1.md > man/files.1

.PHONY: install uninstall test man


