#!/usr/bin/env bash

# This wrapper works around a bus error in LLVM lld on the Lustre fs on 
# Kathleen that we are still investigating the root cause of.
# This does have a performance impact so only add it into a Julia install
# on systems where this is a verified problem, presently Kathleen

# See IN06020811 for details.

# Dr Owain Kenway, 16th June 2023

location=$(readlink -f $0)
directory=$(readlink -f $(dirname ${location})/..)

exec ${directory}/bin/julia --pkgimages=no "$@"
