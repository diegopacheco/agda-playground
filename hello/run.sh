#!/bin/bash

STDLIB_PATH=/home/diego/git/misc/agda-stdlib
echo "Using stdlib path: $STDLIB_PATH"
agda --compile --library-file=$STDLIB_PATH/standard-library.agda-lib hello.agda