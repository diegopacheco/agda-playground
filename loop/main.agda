{-# OPTIONS --guardedness #-}
module main where

open import Agda.Primitive using (lzero)
open import Data.Nat using (ℕ; zero; suc)
open import Data.Unit.Polymorphic using (⊤; tt)
open import Data.String using (String; _++_)
open import IO using (IO; putStrLn; _>>_; Main; run)
open import Function using (_∘_)

-- recursive function that converts a natural number to string
showNat : ℕ → String
showNat zero    = "0"
showNat (suc n) = showNat n ++ " + 1"

-- recursive function that counts down from n to 0
loop : ℕ → IO (⊤ {lzero})
loop zero    = putStrLn "Loop finished!"
loop (suc n) = do
  putStrLn ("Current number: " ++ showNat (suc n))
  loop n

main : Main
main = run (loop 3)