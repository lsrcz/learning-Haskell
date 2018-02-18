module Words where

svsCombinations :: String -> String -> [(Char, Char, Char)]
svsCombinations stops vowels =
    concatMap (
        \s1 -> concatMap (
            \v -> map (
                \s2 -> (s1, v, s2)
            ) stops
        ) vowels
    ) stops

svsCombinations' :: String -> String -> [(Char, Char, Char)]
svsCombinations' stops vowels =
    foldr (
        \s1 acc -> 
            if s1 == 'p'
                then
                    concatMap (
                        \v -> map (
                            \s2 -> (s1, v, s2)
                        ) stops
                    ) vowels ++ acc
                else
                    acc
    ) [] stops

nvnCombinations :: [String] -> [String] -> [(String, String, String)]
nvnCombinations nouns verbs =
    concatMap (
        \n1 -> concatMap (
            \v -> map (
                \n2 -> (n1, v, n2)
            ) nouns
        ) verbs
    ) nouns