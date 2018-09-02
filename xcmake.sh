#!/bin/sh

CONDA_ENV_PATH=$HOME/miniconda3/envs
CONDA_ENV_NAME=opencv_build
WHERE_ENV=$CONDA_ENV_PATH/$CONDA_ENV_NAME

echo "Starting CMake with conda environment: $WHERE_ENV"

cmake \
    -D ENABLE_CXX11=ON \
	-D CMAKE_BUILD_TYPE=RELEASE \
	-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D PYTHON3_EXECUTABLE=$WHERE_ENV/bin/python \
	-D PYTHON3_PACKAGES_PATH=$WHERE_ENV/lib/python3.6/site-packages \
	-D PYTHON3_LIBRARIES=$WHERE_ENV/lib/libpython3.6m.so \
	-D PYTHON3_INCLUDE_DIRS=$WHERE_ENV/include/python3.6m \
	-D BUILD_opencv_python2=OFF \
	-D BUILD_opencv_python3=ON \
	-D INSTALL_C_EXAMPLES=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D BUILD_EXAMPLES=ON \
	../opencv 