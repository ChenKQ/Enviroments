#! /bin/bash
homepath=`echo ~`
anaconda_root=$homepath/anaconda3
anaconda_lib=$anaconda_root/lib
anaconda_include=$anaconda_root/include
version=3.6
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
cmake ../ -DCMAKE_BUILD_TYPE=RELEASE -DWITH_CUDA=OFF -DBUILD_PYTHON_SUPPORT=ON -DPYTHON3_EXECUTABLE=$anaconda_root/bin/python$version -DPYTHON_INCLUDE_DIR=$anaconda_include/python$version -DPYTHON_LIBRARY=$anaconda_lib/python$version.so -DPYTHON3_NUMPY_INCLUDE_DIRS=$anaconda_lib/python$version/site-packages/numpy/core/include -DPYTHON_PACKAGES_PATH=$anaconda_lib/python$version/site-packages -DCMAKE_INSTALL_PREFIX=$install_prefix/ -DPNG_LIBRARY_RELEASE=$anaconda_lib/libpng.so -DJPEG_LIBRARY_RELEASE=$anaconda_lib/libjpeg.so -DTIFF_LIBRARY_RELEASE=$anaconda_lib/libtiff.so

make -j8
make install

cp $install_prefix/lib/python$version/site-packages/* $anaconda_lib/python$version/site-packages/

echo "#opencv" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$install_prefix:$LD_LIBRARY_PATH" >> ~/.bashrc
echo "export C_INCLUDE_PATH=$install_prefix:$C_INCLUDE_PATH" >> ~/.bashrc
echo "export CPLUS_INCLUDE_PATH=$install_prefix:$CPLUS_INCLUDE_PATH" >> ~/.bashrc

source ~/.bashrc
