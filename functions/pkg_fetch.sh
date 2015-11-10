#!/usr/bin/env sh
#
# Fetches the package using SRC_URI (if defined)
#

pkg_fetch() {
  if [ "${SRC_URI}" ]
    then
    curl -s -o "${WORKDIR}/${A}" -L "${SRC_URI}"
    if [ "${SHA256_SRC}" ]
      then
      SHA256=$(openssl dgst -sha256 "${WORKDIR}/${A}" | cut -d' ' -f2)
      if [ "${SHA256}" != "${SHA256_SRC}" ]
        then
        die "SHA256 checksums differ! ${SHA256_SRC} != ${SHA256}"
      fi
    fi
  fi
}
