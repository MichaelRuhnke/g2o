#!/usr/bin/env bash
git apply debian-package.patch

if [ ! -d "build" ]; then
  mkdir build
  cp description-pak build/
fi
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DG2O_USE_OPENMP=1 ../
make -j4
sudo apt-get update && sudo apt-get install checkinstall
sudo checkinstall --pkgversion="1.0.0" --pkglicense="BSD,LGPL,GPL" --maintainer="michael@marble.io" --requires="libeigen3-dev,libsuitesparse-dev,libqglviewer-dev" --pkgname=libg2o-dev --conflicts="ros-kinetic-libg2o"
