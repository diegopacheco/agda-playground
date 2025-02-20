#!/bin/bash

echo '#!/bin/bash

agda --guardedness --compile main.agda
./main

rm -rf MAlonzo
rm main
rm main.agdai
' > run.sh
chmod +x ./run.sh

echo '{-# OPTIONS --guardedness #-}
module main where

open import IO

main : Main
main = run (putStrLn "Hello, World!")
' > main.agda

echo '### Build / Run

```bash
./run.sh
```

### Result

```
```' > README.md