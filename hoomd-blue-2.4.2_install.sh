#!/usr/bin/env bash

###############################################
# Installing hoomd
#
# by Owain Kenway, 2018
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2
require compilers/gnu/4.9.2
require mpi/openmpi/3.1.1/gnu-4.9.2
require python3/recommended
require cuda/9.0.176-patch4/gnu-4.9.2
require cmake/3.7.2

NAME=${NAME:-hoomd-blue}
VERSION=${VERSION:-2.4.2}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$COMPILER_TAG}
MD5=${MD5:-30da2427297ea87ec5ff3e4f4f5bc324}
SHA1=${SHA1:-a91db2f3ead3e0a5e22bef10cb6943827be429bb}
SHA256=${SHA256:-2d46725844336c9b3cd39fcba26741042410e9d20384d5218c9272c92cccfb08}
SHA512=${SHA512:-bc24a4a50d079287c2c59a730a35d14f855761e55a2847fee5cf9f1cf35512dbf16854fdf5e40ce841b0767d64109cb431507c181cfb0100f839e3a3d16ca088}

SRC_ARCHIVE=${SRC_ARCHIVE:-http://glotzerlab.engin.umich.edu/Downloads/hoomd/hoomd-v${VERSION}.tar.gz}


mkdir -p /dev/shm/${NAME}

temp_dir=$(mktemp -d -p /dev/shm/${NAME})

cd $temp_dir

wget $SRC_ARCHIVE
archive=$(basename "${SRC_ARCHIVE}")

md5sum -c <<< "$MD5 $archive"
sha1sum -c <<< "$SHA1 $archive"
sha256sum -c <<< "$SHA256 $archive"
sha512sum -c <<< "$SHA512 $archive"

tar -xvf $archive

cd hoomd-v${VERSION}

mkdir hoomd-build
cd hoomd-build
export SOFTWARE_ROOT=$INSTALL_PREFIX
cmake ../ -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}/lib/python -DCMAKE_CXX_FLAGS=-march=native -DCMAKE_C_FLAGS=-march=native -DENABLE_MPI=ON -DENABLE_GPU=ON
make
#make test
make install

rm -rf $temp_dir
