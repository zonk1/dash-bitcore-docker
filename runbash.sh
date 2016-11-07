#!/usr/bin/env bash

docker run --name dash -t -i -p 80:3001 \
    -v $(pwd)/nodedir:/usr/local/lib/node_modules/ \
    -v $(pwd)/datadir:/root/.bitcore \
    dash bash
