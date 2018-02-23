module Subseqof where

isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
isSubsequenceOf [] _ = True
isSubsequenceOf _ [] = False
isSubsequenceOf subseq@(s:ss) (x:xs)
    | s == x = isSubsequenceOf ss xs
    | otherwise = isSubsequenceOf subseq xs

main :: IO()
main = do
    print $ isSubsequenceOf "blah" "blahwoot"
    print $ isSubsequenceOf "blah" "wootblah"
    print $ isSubsequenceOf "blah" "wboloath"
    print $ isSubsequenceOf "blah" "wootbla"