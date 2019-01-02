#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2018
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2
require python/3.6.3

NAME=${NAME:-ngsutils}
VERSION=${VERSION:-0.5.9}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$COMPILER_TAG}
MD5=${MD5:-6212d6de740c42aa2c6b5f6785465860}
SHA1=${SHA1:-c68e7f7a5412add55295336a138863d73e6216c4}
SHA256=${SHA256:-37587921459e91ad0dbaebc70bea04e9837464214a8c12e08c5db0a1e7078440}
SHA512=${SHA512:-77320f3334a12eab4414267ca32b57ad84f64fd68f825f5783408be051b6198bdaaaf7cc8b40381a2112307169af41d563589ece99ed0ada1ae776d94319e4dd}

SRC_ARCHIVE=${SRC_ARCHIVE:-https://github.com/ngsutils/ngsutils/archive/ngsutils-${VERSION}.tar.gz}

mkdir -p $INSTALL_PREFIX
cd $INSTALL_PREFIX

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

md5sum -c <<< "$MD5 $archive"
sha1sum -c <<< "$SHA1 $archive"
sha256sum -c <<< "$SHA256 $archive"
sha512sum -c <<< "$SHA512 $archive"

tar -xvf $archive

rm -rf ${INSTALL_PREFIX}/${NAME}-${VERSION}

mv ngsutils-ngsutils-${VERSION} ${NAME}-${VERSION}

cd ${NAME}-${VERSION}

make 
