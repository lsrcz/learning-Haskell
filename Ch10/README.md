# Chapter 10. Folding lists

## Warm-up and review
1. > Given the following sets of consonants and vowels:
   > ```haskell
   > stops = "pbtdkg"
   > vowels = "aeiou"
   > ```
   > 1. Write a function that takes inputs from stops and vowels and makes 3-tuples of all possible stop-vowel-stop combinations. These will not all correspond to real words in English, although the stop-vowel-stop pattern is common enough that many of them will.
   >
   > 2. Modify that function so that it only returns the combinations that begin with a p.
   >
   > 3. Now set up lists of nouns and verbs (instead of stops and vowels) and modify the function to make tuples representing possible noun-verb-noun sentences.
   
   [Here](./words.hs) is the code.

2. > What does the following mystery function do? What is its type? Try to get a good sense of what it does before you test it in the REPL to verify it.
   > ```haskell
   > seekritFunc x =
   >   div (sum (map length (words x)))
   >       (length (words x))
   > ```

   It returns the average word length of a sentence. The type is `String -> Int`

3. > We’d really like the answer to be more precise. Can you rewrite that using fractional division?

   ```haskell
   seekritFunc x =
       fromIntegral (sum (map length (words x))) /
       fromIntegral (length (words x))
   ```

## Rewriting functions using folds
Rewrite the functions using folds, and try to rewrite the fold version so that it is point-free.
```haskell
-- myOr returns True if any Bool in the list is True.
myOr :: [Bool] -> Bool
-- myAny returns True if a -> Bool applied to any of the values in the list returns True.
myAny :: (a -> Bool) -> [a] -> Bool
-- In addition to the recursive and fold based myElem, write a version that uses any.
myElem :: Eq a => a -> [a] -> Bool
-- Implement myReverse, don’t worry about trying to make it lazy.
myReverse :: [a] -> [a]
-- Write myMap in terms of foldr. It should have the same behavior as the built-in map.
myMap :: (a -> b) -> [a] -> [b]
-- Write myFilter in terms of foldr. It should have the same behavior as the built-in filter.
myFilter :: (a -> Bool) -> [a] -> [a]
-- squish flattens a list of lists into a list
squish :: [[a]] -> [a]
-- squishMap maps a function over a list and concatenates the results.
squishMap :: (a -> [b]) -> [a] -> [b]
-- squishAgain flattens a list of lists into a list. This time re-use the squishMap function.
squishAgain :: [[a]] -> [a]
-- myMaximumBy takes a comparison function and a list and returns the greatest element of the list based on the last value that the comparison returned GT for.
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
-- myMinimumBy takes a comparison function and a list and returns the least element of the list based on the last value that the comparison returned LT for.
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
```
[Here](./foldFuncs.hs) is the code.