#!/bin/bash

STDLIB_PATH=/home/diego/git/misc/agda-stdlib
echo "Using stdlib path: $STDLIB_PATH"
echo "Library file contents:"
cat $STDLIB_PATH/standard-library.agda-lib
echo "---"
agda -v 2 --compile --library-file=$STDLIB_PATH/standard-library.agda-lib hello.agda