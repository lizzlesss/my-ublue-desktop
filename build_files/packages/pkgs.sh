#!/usr/bin/env bash

set -eoux pipefail

# enable rpmfusion
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# intel media driver and codecs
dnf -y install \
    intel-media-driver

dnf -y group install \
    fonts

# packages
dnf -y install \
    android-tools \
    mangohud \
    steam \
    adw-gtk3-theme \
    waydroid
    
# nbfc-linux official rpm
dnf install -y https://github.com/nbfc-linux/nbfc-linux/releases/download/0.4.1/fedora-nbfc-linux-0.4.1-1.x86_64.rpm

# copr
dnf -y copr enable mochaa/android-udev-rules
dnf -y copr enable sneed/llama-cpp-vulkan

dnf -y install \
    android-udev-rules \
    llama-cpp
    
dnf -y copr disable mochaa/android-udev-rules
dnf -y copr disable sneed/llama-cpp-vulkan

systemctl enable podman.socket

#### Example for enabling a System Unit File
