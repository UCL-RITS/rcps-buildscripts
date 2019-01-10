#!/usr/bin/env bash

###############################################
# Script to install a number of modules from the command line.
# Based on Heather's instructions here: https://wiki.ucl.ac.uk/display/ISResComInternal/Perl+under+RHEL7+based+OS
#
# by Owain Kenway, 2019
#
set -e

for i in ${includes_dir:=$(dirname $0 2>/dev/null)/includes}/{module_maker,require}_inc.sh; do . $i; done

require gcc-libs/4.9.2
require compilers/gnu/4.9.2
require perlbrew/0.73
if [ -n "$1" ]; 
then
  VERSION=${VERSION:-5.22.0}

  source $PERLBREWROOT/etc/bashrc
  perlbrew use perl-${VERSION}

  export PERL5LIB=$PERLBREWROOT/share/perl5
  for a in "$@"
  do
    cpanm $a
  done

else
  echo "Run with $0 <module name>"
fi
