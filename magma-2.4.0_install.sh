#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2017
#

NAME=${NAME:-magma}
VERSION=${VERSION:-2.4.0}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$COMPILER_TAG}
SHA256=${SHA256:-4eb839b1295405fd29c8a6f5b4ed578476010bf976af46573f80d1169f1f9a4f}

SRC_ARCHIVE=${SRC_ARCHIVE:-http://icl.utk.edu/projectsfiles/magma/downloads/magma-${VERSION}.tar.gz}

set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2
require compilers/intel/2018/update3
require cuda/9.0.176-patch4/gnu-4.9.2
require cmake/3.7.2

mkdir -p /dev/shm/${NAME}

temp_dir=`mktemp -d -p /dev/shm/${NAME}`

cd $temp_dir

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

sha256sum -c <<< "$SHA256 $archive"

tar -xvf $archive

cd ${NAME}-${VERSION}
mkdir build
cd build
cmake -DCUDA_HOST_COMPILER=$( which gcc ) -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX ..
make 
make install
