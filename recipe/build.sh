#!/bin/bash

set -x

export FFTW_DIR="$PREFIX/lib"

${PYTHON} -m pip install . -vv --install-option="-j${CPU_COUNT}"
${PYTHON} setup.py build_shared_clib -j${CPU_COUNT}

cp include/GalSim.h "$PREFIX/include"
cp -r include/galsim "$PREFIX/include"
cp -PR build/shared_clib/libgalsim* "$PREFIX/lib"
