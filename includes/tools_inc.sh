#!/usr/bin/env bash

# Could have $1 as digest type instead, then could do mass file check and could also copy/paste results instead of having to prepend type to each line

function manifest() {
    local digest
    local file
    local digest_type
    while [[ -n "${1:-}" ]] && [[ -n "${2:-}" ]]; do
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
    if [[ -n "${1:-}" && -z "${2:-}" ]]; then
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
        export CMAKE_PREFIX_PATH
        if [ -d "$1/bin" ]; then
            PATH="$1/bin:$PATH";
            export PATH
        fi;
        if [ -d "$1/man" ]; then
            MANPATH="$1/man:$MANPATH";
            export MANPATH
        fi;
        if [ -d "$1/share/man" ]; then
            MANPATH="$1/share/man:$MANPATH";
            export MANPATH
        fi;
        if [ -d "$1/lib" ]; then
            LIBRARY_PATH="$1/lib:$LIBRARY_PATH";
            LD_LIBRARY_PATH="$1/lib:$LD_LIBRARY_PATH";
            export LIBRARY_PATH
            export LD_LIBRARY_PATH
        fi;
        if [ -d "$1/lib64" ]; then
            LIBRARY_PATH="$1/lib64:$LIBRARY_PATH";
            LD_LIBRARY_PATH="$1/lib64:$LD_LIBRARY_PATH";
            export LIBRARY_PATH
            export LD_LIBRARY_PATH
        fi;
        if [ -d "$1/lib/pkgconfig" ]; then
            PKG_CONFIG_PATH="$1/lib/pkgconfig:$PKG_CONFIG_PATH";
            export PKG_CONFIG_PATH
        fi;
        if [ -d "$1/include" ]; then
            CPATH="$1/include:$CPATH";
            INCLUDE_PATH="$1/include:$INCLUDE_PATH";
            export CPATH
            export INCLUDE_PATH
        fi;
    fi
}

make_build_env () {
    local prefix
    local tmp_root_dir
    local prod_apps_dir

    prod_apps_dir="${APPS_DIR:-/shared/ucl/apps}"
    service_user_pattern="^ccspap.\$"
    # NB: ccspapp and ccspap2 are both service users

    prefix="${package_name:-tmp.}"
    tmp_root_dir="${TMPDIR:-/tmp}"

    if [[ -n "${1:-}" ]]; then
        if [[ "${1:0:2}" == "--" ]] && [[ ${#1} -gt 2 ]]; then
            while [[ -n "${1:-}" ]]; do
                case "$1" in
                    --tmp-root=*)
                        tmp_root_dir="${1#--tmp-root=}"
                        ;;
                    --prefix=*)
                        prefix="${1#--prefix=}"
                        ;;
                    *)
                        echo "Error: unrecognised option passed to make_build_env" >&2
                        exit 1
                        ;;
                esac
                shift
            done
        else
            prefix="$1"
            if [[ -n "${2:-}" ]]; then
                tmp_root_dir="$2"
            fi
        fi
    fi


    # These definitions are intended to leave the function
    #  but are *not* exported because only *bash* needs them
    owd=$(pwd)                                                                    
    build_dir="${BUILD_DIR:-"$(mktemp -d -p "$tmp_root_dir" -t "$prefix-build.XXXXXXXXXX")"}"
    module_dir="${MODULE_DIR:-"$(mktemp -d -p "$tmp_root_dir" -t "$prefix-modules.XXXXXXXXXX")"}"

    if [[ -n "${package_name:-}" ]] && [[ -n "${package_version:-}" ]]; then
        package_label="${package_name}/${package_version}${package_variant:+-${package_variant:-}}${COMPILER_TAG:+/$COMPILER_TAG}"
    else
        echo "Error: package name and package version variables have not been set." >&2
        exit 1
    fi

    if [[ -n "${IS_TEST_RUN:-}" ]]; then
        reason_for_test_install="IS_TEST_RUN was set"
    elif [[ ! "${LOGNAME:-}" =~ $service_user_pattern ]]; then
        reason_for_test_install="current user is not service user"
    fi
    
    default_install_prefix="${INSTALL_PREFIX:-${prod_apps_dir}/${package_label}}"
    if [[ -n "${reason_for_test_install:-}" ]]; then
        echo "Warning: default install prefix is a temporary directory because $reason_for_test_install"
        echo "         otherwise install prefix would have been $default_install_prefix"
        install_prefix="${INSTALL_PREFIX:-"$(mktemp -d -p "$tmp_root_dir" -t "$prefix-test-prefix.XXXXXXXXXX")/$package_label"}"
        mkdir -p "$install_prefix"
    else
        install_prefix="$default_install_prefix"
    fi

    cat <<EOF
    =====================
    =    Build Env      =
    =====================

    Package label:                $package_label
    Current working dir:          $owd
    Build will take place in:     $build_dir
    Modules will be put in:       $module_dir
    Package will be installed to: $install_prefix

    =====================
EOF
}

function post_build_report() {
    local build_size
    local exec_list
    build_size="$(du -hs "$install_prefix" | cut -f 1 -d $'\t')"
    exec_list="$(find "$install_prefix" -type f -perm /u+x | head -n 10)"
    cat <<EOF
    ==========================
    =    Post Build Info     =
    ==========================

    Package label:            $package_label
    Build took place in:      $build_dir
    Modules were put in:      $module_dir
    Package was installed to: $install_prefix
    Package size:             ${build_size}B

    -- First execs (max 10) --
    $exec_list

    ==========================
EOF
}

function github_download() {
    while [[ "$1" != "" ]]; do
        url="$1";
        repo_name="${url##https://github.com/}";
        repo_name="${repo_name#*/}";
        repo_name="${repo_name%%/*}";
        version="${url##*/}";
        version="${version#v}";
        wget -O "${repo_name}-${version}" "$url";
        shift;
    done
}


