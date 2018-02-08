module Recursion where

-- recursively sums all numbers from 1 to n
-- It's a partial function
sumFromOne :: (Eq a, Num a) => a -> a
sumFromOne x
    | x == 1    = 1
    | otherwise = sumFromOne (x - 1) + x

-- This may be better
sumFromOne' :: (Ord a, Num a) => a -> a
sumFromOne' x = go 1 0
    where go num acc
            | num > x   = acc
            | otherwise = go (num + 1) (acc + num)

-- multiplies two integral numbers using recursive summation
mulBySum :: Integral a => a -> a -> a
mulBySum x y
    | y == 0    = 0
    | y < 0     = mulBySum x (y + 1) - x
    | otherwise = mulBySum x (y - 1) + x