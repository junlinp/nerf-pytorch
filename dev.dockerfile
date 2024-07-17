FROM ubuntu:22.04 AS builder

# Install tools for building.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    git \
    wget \
    unzip \
    libgl-dev \
    libglib2.0-0 \

RUN git clone https://github.com/junlinp/nerf-pytorch.git
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip3 install matplotlib numpy imageio imageio-ffmpeg configargparse tqdm opencv-python
RUN cd nerf-pytorch && bash download_example_data.sh


