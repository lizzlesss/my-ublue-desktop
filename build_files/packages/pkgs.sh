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

dnf -y copr enable mochaa/android-udev-rules
dnf -y copr enable kylegospo/system76-scheduler 
dnf -y copr enable crono/scx-scheds-cargo

# copr packages
dnf -y install \
    android-udev-rules \
    scx-scheds-git \
    scx-tools-git \
    system76-scheduler
    
dnf -y copr disable mochaa/android-udev-rules
dnf -y copr disable kylegospo/system76-scheduler 
dnf -y copr disable crono/scx-scheds-cargo

systemctl enable podman.socket

#### Example for enabling a System Unit File
