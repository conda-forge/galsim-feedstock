#!/bin/bash

set -x

python -m pip install . -vv
python setup.py build_shared_clib

cp include/GalSim.h "$PREFIX/include"
cp -r include/galsim "$PREFIX/include"
cp build/shared_clib/libgalsim* "$PREFIX/lib"
