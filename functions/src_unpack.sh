#!/usr/bin/env sh
#
# Unpacks downloaded tarballs to source directory S, or, if GIT_URI is set,
# checks out the latest commit from a git repo.  If GIT_BRANCH is set, then only
# that branch is cloned.  If GIT_COMMIT is set, then that commit is checked out
# rather than the latest commit on whatever branch is cloned.  If GIT_BRANCH and
# GIT_COMMIT are both set, then GIT_COMMIT must be on GIT_BRANCH.
#

src_unpack() {
  if [ "${GIT_URI}" ]
    then
    ARGS="--depth=1"
    [ "${GIT_BRANCH}" ] && ARGS="${ARGS} --branch=${GIT_BRANCH}"
    git clone "${GIT_URI}" "${S}"
    if [ "${GIT_COMMIT}" ]
      then
      git -C"${S}" checkout "${GIT_COMMIT}"
    fi
  else
    local extension="${A##*.}"
    local output="${A%.*}"
    case "${extension}" in
      zip)
        unzip -q -o "${WORKDIR}/${A}" -d "${WORKDIR}"
        ;;
      bz2|gz|xz)
        if [ "${output##*.}" == "tar" ]
          then
          case "${extension}" in
            bz2)
              tar -jxf "${WORKDIR}/${A}" -C "${WORKDIR}"
              ;;
            gz)
              tar -zxf "${WORKDIR}/${A}" -C "${WORKDIR}"
              ;;
            xz)
              tar -Jxf "${WORKDIR}/${A}" -C "${WORKDIR}"
              ;;
          esac
        fi
        ;;
      tbz)
        tar -jxf "${WORKDIR}/${A}" -C "${WORKDIR}"
        ;;
      tgz)
        tar -zxf "${WORKDIR}/${A}" -C "${WORKDIR}"
        ;;
      txz)
        tar -Jxf "${WORKDIR}/${A}" -C "${WORKDIR}"
        ;;
    esac
  fi
}
