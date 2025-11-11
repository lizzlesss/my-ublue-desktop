#!/bin/bash

set -ouex pipefail

# enable rpmfusion
dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# intel media driver and codecs
dnf -y install \
    intel-media-driver \
    ffmpeg \
    mpv

dnf -y group install \
    multimedia \
    fonts

# packages
dnf -y install \
    nvtop \
    btop \
    intel-gpu-tools

# nbfc-linux official rpm
dnf5 install -y https://github.com/nbfc-linux/nbfc-linux/releases/download/0.3.19/fedora-nbfc-linux-0.3.19-1.x86_64.rpm

# equibop rpm
dnf -y install https://github.com/Equicord/Equibop/releases/download/v3.1.0/equibop-3.1.0.x86_64.rpm

# copr repos
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y copr enable v8v88v8v88/helium

# copr packages
dnf5 -y install scx-scheds-git
dnf5 -y install scx-manager
dnf5 -y install helium

# disable copr repos
dnf5 -y copr disable bieszczaders/kernel-cachyos-addons

#### Example for enabling a System Unit File
systemctl enable podman.socket
