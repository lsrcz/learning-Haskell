module Main where

import Test.QuickCheck

f :: (Read x, Show x, Eq x) => x -> Bool
f x = (read (show x)) == x

main :: IO ()
main = do
  quickCheck (f :: Int -> Bool)
  quickCheck (f :: Double -> Bool)