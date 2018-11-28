#!/bin/bash

# Check parameters
test $# = 1 || { echo "Need 1 parameter: Name of the stack to create"; exit 1; }
STACK="$1"

# Create the stack using server-landscape.yaml and defining all necessary parameters
[[TODO]]
