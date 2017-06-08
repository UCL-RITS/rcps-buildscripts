#!/usr/bin/env bash

# Could have $1 as digest type instead, then could do mass file check and could also copy/paste results instead of having to prepend type to each line

function manifest() {
    local digest
    local file
    local digest_type
    while [[ -n "$1" ]] && [[ -n "$2" ]]; do
        digest="$1"
        file="$2"

        digest_type="${digest%:*}"
        if [[ "$digest_type" == "$digest" ]]; then
            echo "Error: argument '$digest' should be a digest and is not" >&2
            return 1
        fi
        digest="${digest#*:}"

        case "$digest_type" in
            "md5")
                md5sum -c <<<"$digest  $file"
                ;;
            "sha1")
                shasum -c <<<"$digest  $file"
                ;;
            "sha224")
                shasum -a 224 -c <<<"$digest  $file"
                ;;
            "sha256")
                shasum -a 256 -c <<<"$digest  $file"
                ;;
            "sha384")
                shasum -a 384 -c <<<"$digest  $file"
                ;;
            "sha512")
                shasum -a 512 -c <<<"$digest  $file"
                ;;
            *)
                :
                ;;
        esac
        shift 2
    done
    if [[ -n "$1" && -z "$2" ]]; then
        echo "Error: improper number of arguments"
        return 2
    fi
}

add_prefix_to_env () 
{ 
    if [ -z "$1" ] || [ ! -d "$1" ]; then
        echo "Error: invalid path specified" 1>&2;
    else
        CMAKE_PREFIX_PATH="$1:$CMAKE_PREFIX_PATH";
        if [ -d "$1/bin" ]; then
            PATH="$1/bin:$PATH";
        fi;
        if [ -d "$1/man" ]; then
            MANPATH="$1/man:$MANPATH";
        fi;
        if [ -d "$1/share/man" ]; then
            MANPATH="$1/share/man:$MANPATH";
        fi;
        if [ -d "$1/lib" ]; then
            LIBRARY_PATH="$1/lib:$LIBRARY_PATH";
            LD_LIBRARY_PATH="$1/lib:$LD_LIBRARY_PATH";
        fi;
        if [ -d "$1/lib64" ]; then
            LIBRARY_PATH="$1/lib64:$LIBRARY_PATH";
            LD_LIBRARY_PATH="$1/lib64:$LD_LIBRARY_PATH";
        fi;
        if [ -d "$1/lib/pkgconfig" ]; then
            PKG_CONFIG_PATH="$1/lib/pkgconfig:$PKG_CONFIG_PATH";
        fi;
        if [ -d "$1/include" ]; then
            CPATH="$1/include:$CPATH";
            INCLUDE_PATH="$1/include:$INCLUDE_PATH";
        fi;
    fi
}

