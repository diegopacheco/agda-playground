{-# OPTIONS --guardedness #-}
module main where

open import IO
open import Data.Nat
open import Data.String as String using (String)
open import Data.List
open import Data.List.Base using (_∷_)
open import Data.List.Show
open import Data.Nat.Show

-- coinductive allow infinite data structures
record Stream (A : Set) : Set where
  coinductive
  field
    hd : A
    tl : Stream A
open Stream

-- Create infinite streams with same value
{-# TERMINATING #-}
repeat : {A : Set} (a : A) → Stream A
repeat a = record
  { hd = a
  ; tl = repeat a
  }

-- Takes every other element from a stream
{-# TERMINATING #-}
even : ∀ {A} → Stream A → Stream A
even xs = record
  { hd = hd xs
  ; tl = even (tl (tl xs))
  }

-- Takes the odd-positioned elements by first dropping one element and then taking every other element
odd : ∀ {A} → Stream A → Stream A
odd xs = even (tl xs)

-- Take first n elements of stream and convert to a list
takeStream : ∀ {A} → ℕ → Stream A → List A
takeStream zero _ = []
takeStream (suc n) xs = hd xs ∷ takeStream n (tl xs)

showList : List ℕ → String
showList [] = "[]"
showList (x ∷ xs) = Data.Nat.Show.show x String.++ " ∷ " String.++ showList xs

main : Main
main = run (putStrLn (showList (takeStream 5 (odd (repeat 2)))))