#!/bin/bash

cd `dirname $0`
sudo yum install -y `cat yum.txt`
