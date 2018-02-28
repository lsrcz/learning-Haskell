module Validate where

newtype Word' =
  Word' String
  deriving (Eq, Show)

vowels :: String
vowels = "aeiou"

isVowel :: Char -> Bool
isVowel = (`elem` vowels)

countVowel :: String -> Int
countVowel = length . filter isVowel
        
mkWord :: String -> Maybe Word'
mkWord xs = 
  if length xs < 2 * countVowel xs 
    then Nothing
    else Just $ Word' xs