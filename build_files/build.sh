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
    android-tools

# steam
dnf -y --setopt=install_weak_deps=False install \
        steam

# nbfc-linux official rpm
dnf5 install -y https://github.com/nbfc-linux/nbfc-linux/releases/download/0.3.19/fedora-nbfc-linux-0.3.19-1.x86_64.rpm

# copr repos
dnf -y copr enable bieszczaders/kernel-cachyos-addons
dnf -y copr enable v8v88v8v88/helium
dnf -y copr enable ublue-os/flatpak-test
dnf -y copr enable mochaa/android-udev-rules

# copr packages
dnf -y install \
    scx-scheds-git \
    scx-manager \
    helium \
    flatpak \
    android-udev-rules
    

# disable copr repos
dnf -y copr disable bieszczaders/kernel-cachyos-addons
dnf -y copr disable v8v88v8v88/helium
dnf -y copr disable ublue-os/flatpak-test
dnf -y copr disable mochaa/android-udev-rules

#### Example for enabling a System Unit File
systemctl enable podman.socket
