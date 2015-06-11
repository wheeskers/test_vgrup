#!/bin/bash

# Download sources & extract
cd /home/vagrant
wget http://www.python.org/ftp/python/2.7.8/Python-2.7.8.tar.xz
xz -d Python-2.7.8.tar.xz
tar -xvf Python-2.7.8.tar

# Configure, compile & install
cd Python-2.7.8
./configure --prefix=/usr/local
make
make altinstall
export PATH="/usr/local/bin:$PATH"
