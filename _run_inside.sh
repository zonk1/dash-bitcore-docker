#!/bin/bash

_term() { 
  echo "Caught SIGTERM signal, killing bitcore" 
  pkill -2 bitcore
  while pgrep bitcore > /dev/null; do sleep 1; done
  echo "Killing bitcore done" 
}

trap _term SIGTERM

cp /config.json /root/.bitcore/bitcore-node-dash.json

/usr/local/lib/node_modules/bitcore-dash/bin/bitcored &

child=$! 
wait "$child"

