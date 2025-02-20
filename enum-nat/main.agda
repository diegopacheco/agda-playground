{-# OPTIONS --guardedness #-}
module main where

open import IO
open import Data.Nat using (ℕ; zero; suc)
open import Data.String using (String)
open import Data.Nat.Show using (show)
open import Relation.Binary.PropositionalEquality

-- This is a type that represents an enumeration of a type A.
record Enumeration (A : Set) : Set where
  field
    start    : A
    forward  : A → A
    backward : A → A

-- applies forward three times
3rd : {A : Set} → Enumeration A → A
3rd e = Enumeration.forward e (Enumeration.forward e (Enumeration.forward e (Enumeration.start e)))

-- applies backward twice
backward-2 : {A : Set} → Enumeration A → A → A
backward-2 e x = Enumeration.backward e (Enumeration.backward e x)

-- represents an enumeration of natural numbers
enum-Nat : Enumeration ℕ
enum-Nat = record
  { start    = zero
  ; forward  = suc
  ; backward = pred
  }
  where
    pred : ℕ → ℕ
    pred zero    = zero
    pred (suc x) = x

test₁ : 3rd enum-Nat ≡ 3
test₁ = refl

test₂ : backward-2 enum-Nat 5 ≡ 3
test₂ = refl

-- Examplanation:
-- First line: 3 (from applying forward three times to 0)
-- Second line: 3 (from applying backward twice to 5)
main : Main
main = run (putStrLn (show (3rd enum-Nat)) >> putStrLn (show (backward-2 enum-Nat 5)))