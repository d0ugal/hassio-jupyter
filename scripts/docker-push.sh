#!/bin/bash

set -evx
set -x

repo=$1;

docker run -it --rm --privileged --name "jupyter" \
    -v ~/.docker:/root/.docker \
    -v "${repo}":/docker \
    hassioaddons/build-env:latest \
    --image "d0ugal/hassio-jupyter-{arch}" \
    --target "jupyter" \
    --git \
    --${ARCH:-all} \
    --push
