#!/usr/bin/env sh
#
# Runs make install.
#

src_install() {
  [ -f "${S}/Makefile" ] && make DESTDIR= -C "${S}" install
}
