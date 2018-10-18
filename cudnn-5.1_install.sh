#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2017
#

NAME=${NAME:-cudnn}
VERSION=${VERSION:-5.1}
CUDA_VERSION=${CUDA_VERSION:-8.0}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$CUDA_VERSION/$COMPILER_TAG}

SRC_ARCHIVE=${SRC_ARCHIVE:-/shared/ucl/apps/cudnn/installers/cudnn-${CUDA_VERSION}-linux-x64-v${VERSION}.tgz}

set -e

mkdir -p $INSTALL_PREFIX
cd $INSTALL_PREFIX

tar -xvf $SRC_ARCHIVE
