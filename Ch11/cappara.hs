module Cappara where

import Data.Char

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (c:cs) = toUpper c : cs

capitalizeParagraph :: String -> String
capitalizeParagraph = go . words
    where capitalizeWithCond b = if b then capitalizeWord else id
          endWithDot = (=='.') . last
          go wordList = unwords $ zipWith capitalizeWithCond (True:map endWithDot wordList) wordList

main :: IO()
main = print $ capitalizeParagraph "blah. woot ha."