#!/bin/bash

package_name="vmd"
package_version="1.9.3"
package_variant="GL+CUDA"
package_description="VMD is a molecular visualization program for displaying, animating, and analyzing large biomolecular systems using 3-D graphics and built-in scripting."

set -o nounset \
    -o errexit

source includes/source_includes.sh

module purge

make_build_env ""

cd "$build_dir"

wget https://www.ks.uiuc.edu/Research/vmd/vmd-1.9.3/files/final/vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz

manifest \
    sha256:9427a7acb1c7809525f70f635bceeb7eff8e7574e7e3565d6f71f3d6ce405a71  vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz

tar -xf vmd-1.9.3.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz

export VMDINSTALLBINDIR="$install_prefix/bin"
export VMDINSTALLLIBRARYDIR="$install_prefix/lib"

cd "${package_name}-${package_version}"
./configure
cd src
make install

# VMD takes care of library paths itself, via a wrapper script.
# We only need to set the PATH in the module.
make_module_v2 -d -e PATH:"$install_prefix/bin"

chmod -R +rX "$module_dir"

post_build_report

