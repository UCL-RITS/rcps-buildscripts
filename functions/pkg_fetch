#!/usr/bin/env sh
#
# Fetches the package using SRC_URI (if defined)
#

pkg_fetch() {
  if [ "${SRC_URI}" ]
    then
    curl -s -o "${WORKDIR}/${A}" -L "${SRC_URI}"
    if [ "${SHA256_SRC}" ]
      then
      SHA256=$(openssl dgst -sha256 "${WORKDIR}/${A}" | cut -d' ' -f2)
      if [ "${SHA256}" != "${SHA256_SRC}" ]
        then
        die "SHA256 checksums differ! ${SHA256_SRC} != ${SHA256}"
      fi
    fi
  elif [ "${GIT_URI}" ]
    then
    ARGS="--depth=1"
    [ "${GIT_BRANCH}" ] && ARGS="${ARGS} --branch=${GIT_BRANCH}"
    git clone "${GIT_URI}" "${S}"
    if [ "${GIT_COMMIT}" ]
      then
      git -C"${S}" checkout "${GIT_COMMIT}"
    fi
  elif [ "${SVN_URI}" ]
    then
    svn checkout "${SVN_URI}" "${S}"
  fi
}
