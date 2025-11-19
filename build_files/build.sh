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
dnf -y copr enable mochaa/android-udev-rules
dnf -y copr enable sneexy/zen-browser

# trivalent repo
dnf -y install https://repo.secureblue.dev/secureblue.repo

# copr packages
dnf -y install \
    scx-scheds-git \
    scx-manager \
    android-udev-rules \
    ananicy-cpp \
    zen-browser

dnf -y install trivalent

# disable copr repos
dnf -y copr disable bieszczaders/kernel-cachyos-addons
dnf -y copr disable mochaa/android-udev-rules
dnf -y copr disable sneexy/zen-browser

#### Example for enabling a System Unit File
systemctl enable podman.socket
