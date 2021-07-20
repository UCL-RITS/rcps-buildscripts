#!/usr/bin/env bash

# This wrapper makes sure the julia binary distributions picks up the GCC
# libraries provided with it correctly meaning that it does not rely on 
# the gcc-libs version.

# Dr Owain Kenway, 20th of July, 2021

location=$(readlink -f $0)
directory=$(readlink -f $(dirname ${location})/..)

export LD_LIBRARY_PATH=${directory}/lib/julia:${LD_LIBRARY_PATH}
exec ${directory}/bin/julia
