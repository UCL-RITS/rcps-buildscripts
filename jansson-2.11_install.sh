#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2017
#

NAME=${NAME:-jansson}
VERSION=${VERSION:-2.11}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$COMPILER_TAG}
SHA256=${SHA256:-783132e2fc970feefc2fa54199ef65ee020bd8e0e991a78ea44b8586353a0947}

SRC_ARCHIVE=${SRC_ARCHIVE:-https://github.com/akheron/jansson/archive/v${VERSION}.tar.gz}

set -e

mkdir -p /dev/shm/${NAME}

temp_dir=`mktemp -d -p /dev/shm/${NAME}`

cd $temp_dir

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

sha256sum -c <<< "$SHA256 $archive"

tar -xvf $archive

cd ${NAME}-${VERSION}

./configure --prefix=$INSTALL_PREFIX
make 
make install
