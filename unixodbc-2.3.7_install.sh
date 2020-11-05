#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2018
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2

NAME=${NAME:-unixodbc}
VERSION=${VERSION:-2.3.7}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION}
MD5=${MD5:-274a711b0c77394e052db6493840c6f9}

SRC_ARCHIVE=${SRC_ARCHIVE:-http://www.unixodbc.org/unixODBC-${VERSION}.tar.gz}


mkdir -p /dev/shm/$(whoami)/${NAME}

temp_dir=$(mktemp -d -p /dev/shm/$(whoami)/${NAME})

cd $temp_dir

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

md5sum -c <<< "$MD5 $archive"

tar -xvf $archive

cd unixODBC-${VERSION}

./configure --prefix=$INSTALL_PREFIX
make 
make install

rm -rf $temp_dir
