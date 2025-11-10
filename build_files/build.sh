#!/bin/bash

set -ouex pipefail

# enable rpmfusion
dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# intel media driver and codecs
dnf5 install -y intel-media-driver
dnf5 install -y ffmpeg
dnf5 install -y mpv

# packages
dnf5 install -y tmux 
dnf5 install -y nvtop

# nbfc-linux official rpm
dnf5 install -y https://github.com/nbfc-linux/nbfc-linux/releases/download/0.3.19/fedora-nbfc-linux-0.3.19-1.x86_64.rpm

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
