FROM ubuntu:22.04

LABEL maintainer="https://github.com/Kuznetsov-Artyom"

RUN apt-get update \
    && apt-get install -q -y --no-install-recommends \
    git \
    python3 \
    python3-pip \
    gcc \
    wget \
    sudo \
    vim

COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt

RUN useradd -m user \
    && usermod -aG sudo user \
    && echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER user

WORKDIR /home/user

ENTRYPOINT [ "/bin/bash" ]
