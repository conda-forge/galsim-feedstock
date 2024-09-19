#!/bin/bash

set -x

export FFTW_DIR="$PREFIX/lib"

${PYTHON} -m pip install . -vv --global-option="-j${CPU_COUNT}"
${PYTHON} setup.py build_shared_clib -j${CPU_COUNT}

cp include/GalSim.h "$PREFIX/include"
cp -r include/galsim "$PREFIX/include"
cp -PR build/shared_clib/libgalsim* "$PREFIX/lib"

if [[ ${target_platform} == osx-* ]]; then
    lname=$(basename ${PREFIX}/lib/libgalsim.*.dylib)
    echo "changing id of ${lname} w/ install_name_tool"

    ${INSTALL_NAME_TOOL} -id "@rpath/${lname}" ${PREFIX}/lib/${lname}
fi
