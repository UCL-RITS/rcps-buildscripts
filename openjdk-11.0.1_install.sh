#!/usr/bin/env bash

###############################################
# Installing Oracle's build of OpenJDK.
#
# by Owain Kenway, 2018
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2

NAME=${NAME:-openjdk}
VERSION=${VERSION:-11.0.1}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION}
SHA256=${SHA256:-7a6bb980b9c91c478421f865087ad2d69086a0583aeeb9e69204785e8e97dcfd}

SRC_ARCHIVE=${SRC_ARCHIVE:-https://download.java.net/java/GA/jdk11/13/GPL/openjdk-${VERSION}_linux-x64_bin.tar.gz}

rm -rf ${INSTALL_PREFIX}
mkdir -p ${INSTALL_PREFIX}

cd ${INSTALL_PREFIX}

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

sha256sum -c <<< "$SHA256 $archive"

tar -xvf $archive

# Make compatible with build for older java
cd jdk-${VERSION}
mkdir -p jre/lib
cd jre/lib
ln -s ../../lib amd64
