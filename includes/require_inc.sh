#!/usr/bin/env bash
# ^-- mostly for syntax highlighting. This isn't intended to be run.

ERR_MODULES_BROKEN=3
ERR_MODULE_NOT_LOADED=4

require-init() {
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
}

require() {
  while [ -n "${1:-}" ]; do
    module load $1
    if ! (module list -t 2>&1 | grep -P "^$1($|/)" >/dev/null 2>/dev/null ); then
      echo "Error: could not load module: $1" >&2
      exit $ERR_MODULE_NOT_LOADED
    fi
    shift
  done
}

require-init

