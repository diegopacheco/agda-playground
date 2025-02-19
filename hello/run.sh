#!/bin/bash

agda --guardedness --compile hello.agda
./hello

rm -rf MAlonzo
rm hello
rm hello.agdai