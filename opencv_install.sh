#! /bin/bash
homepath=`echo ~`
anaconda_root=$homepath/anaconda2
anaconda_lib=$anaconda_root/lib
anaconda_include=$anaconda_root/include
install_prefix=$homepath/programs/opencv
echo $anaconda_root
echo $anaconda_lib
echo $anaconda_include
rm -rf build
mkdir build
cd build

if [ ! -d "$install_prefix" ]; then
    mkdir -p "$install_prefix"
fi

export LD_LIBRARY_PATH=$anaconda_lib:$LD_LIBRARY_PATH
cmake ../ -DCMAKE_BUILD_TYPE=RELEASE -DWITH_CUDA=OFF -DBUILD_PYTHON_SUPPORT=ON -DPYTHON2_EXECUTABLE=$anaconda_root/bin/python2.7 -DPYTHON_INCLUDE_DIR=$anaconda_include/python2.7 -DPYTHON_LIBRARY=$anaconda_lib/libpython2.7.so -DPYTHON2_NUMPY_INCLUDE_DIRS=/home/chenkq/anaconda2/lib/python2.7/site-packages/numpy/core/include -DPYTHON2_PACKAGES_PATH=/home/chenkq/anaconda2/lib/python2.7/site-packages/numpy/core/include -DCMAKE_INSTALL_PREFIX=$install_prefix/ -DPNG_LIBRARY_RELEASE=$anaconda_lib/libpng.so -DJPEG_LIBRARY_RELEASE=$anaconda_lib/libjpeg.so -DTIFF_LIBRARY_RELEASE=$anaconda_lib/libtiff.so

make -j8
make install

cp $install_prefix/lib/python2.7/site-packages/* $anaconda_lib/python2.7/site-packages/

source ~/.bashrc
