# RUN install_packages build-essential autoconf \
#                     libtool wget python pkg-config \
#                     git gstreamer1.0-x gstreamer1.0-tools \
#                     gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
#                     gstreamer1.0-alsa libgstreamer1.0-dev \
#                     libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev

# RUN wget http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/firmware-imx-3.14.28-1.0.0.bin

# RUN /bin/sh firmware-imx-*.bin --force --auto-accept \
#  mkdir -p /lib/firmware/vpu \
#  cp firmware-imx-*/firmware/vpu/vpu_fw_imx6*.bin /lib/firmware/vpu

# RUN wget http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/imx-vpu-5.4.31.bin 

# RUN /bin/sh imx-vpu-*.bin --force --auto-accept \
#  cd imx-vpu-* \
#  make PLATFORM=IMX6Q all \
#  make install # installs vpu_lib.h and vpu_io.h in /usr/include and libvpu.* in /usr/lib \
#  cd ..

# RUN git clone git://github.com/Freescale/libimxvpuapi.git 
 
# RUN cd libimxvpuapi \
#  ./waf configure --prefix=/usr \
#  ./waf \
#  ./waf install \
#  cd ..

# RUN git clone git://github.com/Freescale/gstreamer-imx.git \
#  cd gstreamer-imx \
#  ln -s /usr/lib/arm-linux-gnueabihf/gstreamer-1.0/ /usr/lib/gstreamer-1.0 \
#  ./waf configure --prefix=/usr --kernel-headers=/include \
#  ./waf \
#  ./waf install \
#  cd ..