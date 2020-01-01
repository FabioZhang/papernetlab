#!/bin/bash

if [ -z "$1" ]; then
  echo "installChaincodeTest.sh [version]"
  exit 1
fi

set -x

docker exec cliMagnetoCorp \
    peer chaincode install \
      -n papercontract \
      -v "$1" \
      -p /opt/gopath/src/github.com/contract \
      -l node

sleep 3

docker exec cliMagnetoCorp peer chaincode list --installed