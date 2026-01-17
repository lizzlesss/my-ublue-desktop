#!/bin/bash

set -ouex pipefail

edition="$1"


if [[ "$edition" == "workstation" ]]; then
    /ctx/packages/kernel.sh \
    /ctx/packages/pkgs.sh 

else
    echo "Invalid edition specified. Please use 'workstation' or 'multimedia'."
    exit 1
fi

