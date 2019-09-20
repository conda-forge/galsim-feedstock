if [ -n "${GXX}" ]; then
    # SConstruct wants to find 'g++' in name, and conda will have gnu-c++ in name
    CXX=${GXX}
fi
# Tell it the prefix and compiler
SCONSFLAGS+="PREFIX=$PREFIX CXX=$CXX "
# Don't pick up conda _build_env python
SCONSFLAGS+="PYTHON=$PREFIX/bin/python "
# Manually tell it where fftw/pybind11/eigen headers are and export
export SCONSFLAGS+="FFTW_DIR=$PREFIX PYBIND11_DIR=$PREFIX EIGEN_DIR=$PREFIX/include/eigen3 "

scons
scons install
