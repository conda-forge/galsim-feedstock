export SCONSFLAGS="PYBIND11_DIR=$CONDA_PREFIX EIGEN_DIR=$CONDA_PREFIX/include/eigen3"
scons prefix="$PREFIX"
scons prefix="$PREFIX" install

