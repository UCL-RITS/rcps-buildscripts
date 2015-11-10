#!/usr/bin/env sh
#
# Fetches the package using SRC_URI (if defined)
#

pkg_fetch() {
  [ "${SRC_URI}" ] && curl -s -o "${WORKDIR}/${A}" -L "${SRC_URI}" 
}
