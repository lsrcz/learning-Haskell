module Strproc where

notThe :: String -> Maybe String
notThe "the" = Nothing
notThe x = Just x

replaceThe :: String -> String
replaceThe = unwords . map (\xs -> if xs == "the" then "a" else xs) . words



isVowel :: Char -> Bool
isVowel ch = ch `elem` "aeiouAEIOU"

startsWithVowel :: String -> Bool
startsWithVowel [] = False
startsWithVowel (c:_) = isVowel c

countTheBeforeVowel :: String -> Integer
countTheBeforeVowel xs = 
  case words xs of
    [] -> 0
    theWords ->
      fromIntegral $ length 
      $ filter (\(t, v) -> t == "the" && startsWithVowel v) 
      $ zip theWords (tail theWords)



getVowels :: String -> String
getVowels = filter isVowel

countVowels :: String -> Integer
countVowels = fromIntegral . length . concatMap getVowels . words