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
dnf install -y https://github.com/nbfc-linux/nbfc-linux/releases/download/0.3.19/fedora-nbfc-linux-0.3.19-1.x86_64.rpm

dnf -y copr enable mochaa/android-udev-rules fedora-rawhide-x86_64
dnf -y copr enable crono/system76-scheduler fedora-rawhide-x86_64
dnf -y copr enable sneed/llama-cpp-vulkan fedora-rawhide-x86_64
dnf -y copr enable imput/helium fedora-rawhide-x86_64


# copr packages
dnf -y install \
    android-udev-rules \
    system76-scheduler-git \
    llama-cpp \
    helium-bin
    
dnf -y copr disable mochaa/android-udev-rules
dnf -y copr disable crono/system76-scheduler
dnf -y copr disable sneed/llama-cpp-vulkan
dnf -y copr disable imput/helium

systemctl enable podman.socket

#### Example for enabling a System Unit File
