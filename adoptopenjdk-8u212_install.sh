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
VERSION=${VERSION:-8u212}
UPDATE=${UPDATE:-b03}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/${VERSION}u${UPDATE}/$VM}
OPENJ9_VERSION=${OPENJ9_VERSION:-0.14.0}

if [ "${VM}" == "openj9" ]
then
  SHA256=${SHA256:-4aa8fdb3916816788c516423236bef68a05a694cbd44fa14c4f8f5b76891aa4c}
  SRC_ARCHIVE=${SRC_ARCHIVE:-https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk${VERSION}-${UPDATE}_openj9-${OPENJ9_VERSION}/OpenJDK8U-jdk_x64_linux_openj9_${VERSION}${UPDATE}_openj9-${OPENJ9_VERSION}.tar.gz}
elif [ "${VM}" == "hotspot" ]
then
  SHA256=${SHA256:-dd28d6d2cde2b931caf94ac2422a2ad082ea62f0beee3bf7057317c53093de93}
  SRC_ARCHIVE=${SRC_ARCHIVE:-https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk${VERSION}-${UPDATE}/OpenJDK8U-jdk_x64_linux_${VM}_${VERSION}${UPDATE}.tar.gz}
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
