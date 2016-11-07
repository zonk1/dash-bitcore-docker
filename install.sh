#!/usr/bin/env bash
set -ex
docker build -t dash .

docker run -t \
    -v $(pwd)/nodedir:/usr/local/lib/node_modules/ \
    dash \
    npm install -g bitcore-dash


