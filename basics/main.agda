{-# OPTIONS --guardedness #-}
module main where

open import IO.Primitive using (IO)
open import IO using (Main; run)
open import Data.Nat
open import Data.String hiding (show)
open import Data.Nat.Show using (show)
open import Data.Unit.Polymorphic using (⊤)
open import Level using (0ℓ)
open import IO.Primitive using (putStrLn)
open import IO.Base using (_>>=_; _>>_)

printNumbers : ℕ → IO 0ℓ ⊤
printNumbers zero = putStrLn "Done!"
printNumbers (suc n) = do
  putStrLn (show (suc n))
  printNumbers n

main : Main
main = run (printNumbers 10)