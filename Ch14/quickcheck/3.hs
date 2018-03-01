module Main where

import Test.QuickCheck

prop_plusAssociative :: (Num a, Eq a) => a -> a -> a -> Bool
prop_plusAssociative x y z =
  x + (y + z) == (x + y) + z

prop_plusCommutative :: (Num a, Eq a) => a -> a -> Bool
prop_plusCommutative x y = 
  x + y == y + x

main :: IO ()
main = do
  quickCheck (prop_plusAssociative :: Int -> Int -> Int -> Bool)
  quickCheck (prop_plusCommutative :: Int -> Int -> Bool)
  