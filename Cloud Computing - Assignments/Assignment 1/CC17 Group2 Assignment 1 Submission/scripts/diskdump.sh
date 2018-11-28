#!/bin/bash

READ_DEV=/dev/vda1
echo "Reading 4.3G of data from $READ_DEV (must run as root)"
dd if=$READ_DEV of=/dev/null bs=4096 count=1M
