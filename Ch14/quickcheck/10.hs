module Main where

import Test.QuickCheck

f :: Int -> [a] -> Bool
f n xs = length (take n xs) == n

main :: IO ()
main = quickCheck (f :: Int -> [Int] -> Bool)