#/usr/bin/env sh
#
# Patches the source prior to compiling.  Patches are expected to be in
# FILESDIR and named 0000_packagename-version-whatever.patch, e.g.
# 0000_armadillo-6.200.2-fix-includes.patch
# Patches will be applied in alphanumerical order.

src_prepare() {
  if [ -d "${FILESDIR}" ]
    then
    for patch in "${FILESDIR}"/*_"${P}"-*.patch
      do
      patch -p0 < "${patch}"
    done
  fi
}
