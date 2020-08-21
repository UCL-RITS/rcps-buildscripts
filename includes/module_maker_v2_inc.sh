#!/usr/bin/env bash

# This version of make_module attempts to have more sensible defaults so you don't end up
#   having to specify everything every single time.
# Also I'm going to put the prefix directory testing *outside* the module so you end up with a
#   static module instead of the hand-wavey testing ones the old version makes.
# I'm going to name it v2 though so no old build scripts need to change.
# Another goal is to make it so that you don't have to choose between having some things
#  set automatically and being able to set some things manually.

function make_module_v2() {
    # Pick up as much stuff as we can from variables defined in build scripts.
    
    local module_whatis="${package_description:-This is a module with no description string.}"
    local module_prefix="${install_prefix:-/no/prefix/given}"
    local module_conflicts="${package_name:+conflict $package_name$'\n'}"

    local output_file
    if [[ "${module_dir:-}/${package_label:-}" == "/" ]]; then
        output_file="/dev/stdout"
    else
        output_file="$module_dir/$package_label"
    fi

    # Now try to work out our prereqs based on which modules are loaded.
    local module_prereqs=""
    if [[ -n "${LOADEDMODULES:-}" ]]; then
        module_prereqs="prereq ${LOADEDMODULES//:/$'\n'prereq }"$'\n'
        # Generally we want gcc-libs to be version-non-specific
        module_prereqs="${module_prereqs//gcc-libs\/[0-9].[0-9].[0-9]/gcc-libs}"
    fi


    local variables_to_import=""
    local variables_to_append=""
    local variables_to_prepend=""
    local send_help_and_quit="n"
    local omit_prefix_block=""
    local needs_module_functions=""
    local needs_group=""


    #Get command line arguments
    local flag
    while getopts  "hp:o:n:v:a:e:w:Cc:Rr:dg:t:" flag
    do
        case "$flag" in
          "p")
            module_prefix="$OPTARG"
            ;;
          "o")
            output_file="$OPTARG"
            ;;
          "d")
            omit_prefix_block="y"
            ;;
          "v")
            printf -v variables_to_import "%ssetenv %s\n" "$variables_to_import" "${OPTARG/=/ }"
            ;;
          "a")
            printf -v variables_to_append "%sappend-path %s\n" "$variables_to_append" "${OPTARG/:/ }"
            ;;
          "e")
            printf -v variables_to_prepend "%sprepend-path %s\n" "$variables_to_prepend" "${OPTARG/:/ }"
            ;;
          "w")
            module_whatis="$OPTARG"
            ;;
          "C")
            module_conflicts=""
            ;;
          "c")
            printf -v module_conflicts "%sconflict %s\n" "$module_conflicts" "$OPTARG"
            ;;
          "R")
            module_prereqs=""
            ;;
          "r")
            printf -v module_prereqs "%sprereq %s\n" "$module_prereqs" "$OPTARG"
            ;;
          "h")
            send_help_and_quit="y"
            ;;
          "g")
            needs_module_functions="y"
            needs_group="$OPTARG"
            ;;
          *)
            echo "Module maker: Invalid argument specified: $flag" >&2
            return 5
            ;;
        esac
    done

    module_maker_help_file="module_maker_inc.sh: makes modules

    In shell, so as to not add extra dependencies.

    Options:
      -p   prefix dir: allows quick configuration of all \$prefix/bin, \$prefix/lib paths (Default: \$install_prefix)
      -o   where to write modulefile -- directories will be created if necessary
      -d   omit normal prefix block
      -v   variables to set, as \"variable=value\". Use multiple times if nec.
      -a   variables to append, as \"variable:value\". Ditto.
      -e   variables to prepend, as \"variable:value\". Ditto.
      -w   module whatis information. A brief description.
      -c   modules this module conflicts with. Space separate, quote. (Default: \$package_name)
      -r   modules this module depends on. Space separate, quote. (Default: currently loaded modules)
      -R   reset module dependencies. (esp. if the default is not what you want)
      -C   reset module conflicts.    (esp. if the default is not what you want)
      -g   a group that the user must be in to load the module.
      -h   print this.
    "

    #Send the help message and exit if -h was specified.
    if [[ "$send_help_and_quit" == "y" ]]; then
        echo -e "$module_maker_help_file"
        return
    fi


    local prefix_block=""

    if [[ -z "${omit_prefix_block:-}" ]] && [[ -n "${module_prefix:-}" ]] && [[ -d "$module_prefix" ]]; then
        printf -v prefix_block "prepend-path CMAKE_PREFIX_PATH %s\n" '$prefix'
        if [[ -d "$module_prefix/bin" ]]; then
            printf -v prefix_block "%sprepend-path PATH %s\n" "$prefix_block" '$prefix/bin'
        fi
        if [[ -d "$module_prefix/include" ]]; then
            printf -v prefix_block "%sprepend-path CPATH %s\nprepend-path INCLUDE_PATH %s\n" "$prefix_block" '$prefix/include' '$prefix/include'
        fi
        if [[ -d "$module_prefix/lib" ]]; then
            printf -v prefix_block "%sprepend-path LIBRARY_PATH %s\nprepend-path LD_RUN_PATH %s\nprepend-path LD_LIBRARY_PATH %s\n" "$prefix_block" '$prefix/lib' '$prefix/lib' '$prefix/lib'
        fi
        if [[ -d "$module_prefix/lib64" ]]; then
            printf -v prefix_block "%sprepend-path LIBRARY_PATH %s\nprepend-path LD_RUN_PATH %s\nprepend-path LD_LIBRARY_PATH %s\n" "$prefix_block" '$prefix/lib64' '$prefix/lib64' '$prefix/lib64'
        fi
        if [[ -d "$module_prefix/lib/pkgconfig" ]]; then
            printf -v prefix_block "%sprepend-path PKG_CONFIG_PATH %s\n" "$prefix_block" '$prefix/lib/pkgconfig'
        fi
        if [[ -d "$module_prefix/lib64/pkgconfig" ]]; then
            printf -v prefix_block "%sprepend-path PKG_CONFIG_PATH %s\n" "$prefix_block" '$prefix/lib64/pkgconfig'
        fi
        if [[ -d "$module_prefix/man" ]]; then
            printf -v prefix_block "%sprepend-path MAN_PATH %s\n" "$prefix_block" '$prefix/man'
        fi
        if [[ -d "$module_prefix/share/man" ]]; then
            printf -v prefix_block "%sprepend-path MAN_PATH %s\n" "$prefix_block" '$prefix/share/man'
        fi
        if [[ -d "$module_prefix/share/info" ]]; then
            printf -v prefix_block "%sprepend-path INFO_PATH %s\n" "$prefix_block" '$prefix/share/info'
        fi
    fi

    #Create dir for module if necessary
    mkdir -p "$(dirname "$output_file")"

    printf "Creating module file as: $output_file" >&2

    exec 5>"$output_file"
    >&5 printf "#%%Module -*- tcl -*-\n## module_made (v2)\nproc ModulesHelp { } {\n  puts stderr {%s}\n}\nmodule-whatis {%s}\n\n" "$module_whatis" "$module_whatis"
    [[ -n "$needs_module_functions" ]] && \
        >&5 printf "\nlappend auto_path /shared/ucl/apps/modulelibs/UsefulModuleFunctions\npackage require modulefunctions 1.0\n"
    [[ -n "$needs_group" ]] && \
        >&5 printf "\nmodulefunctions::mustBeMemberToLoad %s\n" "$needs_group"
    >&5 printf "%s%s\n" "$module_conflicts" "$module_prereqs"
    >&5 printf "set prefix %s\n" "$module_prefix"
    [[ -n "$variables_to_import$variables_to_prepend$variables_to_append" ]] && \
        >&5 printf "\n%s%s%s\n" "$variables_to_import" "$variables_to_prepend" "$variables_to_append"
    >&5 printf "%s\n" "$prefix_block"
    exec 5>&-

}

if [ "$(basename -- "$0")" == "module_maker_v2_inc.sh" ]; then
  make_module_v2 "$@"
fi
