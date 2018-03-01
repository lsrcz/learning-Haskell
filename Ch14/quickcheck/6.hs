module Main where

import Test.QuickCheck

prop_powAssociative :: (Num a, Eq a, Integral b, Integral c) => a -> b -> c -> Bool
prop_powAssociative x y z =
  x ^ (y ^ z) == (x ^ y) ^ z

prop_powCommutative :: (Integral a) => a -> a -> Bool
prop_powCommutative x y = 
  x ^ y == y ^ x

main :: IO ()
main = do
  quickCheck (prop_powAssociative :: Int -> Int -> Int -> Bool)
  quickCheck (prop_powCommutative :: Int -> Int -> Bool)
      