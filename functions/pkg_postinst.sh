#!/usr/bin/env sh
#
# Runs post installation package tasks.  Creates a modulefile in MODULEFILE.
#

pkg_postinst() {
  echo "Writing modulefile to ${MODULEFILE}"
  mkdir -p "${MODULEFILE%/*}" && \
  cat > "${MODULEFILE}" <<EOF
#%Module -*- tcl -*-
##
## dot modulefile
##
proc ModulesHelp { } {
  puts stderr "\tAdds ${PN}"
}

module-whatis "${DESCRIPTION}"

set             root            ${DESTDIR}

conflict ${PN}

append-path LD_RUN_PATH       \$root/lib
append-path LD_LIBRARY_PATH   \$root/lib
append-path CMAKE_PREFIX_PATH \$root
append-path CPATH             \$root/include
append-path INCLUDE_PATH      \$root/include
append-path LIBRARY_PATH      \$root/lib

setenv  ${PN}_LIBRARY_DIR     \$root/lib
setenv  ${PN}_INCLUDE_DIR     \$root/include
EOF
}
