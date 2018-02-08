module Div where

data DividedResult =
    Result Integer
  | DividedByZero

instance Show DividedResult where
    show (Result x) = show x
    show DividedByZero = "Divided by 0!!!"


dividedBy :: Integer -> Integer -> DividedResult
dividedBy num denom
    | denom == 0    = DividedByZero
    | otherwise     = Result $ sgn num * sgn denom * go (abs num) (abs denom) 0
    where go n d count
            | n < d = count
            | otherwise = go (n - d) d (count + 1)
          sgn x 
            | x == 0    = 0
            | x < 0     = -1
            | otherwise = 1