#!/bin/bash

set -x

python -m pip install . -vv
python setup.py build_shared_clib

cp include/GalSim.h "$PREFIX/include"
cp -r include/galsim "$PREFIX/include"
cp build/shared_clib/libgalsim* "$PREFIX/lib"

# Create symlinks to the versioned library
if [[ "$target_platform" =~ osx-* ]]; then
  ln -s $PREFIX/lib/libgalsim.*.dylib $PREFIX/lib/libgalsim.dylib
else
  ln -s $PREFIX/lib/libgalsim.*.so $PREFIX/lib/libgalsim.so
fi
