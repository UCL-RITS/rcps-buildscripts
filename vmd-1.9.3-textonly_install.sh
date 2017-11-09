#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2017
#

NAME=${NAME:-}
VERSION=${VERSION:-}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$COMPILER_TAG}
MD5=${MD5:-}
SHA1=${SHA1:-}
SHA256=${SHA256:-}

SRC_ARCHIVE=${SRC_ARCHIVE:-}

set -e

mkdir -p /dev/shm/${NAME}

temp_dir=`mktemp -d -p /dev/shm/${NAME}`

cd $temp_dir

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

md5sum -c <<< "$MD5 $archive"
sha1sum -c <<< "$SHA1 $archive"
sha256sum -c <<< "$SHA256 $archive"

tar -xvf $archive

cd ${NAME}-${VERSION}

./configure --prefix=$INSTALL_PREFIX
make 
make install
