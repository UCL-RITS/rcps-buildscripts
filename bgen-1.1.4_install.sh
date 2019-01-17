#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2018
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2

NAME=${NAME:-bgen}
VERSION=${VERSION:-1.1.4}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION}
SHA256=${SHA256:-b2a3e3e1ebc5d60b7753e0057efd91fab6402f4c6385b14c38e59de5f816739d}

SRC_ARCHIVE=${SRC_ARCHIVE:-https://bitbucket.org/gavinband/bgen/get/v${VERSION}.tar.bz2}


mkdir -p /dev/shm/$(whoami)/${NAME}

temp_dir=$(mktemp -d -p /dev/shm/$(whoami)/${NAME})

cd $temp_dir

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

sha256sum -c <<< "$SHA256 $archive"

tar -xvf $archive

cd ${NAME}-${VERSION}


./waf configure --prefix=$INSTALL_PREFIX
./waf 
./build/test/unit/test_bgen
./waf install

rm -rf $temp_dir
