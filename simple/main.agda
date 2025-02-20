{-# OPTIONS --guardedness #-}
module main where

open import Data.Nat
open import IO
open import Data.String
import Data.Nat.Show as NatShow
open import Function using (_$_)

add : ℕ → ℕ → ℕ
add zero    n = n
add (suc m) n = suc (add m n)

two : ℕ
two = suc (suc zero)

three : ℕ
three = suc (suc (suc zero))

five : ℕ
five = add two three

main : Main
main = run $ putStrLn $ NatShow.show five