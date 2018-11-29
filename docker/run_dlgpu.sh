nvidia-docker run -itd --name=dlgpu -p 8888:8888 -p 12222:22 -i -v /kaycharm/share:/var/mount dl:gpu /bin/bash
