module Main where

import Test.QuickCheck

data Fool =
    Fulse
  | Frue
  deriving (Eq, Show)

genEq :: Gen Fool
genEq = elements [Fulse, Frue]

genEqWeighted :: Gen Fool
genEqWeighted = frequency [(2, return Fulse), (1, return Frue)]


main :: IO ()
main = do
  putStrLn "Gen 10 Fool of equal probabilities"
  sample genEq
  putStrLn "Gen 10 Fool with 2/3s chance of Fulse, 1/3 chance of Frue"
  sample genEqWeighted
