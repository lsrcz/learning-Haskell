module Main where

import Test.QuickCheck

half :: (Fractional a) => a -> a
half x = x / 2

halfIdentity :: (Fractional a) => a -> a
halfIdentity = (*2) . half

prop_halfIdentity :: (Fractional a, Eq a) => a -> Bool
prop_halfIdentity x = halfIdentity x == x

main :: IO()
main = quickCheck (prop_halfIdentity :: Float -> Bool)