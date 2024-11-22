#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2018
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2

NAME=${NAME:-}
VERSION=${VERSION:-}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$COMPILER_TAG}
MD5=${MD5:-}
SHA1=${SHA1:-}
SHA256=${SHA256:-}
SHA512=${SHA512:-}

SRC_ARCHIVE=${SRC_ARCHIVE:-}


mkdir -p /dev/shm/$(whoami)/${NAME}

temp_dir=$(mktemp -d -p /dev/shm/$(whoami)/${NAME})

cd $temp_dir

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

md5sum -c <<< "$MD5 $archive"
sha1sum -c <<< "$SHA1 $archive"
sha256sum -c <<< "$SHA256 $archive"
sha512sum -c <<< "$SHA512 $archive"

tar -xvf $archive

cd ${NAME}-${VERSION}

./configure --prefix=$INSTALL_PREFIX
make 
make install

rm -rf $temp_dir
