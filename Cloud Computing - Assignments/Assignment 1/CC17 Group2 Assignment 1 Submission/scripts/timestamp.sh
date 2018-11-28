#! /bin/bash

while read line; do
	echo "$(date +%D-%T): ${line}"
done
