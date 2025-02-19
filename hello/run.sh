#!/bin/bash

STDLIB_PATH=/home/diego/git/misc/agda-stdlib/
echo "Using stdlib path: $STDLIB_PATH"
echo "Library file contents:"
cat $STDLIB_PATH/standard-library.agda-lib
echo "---"
echo "Agda version:"
agda --version
echo "---"
agda -v 5 --compile --library-file=$STDLIB_PATH/standard-library.agda-lib hello.agda