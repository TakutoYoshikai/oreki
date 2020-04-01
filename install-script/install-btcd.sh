#!/bin/bash

git clone https://github.com/roasbeef/btcd $GOPATH/src/github.com/roasbeef/btcd
cd $GOPATH/src/github.com/roasbeef/btcd
glide install
go install . ./cmd/...
