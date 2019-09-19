SCONSFLAGS+=" USE_UNKNOWN_VARS=true"
if [ -z "${GXX}" ]; then
    # SConstruct wants to find 'g++' in name
    CXX=${GXX}
fi
export SCONSFLAGS="PREFIX=$PREFIX PYPREFIX=$PREFIX/lib/python PYBIND11_DIR=$PREFIX EIGEN_DIR=$PREFIX/include/eigen3 CXX=$CXX"
scons
scons install
