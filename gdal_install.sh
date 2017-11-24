#! /bin/bash
homepath=`echo ~`
anaconda_root=$homepath/anaconda2
anaconda_lib=$anaconda_root/lib
anaconda_include=$anaconda_root/include
install_prefix=$homepath/programs/gdal
echo $anaconda_root
echo $anaconda_lib
echo $anaconda_include

if [ ! -d "$install_prefix" ]; then
    mkdir -p "$install_prefix"
fi

export LD_LIBRARY_PATH=$anaconda_lib:$LD_LIBRARY_PATH
./configure --prefix=$install_prefix --with-libz=$anaconda_lib --with-liblzma=no --with-pcraster=internal --with-png=$anaconda_lib --with-libtiff=$anaconda_lib --with-geotiff=internal --with-jpeg=$anaconda_lib --with-gif=internal --with-python=$anaconda_root/bin/python
make -j8
make install

cd swig/python
python setup.py install

source ~/.bashrc
