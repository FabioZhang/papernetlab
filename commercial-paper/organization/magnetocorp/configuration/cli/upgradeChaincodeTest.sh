#!/bin/bash

if [ -z "$1" ]; then
  echo "upgradeChaincode.sh [version]"
  exit 1
fi

set -x

docker exec \
    -e "CORE_PEER_LOCALMSPID=Org1MSP" \
    -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp" \
    cliMagnetoCorp \
    peer chaincode upgrade \
      -o orderer.example.com:7050 \
      -C mychannel \
      -n papercontract \
      -v "$1" \
      -p /opt/gopath/src/github.com/contract \
      -c '{"Args":[]}' 

sleep 3

docker exec cliMagnetoCorp peer chaincode list --instantiated -C mychannel
