#!/usr/bin/env bash

###############################################
# Installing the ECMWF ai-models/graphcast package
#
# by Owain Kenway, 2024
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2
require openssl/1.1.1u
require python/3.11.4

NAME=${NAME:-ai-models-graphcast}
VERSION=${VERSION:-0.1.0}
INSTALL_PREFIX=${INSTALL_PREFIX:-/shared/ucl/apps/$NAME/$VERSION}

rm -rf ${INSTALL_PREFIX}/venv
mkdir -p ${INSTALL_PREFIX}

virtualenv ${INSTALL_PREFIX}/venv
source ${INSTALL_PREFIX}/venv/bin/activate

# Get pip and setuptools up to date
pip install --upgrade pip setuptools wheel

# Install the right "old" version of Jax from the google mirror along with pre 2.0 Numpy
pip install jax[cuda11_pip]==0.4.23 -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html "numpy<2"

# Downgrade to the right "old" version of cudnn
pip install nvidia-cudnn-cu11==8.6.0.163

# Install Deepmind's Graphcast, forcing an old version of chex which is compatible with it.
pip install git+https://github.com/deepmind/graphcast.git chex==0.1.83

# Install ai-models packages
pip install ai-models ai-models-graphcast==${VERSION}

# Install climetlab so that they can fetch the data
pip install climetlab

# Fix earthkit so downloads from CDS work
pip install "earthkit-data>=0.11.1"
