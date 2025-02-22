{-# OPTIONS --guardedness #-}
module main where

open import IO
open import Data.Bool
open import Data.String

data TrafficLight : Set where
  red yellow green : TrafficLight

go : TrafficLight → Bool
go red    = false
go yellow = false
go green  = true

main : Main
main = run (putStrLn (if go green then "Go!" else "Stop!"))