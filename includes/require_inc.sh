#!/usr/bin/env bash
# ^-- mostly for syntax highlighting. This isn't intended to be run.

ERR_MODULES_BROKEN=3

require() {
  if declare -f module >/dev/null; then
    :
  else 
    echo -e "No module function declared. Attempting to automatically load from: \n" \
            "$MODULESHOME/init/bash" >&2
    if [ -r "$MODULESHOME/init/bash" ]; then
      source "$MODULESHOME/init/bash"

      if declare -f module >/dev/null; then
        echo "Got module definition, continuing as normal." >&2
      else
        echo "Loaded, but still no module function. Cannot continue, so, exiting." >&2
        exit $ERR_MODULES_BROKEN
      fi
    else
      echo "File could not be found or was not readable. Cannot continue, so, exiting." >&2
      exit $ERR_MODULES_BROKEN
    fi
  fi

  while [ -n "$1" ]; do
    module load $1
    shift
  done
}

