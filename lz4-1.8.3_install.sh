#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2017
#

COMPILER_TAG=${COMPILER_TAG:-gnu-4.9.2}
NAME=${NAME:-lz4}
VERSION=${VERSION:-1.8.3}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$COMPILER_TAG}
SRC_ARCHIVE=${SRC_ARCHIVE:-https://github.com/lz4/lz4.git}

set -e

mkdir -p /dev/shm/${NAME}

temp_dir=`mktemp -d -p /dev/shm/${NAME}`

cd $temp_dir

git clone $SRC_ARCHIVE

cd ${NAME}
git checkout v$VERSION
mkdir -p $INSTALL_PREFIX
make PREFIX=$INSTALL_PREFIX
make install PREFIX=$INSTALL_PREFIX

rm -rf $temp_dir
