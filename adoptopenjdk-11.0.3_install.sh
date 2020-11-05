#!/usr/bin/env bash

###############################################
# Installing AdoptOpenJDK's build of OpenJDK.
#
# by Owain Kenway, 2019
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2

NAME=${NAME:-openjdk}
VM=${VM:-hotspot}
VERSION=${VERSION:-11.0.3}
UPDATE=${UPDATE:-7}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/${VERSION}u${UPDATE}/$VM}
OPENJ9_VERSION=${OPENJ9_VERSION:-0.14.0}

if [ "${VM}" == "openj9" ]
then
  SHA256=${SHA256:-7012edd56fc958070bc4747073de14ea08eb43081eb6ea19bdbf4763186e2d17}
  SRC_ARCHIVE=${SRC_ARCHIVE:-https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-${VERSION}%2B${UPDATE}_openj9-${OPENJ9_VERSION}/OpenJDK11U-jdk_x64_linux_openj9_${VERSION}_${UPDATE}_openj9-${OPENJ9_VERSION}.tar.gz}
elif [ "${VM}" == "hotspot" ]
then
  SHA256=${SHA256:-23cded2b43261016f0f246c85c8948d4a9b7f2d44988f75dad69723a7a526094}
  SRC_ARCHIVE=${SRC_ARCHIVE:-https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-${VERSION}%2B${UPDATE}/OpenJDK11U-jdk_x64_linux_${VM}_${VERSION}_${UPDATE}.tar.gz}
else
  echo "Error - weird VM specified - ${VM}"
  exit 1
fi

rm -rf ${INSTALL_PREFIX}
mkdir -p ${INSTALL_PREFIX}

cd ${INSTALL_PREFIX}

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

sha256sum -c <<< "$SHA256 $archive"

tar -xvf $archive

# Make compatible with build for older java
cd jdk-${VERSION}+${UPDATE}
mkdir -p jre/lib
cd jre/lib
ln -s ../../lib amd64
