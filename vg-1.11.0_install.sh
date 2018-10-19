#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2017
#

NAME=${NAME:-vg}
VERSION=${VERSION:-1.11.0}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$COMPILER_TAG}

SRC_ARCHIVE=${SRC_ARCHIVE:-https://github.com/vgteam/vg.git}

set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2
require compilers/gnu/4.9.2
require bison
require flex
require jansson
require lz4

mkdir -p $INSTALL_PREFIX

cd $INSTALL_PREFIX

git clone --recursive $SRC_ARCHIVE

cd vg
git checkout v${VERSION}

cd deps/vcflib
git checkout d50b14c085d3c1c645bff2baf37dbb1e2bfd280c

cd $INSTALL_PREFIX/vg

source source_me.sh
make
