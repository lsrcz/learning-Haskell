module Vigenere where

import Data.Char

encode :: Char -> (Int, Char)
encode ch = 
    (ord ch - ord base, base)
    where base = if isUpper ch then 'A' else 'a'

decode :: (Int, Char) -> Char
decode (code, base) = chr (ord base + code)

shift :: (Int, Char) -> Char
shift (i, ch) 
    | i == 0 = ch
    | otherwise = 
        let (code, base) = encode ch 
        in decode ((code + (i `rem` 26) + 26) `rem` 26, base)

vigenere :: [(Int, Char)] -> String
vigenere = map shift

keySeqGen :: String -> [Int]
keySeqGen = map (\c -> ord (toLower c) - ord 'a') . cycle

cipherSeqGen :: [Int] -> String -> [(Int, Char)]
cipherSeqGen _ [] = []
cipherSeqGen keySeq@(k:ks) (c:cs)
    | isAlpha c = (k, c) : cipherSeqGen ks cs
    | otherwise = (0, c) : cipherSeqGen keySeq cs

caesar :: String -> String -> String
caesar key str = vigenere $ cipherSeqGen (keySeqGen key) str

unCaesar :: String -> String -> String
unCaesar key str = vigenere $ cipherSeqGen (map negate $ keySeqGen key) str

main :: IO()
main = do
    print $ caesar "ALLY" "MEET AT DAWN"
    print $ unCaesar "ALLY" "MPPR AE OYWY"