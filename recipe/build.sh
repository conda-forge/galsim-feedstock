SCONFSFLAGS=""
if [ -n "${GXX}" ]; then
    # SConstruct wants to find 'g++' in name, and conda will have gnu-c++ in name
    SCONSFLAGS+="CXX=${GXX} "
fi

if [[ $OSTYPE == darwin* ]]; then
    # Darwin
    SCONSFLAGS+="CXX=${CLANGXX} DYLD_LIBRARY_PATH=$PREFIX/lib "
fi

# Tell it the prefix
SCONSFLAGS+="PREFIX=$PREFIX "
# Don't pick up conda _build_env python
SCONSFLAGS+="PYTHON=$PREFIX/bin/python "
# Manually tell it where fftw/pybind11/eigen headers are and export
export SCONSFLAGS+="FFTW_DIR=$PREFIX/lib PYBIND11_DIR=$PREFIX EIGEN_DIR=$PREFIX/include/eigen3 "

scons
scons install
