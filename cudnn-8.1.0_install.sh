#!/usr/bin/env bash

###############################################
# Installing Nvidia cuDNN library
#
# by Owain Kenway, 2017
# Updated for version 8.1.0 March 2023 for CUDA 11.2

# Library insatller needs to be downloaded from https://developer.nvidia.com/rdp/cudnn-download
# using a Nvidia Developer login.

NAME=${NAME:-cudnn}
VERSION=${VERSION:-8.1.0.77}
CUDA_VERSION=${CUDA_VERSION:-11.2}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION/$CUDA_VERSION}

SRC_ARCHIVE=${SRC_ARCHIVE:-/shared/ucl/apps/cudnn/installers/cudnn-${CUDA_VERSION}-linux-x64-v${VERSION}.tgz}

set -e

mkdir -p $INSTALL_PREFIX
cd $INSTALL_PREFIX

tar -xvf $SRC_ARCHIVE
