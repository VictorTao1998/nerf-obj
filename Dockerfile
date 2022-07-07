FROM nvidia/cuda:11.3.0-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TORCH_CUDA_ARCH_LIST="6.1+PTX"
ENV TZ=US/Pacific


# Install Python3.7
RUN apt update && \ 
    apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libbz2-dev liblzma-dev wget
WORKDIR "/tmp"
RUN wget https://www.python.org/ftp/python/3.7.11/Python-3.7.11.tgz && \ 
    tar -xf Python-3.7.11.tgz
WORKDIR "/tmp/Python-3.7.11"
RUN ./configure --enable-optimizations && \
    make install && \
    ln -s /usr/local/bin/python3.7 /usr/bin/python && \ 
    ln -s /usr/local/bin/pip3 /usr/bin/pip
    
    
# Install other packages
WORKDIR "/"
RUN apt update && \
    apt install -y nano git python3-opencv imagemagick
RUN pip install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html && \ 
    pip install --user git+https://github.com/aliutkus/torchsearchsorted && \
    pip install --user imageio opencv-python-headless && \
    pip install --user pyyaml tqdm tensorboard && \
    pip install --user numpy pillow tensorboardX opencv-python plyfile yacs matplotlib && \
    pip install --user cupy-cuda113 pynvrtc
