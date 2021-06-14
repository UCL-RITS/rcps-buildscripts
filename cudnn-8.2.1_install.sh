#!/usr/bin/env bash

###############################################
# Installing Nvidia cuDNN library
#
# by Owain Kenway, 2017
# Updated for version 8.2.1 June 2021 for CUDA 11.3

# Library insatller nneds to be downloaded from https://developer.nvidia.com/rdp/cudnn-download
# using a Nvidia Developer login.

NAME=${NAME:-cudnn}
VERSION=${VERSION:-8.2.1.32}
CUDA_VERSION=${CUDA_VERSION:-11.3}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$CUDA_VERSION/$COMPILER_TAG}

SRC_ARCHIVE=${SRC_ARCHIVE:-/shared/ucl/apps/cudnn/installers/cudnn-${CUDA_VERSION}-linux-x64-v${VERSION}.tgz}

set -e

mkdir -p $INSTALL_PREFIX
cd $INSTALL_PREFIX

tar -xvf $SRC_ARCHIVE
