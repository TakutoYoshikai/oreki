#!/bin/bash


cd /tmp
wget https://storage.googleapis.com/golang/go1.13.linux-amd64.tar.gz
tar vzfx go1.13.linux-amd64.tar.gz
sudo mv go /usr/local/
rm go1.13.linux-amd64.tar.gz
cd ~
mkdir go

echo "export GOPATH=$HOME/go"
echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin"
echo "export GOROOT=/usr/local/go"
read -p "I register those GOROOT and GOPATH and golang binary directory in your .bash_profile. ok? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "finished." ; exit ;; esac
echo "export GOPATH=$HOME/go" >> $HOME/.bash_profile
echo "export PATH=\$PATH:/usr/local/go/bin:$GOPATH/bin" >> $HOME/.bash_profile
echo "export GOROOT=/usr/local/go" >> $HOME/.bash_profile

