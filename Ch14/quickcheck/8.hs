module Main where

import Test.QuickCheck
import Test.QuickCheck.Classes

prop_applyComp :: (Eq b) => (a -> b) -> (c -> a) -> c -> Bool
prop_applyComp f g x = (f . g) x == (f $ g x)

main :: IO ()
main = quickCheck (prop_applyComp :: (Int -> Int) -> (Int -> Int) -> Int -> Bool)