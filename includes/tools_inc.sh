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



