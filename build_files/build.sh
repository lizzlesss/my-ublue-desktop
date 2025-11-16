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
    android-tools \
    mangohud \
    steam \
    jmtpfs \
    gvfs-mtp \
    gnome-disk-utility \
    adw-gtk3-theme
    
# nbfc-linux official rpm
dnf5 install -y https://github.com/nbfc-linux/nbfc-linux/releases/download/0.3.19/fedora-nbfc-linux-0.3.19-1.x86_64.rpm

# copr repos
dnf -y copr enable bieszczaders/kernel-cachyos-addons
dnf -y copr enable v8v88v8v88/helium
dnf -y copr enable mochaa/android-udev-rules
dnf -y copr enable shdwchn10/xpadneo
dnf -y copr enable sneexy/zen-browser 

# copr packages
dnf -y install \
    scx-scheds-git \
    scx-manager \
    helium \
    android-udev-rules \
    xpadneo \
    ananicy-cpp \
    zen-browser 
    

# disable copr repos
dnf -y copr disable bieszczaders/kernel-cachyos-addons
dnf -y copr disable v8v88v8v88/helium
dnf -y copr disable mochaa/android-udev-rules
dnf -y copr disable shdwchn10/xpadneo
dnf -y copr disable sneexy/zen-browser 

#### Example for enabling a System Unit File
systemctl enable podman.socket
