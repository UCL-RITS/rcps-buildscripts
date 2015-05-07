#!/usr/bin/env bash

# This script re-sets some variables that keep getting unset by the various 
# OpenFOAM config scripts.

# OpenFOAM config
source ${INSTALL_PREFIX}/OpenFOAM-${VERSION}/etc/bashrc

# QT variables
export QTDIR=${INSTALL_PREFIX}/ThirdParty-${THIRDPARTY_VERSION}/platforms/linux64Icc/qt-${QT_VERSION}
export QTINC=${INSTALL_PREFIX}/ThirdParty-${THIRDPARTY_VERSION}/platforms/linux64Icc/qt-${QT_VERSION}/include
export QTLIB=${INSTALL_PREFIX}/ThirdParty-${THIRDPARTY_VERSION}/platforms/linux64Icc/qt-${QT_VERSION}/lib
export QT_DIR=${INSTALL_PREFIX}/ThirdParty-${THIRDPARTY_VERSION}/platforms/linux64Icc/qt-${QT_VERSION}

# Fix PATH
export PATH=${INSTALL_PREFIX}/ThirdParty-${THIRDPARTY_VERSION}/platforms/linux64Icc/qt-${QT_VERSION}/bin:$PATH

# Fix LD_LIBRARY_PATH - otherwise libstdc++ breaks
export LD_LIBRARY_PATH=/shared/ucl/apps/gcc/4.9.2/lib64:${LD_LIBRARY_PATH}
