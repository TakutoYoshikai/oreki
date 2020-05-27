#!/bin/bash

cd /tmp
git clone https://github.com/ethereum/go-ethereum
cd go-ethereum
make geth
sudo cp build/bin/geth /usr/local/bin
