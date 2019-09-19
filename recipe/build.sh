export SCONSFLAGS="PYBIND11_DIR=$PREFIX EIGEN_DIR=$PREFIX/include/eigen3"
scons
scons install

