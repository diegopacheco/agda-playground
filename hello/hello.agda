module hello where

import Data.String
import IO.Primitive

main : IO.Primitive.IO ⊤
main = IO.Primitive.putStrLn "Hello, World!"