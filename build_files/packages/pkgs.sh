#!/usr/bin/env bash

set -eoux pipefail

#dnf -y install intel-media-driver

# packages
dnf -y install \
    android-tools \
    mangohud \
    intel-lpmd

# copr
dnf copr enable -y bieszczaders/kernel-cachyos-addons

# Adds required package for the scheduler
dnf install -y \
    --enablerepo="copr:copr.fedorainfracloud.org:bieszczaders:kernel-cachyos-addons" \
    --allowerasing \
    libcap-ng libcap-ng-devel cachyos-ksm-settings procps-ng procps-ng-devel uksmd libbpf cachyos-settings ananicy-cpp

dnf -y copr enable mochaa/android-udev-rules

dnf -y install \
    android-udev-rules
    
dnf -y copr disable mochaa/android-udev-rules
dnf -y copr disable bieszczaders/kernel-cachyos-addons
