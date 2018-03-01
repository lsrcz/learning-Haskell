module Main where

import Data.List (sort)
import Test.QuickCheck

listOrdered :: (Ord a) => [a] -> Bool
listOrdered xs = snd $ foldr go (Nothing, True) xs
  where go _ status@(_, False) = status
        go y (Nothing, t) = (Just y, t)
        go y (Just x, t) = (Just y, x >= y)

prop_sortOrdered :: (Ord a) => [a] -> Bool
prop_sortOrdered = listOrdered . sort

main :: IO()
main = quickCheck (prop_sortOrdered :: [Int] -> Bool)