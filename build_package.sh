#!/usr/bin/env bash
git apply debian-package.patch
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DG2O_USE_OPENMP=1 -j4 ../
sudo checkinstall --pkglicense="BSD,LGPL,GPL" --maintainer="michael@marble.io" --requires="libeigen3-dev,libsuitesparse-dev,libqglviewer-dev" --pkgname=libg2o-dev --conflicts="ros-kinetic-libg2o"
