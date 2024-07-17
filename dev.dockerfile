FROM ubuntu:22.04 AS builder

# Install tools for building.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    git

RUN git clone https://github.com/junlinp/nerf-pytorch.git
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip3 install matplotlib numpy imageio imageio-ffmpeg configargparse
RUN cd nerf-pytorch && bash download_example_data.sh


