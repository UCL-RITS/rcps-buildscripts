#!/usr/bin/env bash

###############################################
# Installing VMD (binary)
#
# by Owain Kenway, 2017
#

NAME=${NAME:-vmd}
VERSION=${VERSION:-1.9.3}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/text-only}

SRC_ARCHIVE=${SRC_ARCHIVE:-/shared/ucl/apps/vmd/source/vmd-$VERSION.bin.LINUXAMD64.text.tar.gz}

set -e

mkdir -p /dev/shm/${NAME}

temp_dir=`mktemp -d -p /dev/shm/${NAME}`

cd $temp_dir

tar -xvf $SRC_ARCHIVE

cd ${NAME}-${VERSION}
export VMDINSTALLBINDIR=$INSTALL_PREFIX/bin
export VMDINSTALLLIBRARYDIR=$INSTALL_PREFIX/lib

./configure 
cd src
make install
