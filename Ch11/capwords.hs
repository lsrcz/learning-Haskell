module Capwords where

import Data.Char

capitalizeWords :: String -> [(String, String)]
capitalizeWords str = map (\word@(c:cs) -> (word, toUpper c : cs)) $ words str

main :: IO()
main = print $ capitalizeWords "hello world"