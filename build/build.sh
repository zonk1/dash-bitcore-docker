#!/usr/bin/env bash
docker build -t dash-build .

docker run -t \
    -v $(pwd)/bin:/out \
    dash-build \
    /bin/bash -c 'cp /tmp/dash/src/dashd /out'

# TODO: cleanup image & container, run build with --rm
