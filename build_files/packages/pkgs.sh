#!/usr/bin/env bash

set -eoux pipefail

#dnf -y install intel-media-driver

dnf -y install \
    google-noto-sans-cjk-fonts \
    google-noto-serif-cjk-fonts

# packages
dnf -y install \
    android-tools \
    mangohud \
    powertop 

# copr
dnf copr enable -y bieszczaders/kernel-cachyos-addons

# Adds required package for the scheduler
dnf install -y \
    --enablerepo="copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-addons" \
    --allowerasing \
    libcap-ng libcap-ng-devel bore-sysctl cachyos-ksm-settings procps-ng procps-ng-devel uksmd libbpf scx-scheds-git scx-tools-git cachyos-settings ananicy-cpp

dnf -y copr enable mochaa/android-udev-rules
dnf -y copr enable sneed/llama-cpp-vulkan

dnf -y install \
    android-udev-rules \
    llama-cpp
    
dnf -y copr disable mochaa/android-udev-rules
dnf -y copr disable sneed/llama-cpp-vulkan
dnf -y copr disable bieszczaders/kernel-cachyos-addons

systemctl enable podman.socket

#### Example for enabling a System Unit File
