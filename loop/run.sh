#!/bin/bash

agda --guardedness --compile main.agda
./main

rm -rf MAlonzo
rm main
rm main.agdai

