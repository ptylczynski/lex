#!/bin/bash
mkdir -v $1
cd $1
cp -v ../init/scan.l .
cp -v ../init/makefile .
chmod -v 755 scan.l
chmod -v 755 makefile
