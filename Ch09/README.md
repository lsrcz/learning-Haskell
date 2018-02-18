# Chapter 9. Lists

## Data.Char
1. > Query the types of `isUpper` and `toUpper`
   ```haskell
   isUpper :: Char -> Bool
   toUpper :: Char -> Char
   ```
2. > Write a function that filters all the uppercase letters out of a String? Write that function such that, given the input "HbEfLrLxO," your function will return "HELLO."
3. > Write a function that will capitalize the first letter of a String and return the entire String. For example, if given the argument “julie,” it will return “Julie.”
4. > Now make a new version of that function that is recursive such that if you give it the input “woot” it will holler back at you “WOOT.” The type signature won’t change, but you will want to add a base case.
5. > Write a function that will capitalize the first letter of a String and return only that letter as the result.
6. > Rewrite it as a composed function. Then for fun, rewrite it pointfree.

[Here](./char.hs) is the code for question 2 - 6.

## Ciphers
> A Caesar cipher is a simple substitution cipher, in which each letter is replaced by the letter that is a fixed number of places down the alphabet from it. You will find variations on this all over the place — you can shift leftward or rightward, for any number of spaces. A rightward shift of 3 means that ’A’ will become ’D’ and ’B’ will become ’E,’ for example. If you did a leftward shift of 5, then ’a’ would become ’v’ and so forth.
>
> Your goal in this exercise is to write a basic Caesar cipher that shifts rightward. You can start by having the number of spaces to shift fixed, but it’s more challenging to write a cipher that allows you to vary the number of shifts so that you can encode your secret messages differently each time.
>
> You should include an `unCaesar` function that will decipher your text as well.

[Here](./cipher.hs) is the code. The implementation can handle left and right shift.

## Writing your own standard functions
> The goal here is to write your own versions of these to gain a deeper understanding of recursion over lists and how to make functions flexible enough to accept a variety of inputs.

The functions to write are 
```haskell
myOr :: [Bool] -> Bool
myAny :: (a -> Bool) -> [a] -> Bool
myElem :: Eq a => a -> [a] -> Bool
myReverse :: [a] -> [a]
-- squish flattens a list of lists into a list
squish :: [[a]] -> [a]
-- squishMap maps a function over a list and concatenates the results
squishMap :: (a -> [b]) -> [a] -> [b]
-- squishAgain flattens a list of lists into a list. This time re-use the squishMap function.
squishAgain :: [[a]] -> [a]
myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
-- Using the myMinimumBy and myMaximumBy functions, write your own versions of maximum and minimum.
myMaximum :: (Ord a) => [a] -> a
myMinimum :: (Ord a) => [a] -> a
```

[Here](./stdfunc.hs) is the code.