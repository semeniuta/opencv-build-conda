#!/bin/sh

#
# Create symlink to cv2 module
# from opencv_build conda environment 
# in the other conda environment
#
# Example:
# create_symlink.sh myenv
#

CONDA_ENV_PATH=$HOME/miniconda3/envs
SRC_ENV_NAME=opencv_build
SRC_ENV=$CONDA_ENV_PATH/$SRC_ENV_NAME

if [ -z "$1" ]; then
    echo "No target conda environment specified. Exiting."
    exit 1
fi

DST_ENV=$CONDA_ENV_PATH/$1

if [ ! -d $DST_ENV ]; then
    echo "The specified conda environment $1 does not exist. Exiting."
    exit 1
fi

SRC_MODULE=$(ls $SRC_ENV/lib/python3.6/site-packages/cv2*.so)
DST_LINK=$DST_ENV/lib/python3.6/site-packages/cv2.so

echo "Creating symlink: $SRC_MODULE -> $DST_LINK"

ln -s $SRC_MODULE $DST_LINK