# Chapter 4. Basic datatypes

> You will need to have the awesome, alsoAwesome, and allAwesome code from above in scope for this REPL session.
> ```haskell
> awesome = ["Papuchon", "curry", ":)"]
> alsoAwesome = ["Quake", "The Simons"] 
> allAwesome = [awesome, alsoAwesome]
> ```
> `length` is a function that takes a list and returns a result that tells how many items are in the list.

1. > Given the definition of `length` above, what would the type signa- ture be? How many arguments, of what type does it take? What is the type of the result it evaluates to?

   The type signature of `length` is `[a] -> Int`, It takes a Foldable argument and evaluates to an `Int`.
2. > What are the results of the following expressions? 
   > 1. `length [1, 2, 3, 4, 5]`
   > 2. `length [(1, 2), (2, 3), (3, 4)]`
   > 3. `length allAwesome`
   > 4.  `length (concat allAwesome)`
   The results are
   1. 5
   2. 3
   3. 2
   4. 5
3. > Given what we know about numeric types and the type signature of `length`, look at these two expressions. One works and one returns an error. Determine which will return an error and why.
   > ```haskell
   > Prelude> 6 / 3
   > -- and
   > Prelude> 6 / length [1, 2, 3]
   > ```
   The first works. The second fails because `length` evaluates to an `Int`,which is not a member of `Fraction` type class.
4. > How can you fix the broken code from the preceding exercise using a different division function/operator?
   ```haskell
   ghci> 6 `div` (length [1,2,3])
   2
   ```
5. > What is the type of the expression `2 + 3 == 5`? What would we expect as a result.

   The type of the expression is `Bool`, the result is `True`.

6. > What is the type and expected result value of the following:
   > ```haskell
   > Prelude> let x = 5
   > Prelude> x + 3 == 5
   > ```
   The type of the expressions is `Bool` and the result is `False`.

7. > Below are some bits of code. Which will work? Why or why not? If they will work, what value would these reduce to?
   > ```haskell
   > Prelude> length allAwesome == 2
   > Prelude> length [1, 'a', 3, 'b']
   > Prelude> length allAwesome + length awesome
   > Prelude> (8 == 8) && ('b' < 'a')
   > Prelude> (8 == 8) && 9
   > ```
   The first reduce to True.
   The second won't work since `1` and `'a'` have different types.
   The third reduce to 5.
   The fourth reduce to False. `(8 == 8)` reduce to `True` while `('b' < 'a')` reduce to `False`.
   The fifth won't work sine `(8 == 8)` has the type `Bool` while `9` has the type `Num`.

8. > Write a function that tells you whether or not a given String (or list) is a palindrome. Here you’ll want to use a function called ’reverse,’ a predefined function that does just what it sounds like.
   > ```haskell
   > reverse :: [a] -> [a]
   > reverse "blah"
   > "halb"
   > isPalindrome :: (Eq a) => [a] -> Bool 
   > isPalindrome x = undefined
   > ```
   ```haskell
   isPalindrome :: (Eq a) => [a] -> Bool 
   isPalindrome x = reverse x == x
   ```

9. > Write a function to return the absolute value of a number using if-then-else
   > ```haskell
   > myAbs :: Integer -> Integer
   > myAbs = undefined
   > ```
   ```haskell
   myAbs :: Integer -> Integer
   myAbs x = if x > 0 then x else (-x)
   ```

10. > Fill in the definition of the following function, using `fst` and `snd`:
    > ```haskell
    > f :: (a, b) -> (c, d) -> ((b, d), (a, c)) 
    > f = undefined
    > ```
    ```haskell
    f :: (a, b) -> (c, d) -> ((b, d), (a, c))
    f x y = ((snd x, snd y), (fst x, fst y))
    ```

## Reading syntax
> In the following examples, you’ll be shown syntactically incorrect code. Type it in and try to correct it in your text editor, validating it with GHC or GHCi.
1. > Here, we want a function that adds 1 to the length of a string argument and returns that result.
   > ```haskell
   > x = (+)
   > F xs = w 'x' 1
   >      where w = length xs
   > ```
   ```haskell
   plus = (+)
   f xs = plus w 1
        where w = length xs
   ```
2. > This is supposed to be the identity function, `id`.
   > ```haskell
   > \ X = x
   > ```
   ```haskell
   \x = x
   ```
3. > When fixed, this function will return `1` from the value `[1, 2, 3]`.
   > ```haskell
   > \x : xs -> x
   > ```
   ```haskell
   \(x : xs) -> x
   ```
4. > When fixed, this function will return `1` from the value `(1, 2)`.
   > ```haskell
   > f (a b) = A
   > ```
   ```haskell
   f (a, b) = a
   ```

## Match the function names to their types.
1. > Which of the following types is the type of show?
   > 1. `show a => a -> String`
   > 2. `Show a -> a -> String`
   > 3. `Show a => a -> String`

   The answer is 3.
2. > Which of the following types is the type of (==)?
   > 1. `a -> a -> Bool`
   > 2. `Eq a => a -> a -> Bool`
   > 3. `Eq a -> a -> a -> Bool` 
   > 4. `Eq a => A -> Bool`

   The answer is 2.
3. > Which of the following types is the type of fst?
   > 1. `(a, b) -> a`
   > 2. `b -> a`
   > 3. `(a, b) -> b`

   The answer is 1.
4. > Which of the following types is the type of (+)?
   > 1. `Num a -> a -> a -> Bool`
   > 2. `Num a => a -> a -> Bool `
   > 3. `num a => a -> a -> a`
   > 4. `Num a => a -> a -> a`
   > 5. `a -> a -> a`

   The answer is 4.