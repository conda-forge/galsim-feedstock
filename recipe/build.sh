if [ -z "${GXX}" ]; then
    # SConsstruct wants to find 'g++' in name
    export CXX=${GXX}
fi
export SCONSFLAGS="PYBIND11_DIR=$PREFIX EIGEN_DIR=$PREFIX/include/eigen3"
scons CXX=${CXX}
scons install
