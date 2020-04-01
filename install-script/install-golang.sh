#!/bin/bash

cd /tmp
wget https://storage.googleapis.com/golang/go1.13.linux-amd64.tar.gz
tar vzfx go1.13.linux-amd64.tar.gz
sudo mv go /usr/local/
rm go1.13.linux-amd64.tar.gz
