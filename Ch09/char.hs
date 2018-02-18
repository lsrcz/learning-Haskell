module CharFunc where

import Data.Char

filterUpper :: String -> String
filterUpper = filter isUpper

capitalizeFirst :: String -> String
capitalizeFirst [] = []
capitalizeFirst (x : xs) = toUpper x : xs

mapUpperRecur :: String -> String
mapUpperRecur [] = []
mapUpperRecur (x : xs) = toUpper x : mapUpperRecur xs

capitalizedFirst :: String -> Char
capitalizedFirst = toUpper . head

main :: IO()
main = do
    print $ filterUpper "HbEfLrLxO"
    print $ capitalizeFirst "julie"
    print $ mapUpperRecur "woot"
    print $ capitalizedFirst "julie"