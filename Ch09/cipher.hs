module Cipher where

import Data.Char

encode :: Char -> (Int, Char)
encode ch = 
    (ord ch - ord base, base)
    where base = if isUpper ch then 'A' else 'a'

decode :: (Int, Char) -> Char
decode (code, base) = chr (ord base + code)

shift :: Int -> Char -> Char
shift i ch = 
    if isAlpha ch
        then decode ((code + (i `rem` 26) + 26) `rem` 26, base)
        else ch
    where (code, base) = encode ch

caesar :: Int -> String -> String
caesar i = map $ shift i

unCaesar :: Int -> String -> String
unCaesar i = map $ shift $ -i

main :: IO()
main = do
    print $ caesar 1 "abzABZ"
    print $ caesar 27 "abzABZ"
    print $ unCaesar 1 "abzABZ"
    print $ unCaesar 27 "abzABZ"
    print $ caesar 1 "Hello, world!!"