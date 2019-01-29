#!/usr/bin/env bash

###############################################
# Installing 
#
# by Owain Kenway, 2018
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2
require python/3.6.3
require unixodbc

NAME=${NAME:-oasislmf}
VERSION=${VERSION:-1.2.4}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION}

pip3 install --target=${INSTALL_PREFIX} oasislmf==${VERSION}

