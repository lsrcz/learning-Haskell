module Main where

import Test.QuickCheck

prop_multAssociative :: (Num a, Eq a) => a -> a -> a -> Bool
prop_multAssociative x y z =
  x * (y * z) == (x * y) * z

prop_multCommutative :: (Num a, Eq a) => a -> a -> Bool
prop_multCommutative x y = 
  x * y == y * x

main :: IO ()
main = do
  quickCheck (prop_multAssociative :: Int -> Int -> Int -> Bool)
  quickCheck (prop_multCommutative :: Int -> Int -> Bool)
      