# Chapter 12. Signaling Adversity

## Determine the kinds
1. > Given
   > ```haskell
   > id :: a -> a
   > ```
   > What is the kind of `a`?

   The kind of `a` is `*`.

2. > ```haskell
   > r :: a -> f a
   > What are the kinds of `a` and `f`.

   The kind of `a` is `*`, the kind of `f` is `* -> *`.

## String processing
1. > Write a recursive function that takes a text/string, breaks it into words and replaces each instance of ”the” with ”a”. It’s intended only to replace exactly the word “the”.
   > ```haskell
   > -- >>> notThe "the"
   > -- Nothing
   > -- >>> notThe "blahtheblah"
   > -- Just "blahtheblah"
   > -- >>> notThe "woot"
   > -- Just "woot"
   > notThe :: String -> Maybe String 
   > notThe = undefined
   > 
   > -- >>> replaceThe "the cow loves us" 
   > -- "a cow loves us"
   > replaceThe :: String -> String
   > replaceThe = undefined
   > ```
2. > Write a recursive function that takes a text/string, breaks it into words, and counts the number of instances of ”the” followed by a vowel-initial word.
   > ```haskell
   > -- >>> countTheBeforeVowel "the cow"
   > -- 0
   > -- >>> countTheBeforeVowel "the evil cow" 
   > -- 1
   > countTheBeforeVowel :: String -> Integer 
   > countTheBeforeVowel = undefined
   > ```
3. > Return the number of letters that are vowels in a word.
   > 
   > Hint: it’s helpful to break this into steps. Add any helper func- tions necessary to achieve your objectives.
   > 
   > 1. Test for vowelhood
   > 
   > 2. Return the vowels of a string
   > 
   > 3. Count the number of elements returned
   > ```haskell
   > -- >>> countVowels "the cow"
   > -- 2
   > -- >>> countVowels "Mikolajczak" 
   > -- 4
   > countVowels :: String -> Integer 
   > countVowels = undefined
   > ```
   [Here](./strproc.hs) is the code.

## Validate the word
> Use the Maybe type to write a function that counts the number of vowels in a string and the number of consonants. If the number of vowels exceeds the number of consonants, the function returns Nothing. In many human languages, vowels rarely exceed the number of consonants so when they do, it indicates the input isn’t a real word (that is, a valid input to your dataset):
> ```haskell
> newtype Word' =
>   Word' String
>   deriving (Eq, Show)
> 
> vowels = "aeiou"
>
> mkWord :: String -> Maybe Word'
> mkWord = undefined
> ```
[Here](./validate.hs) is the code.

## It's only Natural
> You’ll be presented with a datatype to represent the natural numbers. The only values representable with the naturals are whole numbers from zero to infinity. Your task will be to implement functions to convert Naturals to Integers and Integers to Naturals. The conversion from Naturals to Integers won’t return Maybe because Integers are a strict superset of Naturals. Any Natural can be represented by an Integer, but the same is not true of any Integer. Negative numbers are not valid natural numbers.
> ```haskell
> data Nat =
>     Zero
>   | Succ Nat
>   deriving (Eq, Show)
>
> -- >>> natToInteger Zero
> -- 0
> -- >>> natToInteger (Succ Zero)
> -- 1
> -- >>> natToInteger (Succ (Succ Zero)) -- 2
> natToInteger :: Nat -> Integer
> natToInteger = undefined
> 
> -- >>> integerToNat 0
> -- Just Zero
> -- >>> integerToNat 1
> -- Just (Succ Zero)
> -- >>> integerToNat 2
> -- Just (Succ (Succ Zero))
> -- >>> integerToNat (-1)
> -- Nothing
> integerToNat :: Integer -> Maybe Nat 
> integerToNat = undefined
> ```
[Here](./nat.hs) is the code.

## Small library for Maybe
> Write the following functions. This may take some time.
1. > Simple boolean checks for `Maybe` values. 
   > ```haskell
   > -- >>> isJust (Just 1)
   > -- True
   > -- >>> isJust Nothing
   > -- False
   > isJust :: Maybe a -> Bool
   > 
   > -- >>> isNothing (Just 1)
   > -- False
   > -- >>> isNothing Nothing
   > -- True
   > isNothing :: Maybe a -> Bool
   > ```
2. > The following is the `Maybe` catamorphism. You can turn a `Maybe` value into anything else with this.
   > ```haskell
   > -- >>> mayybee 0 (+1) Nothing
   > -- 0
   > -- >>> mayybee 0 (+1) (Just 1)
   > -- 2
   > mayybee :: b -> (a -> b) -> Maybe a -> b
   > ```
3. > In case you just want to provide a fallback value.
   > ```haskell
   > -- >>> fromMaybe 0 Nothing
   > -- 0
   > -- >>> fromMaybe 0 (Just 1)
   > -- 1
   > fromMaybe :: a -> Maybe a -> a
   >
   > -- Try writing it in terms of the maybe catamorphism
   > ```
4. > Converting between List and Maybe.
   > ```haskell
   > -- >>> listToMaybe [1, 2, 3]
   > -- Just 1
   > -- >>> listToMaybe []
   > -- Nothing
   > listToMaybe :: [a] -> Maybe a
   >
   > -- >>> maybeToList (Just 1)
   > -- [1]
   > -- >>> maybeToList Nothing
   > -- []
   > maybeToList :: Maybe a -> [a]
   > ```
5. > For when we just want to drop the Nothing values from our list.
   > ```haskell
   > -- >>> catMaybes [Just 1, Nothing, Just 2]
   > -- [1, 2]
   > -- >>> catMaybes [Nothing, Nothing, Nothing]
   > -- []
   > catMaybes :: [Maybe a] -> [a]
   > ```
6. > You’ll see this called “sequence” later.
   > ```haskell
   > -- >>> flipMaybe [Just 1, Just 2, Just 3]
   > -- Just [1, 2, 3]
   > -- >>> flipMaybe [Just 1, Nothing, Just 3]
   > -- Nothing
   > flipMaybe :: [Maybe a] -> Maybe [a]
   > ```
[Here](./maybe.hs) is the code.

## Small library for Either
> Write each of the following functions. If more than one possible unique function exists for the type, use common sense to determine what it should do.
1. > Try to eventually arrive at a solution that uses foldr even if earlier versions don't use `foldr`
   > ```haskell
   > lefts' :: [Either a b] -> [a]
   > ```
2. > Same as the last one. Use `foldr` eventually.
   > ```haskell
   > rights' :: [Either a b] -> [b]
   > ```
3. > ```haskell
   > partitionEithers' :: [Either a b] -> ([a], [b])
   > ```
4. > ```haskell
   > eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
   > ```
5. > This is a general catamorphism for Either values.
   > ```haskell
   > either' :: (a -> c) -> (b -> c) -> Either a b -> c
   > ```
6. > Same as before, but use the either' function you just wrote.
   > ```haskell
   > eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
   > ```
[Here](./either.hs) is the code.

## Write your own iterate and unfoldr
1. > Write the function `myIterate` using direct recursion. Compare the behavior with the built-in `iterate` to gauge correctness. Do not look at the source or any examples of `iterate` so that you are forced to do this yourself.
   > ```haskell
   > myIterate :: (a -> a) -> a -> [a]
   > myIterate = undefined
   > ```
2. > Write the function `myUnfoldr` using direct recursion. Compare with the built-in `unfoldr` to check your implementation. Again, don’t look at implementations of `unfoldr` so that you figure it out yourself.
   > ```haskell
   > myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
   > myUnfoldr = undefined
   > ```
3. Rewrite `myIterate` into `betterIterate` using `myUnfoldr`. A hint – we used unfoldr to produce the same results as `iterate` earlier. Do this with different functions and see if you can abstract the structure out.
[Here](./iterate.hs) is the code.

## Finally something other than a list
> Given the `BinaryTree` from last chapter, complete the following exercises. Here’s that datatype again:
> ```haskell
> data BinaryTree a = 
>     Leaf
>   | Node (BinaryTree a) a (BinaryTree a)
>   deriving (Eq, Ord, Show)
1. > Write `unfold` for `BinaryTree`.
   > ```haskell
   > unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
   > unfold = undefined
   > ```
2. > Make a tree builder.
   > Using the unfold function you’ve just made for BinaryTree, write the following function:
   > ```haskell
   > treeBuild :: Integer -> BinaryTree Integer
   > treeBuild n = undefined
   > ```
[Here](./tree.hs) is the code.