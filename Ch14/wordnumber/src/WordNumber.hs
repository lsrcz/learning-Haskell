module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String 
digitToWord n = 
    ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"] 
    !! (abs n `mod` 10)

digits :: Int -> [Int] 
digits n = map (\x -> read [x] :: Int) $ show n

wordNumber :: Int -> String 
wordNumber n
    | n < 0 = "minus-" ++ word
    | otherwise = word
    where word = concat $ intersperse "-" $ map digitToWord $ digits $ abs n