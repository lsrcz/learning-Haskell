module Main where

import Test.QuickCheck

prop_foldConsAppend :: (Eq a) => [a] -> [a] -> Bool
prop_foldConsAppend acc xs = 
  foldr (:) acc xs == acc ++ xs

prop_foldAppendConcat :: (Eq a) => [[a]] -> Bool
prop_foldAppendConcat xs =
  foldr (++) [] xs == concat xs

main :: IO ()
main = do
  quickCheck (prop_foldConsAppend :: [Int] -> [Int] -> Bool)
  quickCheck (prop_foldAppendConcat :: [[Int]] -> Bool)