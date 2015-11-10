#!/usr/bin/env sh
#
# Contains default definitions for functions used to install packages from
# source.
#
# Define the variables DESCRIPTION and either SRC_URI or GIT_URI (and
# optionally GIT_BRANCH/GIT_COMMIT) before sourcing this file from your
# scripts.
# Redefine the functions pkg_fetch, src_unpack, src_prepare, src_configure,
# src_compile, src_install and pkg_postinst to customise those steps of the
# installation.  Default definitions for each function that should work in
# the vast majority of cases are provided here.  A main function is then
# defined which calls each function in the order listed above.
#
# See armadillo_6.200.2_install and f2c_install for examples.

source functions/pkg_preinst.sh
source functions/pkg_fetch.sh
source functions/src_unpack.sh
source functions/src_prepare.sh
source functions/src_configure.sh
source functions/src_compile.sh
source functions/src_install.sh
source functions/pkg_postinst.sh

die() {
  [ "$1" ] && echo "\033[1;31m$1\033[0m"
  exit 1
}

export CWD="$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)"

if [ $# -eq 1 ]
  then
  source "${CWD}/$1"
else
  echo "Usage: $0 <package_file>"
  exit 1
fi

# ${A} is the archive name e.g. armadillo-6.200.2.tar.gz
if [ "${SRC_URI}" ]
  then
  export A="${SRC_URI##*/}"
elif [ "${GIT_URI}" ]
  then
  export A="${GIT_URI##*/}"
  A="${A%.git}"
fi

# ${P} is the package name without the extension e.g. armadillo-6.200.2
export P="${A%.*}"
# Handle tar files with two extensions
if [ "${P##*.}" == "tar" ]
  then
  P="${P%.*}"
fi

# ${PN} is the package name without the version e.g. armadillo
export PN="${P%-*}"

# ${PV} is the package version  e.g. 6.200.2
# THIS WILL NOT WORK FOR VERSIONS OF THE FORM 6.200.2-r1 OR FOR VERSIONLESS
# TARBALLS. For those cases set PV explicitly in the package script.
export PV="${P##*-}"

# ${FILESDIR} is where the patches are stored
export FILESDIR="${CWD}/${P}-patches"

export WORKDIR="${TMPDIR:-/tmp}/${P}"

# ${S} is the build directory
export S="${WORKDIR}/${P}"

source "${CWD}/$1"

export DESTDIR="${DESTDIR:-${PREFIX}/${PN}/${PV}}"
export MODULEFILE="${MODULEFILE:-${PREFIX}/${P}}"

if [ "${HOME}" == "${WORKDIR}" -o "/" == "${WORKDIR}" ]
  then
  die "Refusing to work in \${HOME} or /"
fi

if [ -d "${WORKDIR}" ]
  then
  rm -rf "${WORKDIR}" || die "Failed to clean working directory ${WORKDIR}"
fi
mkdir "${WORKDIR}" || die "Failed to create working directory ${WORKDIR}"

echo "\033[1;32mFetching ${A} from ${SRC_URI}\033[0m"
pkg_fetch || die "Failed to fetch sources"
echo "\033[1;32mUnpacking ${A} to ${WORKDIR}\033[0m"
src_unpack || die "Failed to unpack source tarballs"

pushd "${S}" 2>&1 > /dev/null
echo "\033[1;32mPatching\033[0m"
src_prepare || die "Failed to prepare sources"
echo "\033[1;32mConfiguring\033[0m"
src_configure || die "Failed to configure source"
echo "\033[1;32mCompiling source in ${WORKDIR}\033[0m"
src_compile || die "Failed to compile source"
echo "\033[1;32mInstalling to ${DESTDIR}\033[0m"
src_install || die "Failed to install source"
echo "\033[1;32mPerforming post-installation setup\033[0m"
pkg_postinst || die "Failed to perform post-installation tasks"
popd 2>&1 > /dev/null
