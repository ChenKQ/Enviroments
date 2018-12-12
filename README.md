# Set up enviroments for deep learning of Geoscience

It gives some simple guides to install basic enviroments for image understanding.

# Steps

## 1.anaconda

###  1.1 install anaconda
- bash Anaconda\*\*\*\*.sh
- add path into .bashrc
  - export PATH=~/anaconda2/bin/python: $PATH
  
### 1.2 set jupyter:  

#### 1.2.1 generate keys
```angular2html
$ ipython
>> from notebook.auth import passwd
>> passwd() 
$ sha1:xxxxxxxxxx:xxxxxxxxxxxxxxxxxxxxx
```

#### 1.2.2 set
 - jupyter notebook --generate-config 
 - vim ~/.jupyter/jupyter_notebook_config.py
 - set c.NotebookApp.ip = '*'
 - set c.NotebookApp.allow_root = True
 - set c.NotebookApp.password = u'sha1:xxxxxxxxxx:xxxxxxxxxxxxxxxxxxxxx' 
 - set c.NotebookApp.open_browser = False
 - set c.NotebookApp.port =8888
 
#### 1.2.3. map port (may be unnecessary)
 - in the local machine: ssh -N -f -L localhost:8888(local port):localhost:8889(server port) username@serverip

## 2. openblas
 - make -j\$(nproc)
 - make install --prefix=....
 
## 3. opencv
 - copy opencv_install.sh to the root directory of the source code of opencv
 - bash opencv_install.sh
 - export LD_LIBRARY_PATH=...:$LD_LIBRARY_PATH
 
## 4. gdal
 - copy gdal_install.sh to the root directory of the source code of gdal
 - bash gdal_install.sh
 - export LD_LIBRARY_PATH=.....\$LD_LIBRARY_PATH

## 5. Compile mxnet
 - copy config.mk to the root directory of source code of mxnet
 - make -j\$(nproc)
 - cd python
 - python setup.py install