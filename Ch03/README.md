# Chapter 3. Strings

## Reading syntax
1. > For the following lines of code, read the syntax carefully and decide if they are written correctly. 
   > 1. `concat [[1, 2, 3], [4, 5, 6]]`
   > 2. `++ [1, 2, 3] [4, 5, 6]`
   > 3. `(++) "hello" " world"`
   > 4. `["hello" ++ " world]`
   > 5. `4 !! "hello"`
   > 6. `(!!) "hello" 4`
   > 7. `take "4 lovely"`
   > 8. `take "4 lovely"`

   1. Works, the output is `[1,2,3,4,5,6]`.
   2. Doesn't work, since `++` is an infix operator.
   3. Works, the output is `"hello world"`.
   4. It may be a typo, `["hello" ++ " world"]` works, and the output is `["hello world"]`.
   5. Doesn't work, `"hello" !! 4` works.
   6. Works, the output is `'o'`.
   7. Doesn't work.
   8. Works, the output is `"awe"`.

2. > Next we have two sets: the first set is lines of code and the other is a set of results. Read the code and figure out which results came from which lines of code.
   > 1. `concat [[1 * 6], [2 * 6], [3 * 6]]`
   > 2. `"rain" ++ drop 2 "elbow"`
   > 3. `10 * head [1, 2, 3]`
   > 4. `(take 3 "Julie") ++ (tail "yes")`
   > 5. `concat [tail [1, 2, 3], tail [4, 5, 6], tail [7, 8, 9]]`
   > 
   > Can you match each of the previous expressions to one of these results presented in a scrambled order?
   > 1. `"Jules"`
   > 2. `[2,3,5,6,8,9]`
   > 3. `"rainbow"`
   > 4. `[6,12,18]`
   > 5. `10`

   The answers of the expressions are 1(4), 2(3), 3(5), 4(1), 5(2).

## Building functions
1. > Given the list-manipulation functions mentioned in this chapter, write functions that take the following inputs and return the expected outputs. Do them directly in your REPL and use the take and drop functions you’ve already seen.
   > Example
   > ```haskell
   > -- If you apply your function to this value:
   > "Hello World"
   > -- Your function should return:
   > "ello World"
   > ```
   > The following would be a fine solution:
   > ```haskell
   > Prelude> drop 1 "Hello World"
   > "ello World"
   > ```
   > Now write expressions to perform the following transformations, just with the functions you’ve seen in this chapter. You do not need to do anything clever here.
   >
   > 1. 
   > ```haskell
   > -- Given
   > "Curry is awesome" 
   > -- Return
   > "Curry is awesome!"
   > ```
   > 2. 
   > ```haskell
   > -- Given
   > "Curry is awesome" 
   > -- Return
   > "y"
   > ```
   > 3.
   > ```haskell
   > -- Given
   > "Curry is awesome" 
   > -- Return
   > "awesome!"

   1. 
   ```haskell
   ghci> "Curry is awesome" ++ "!"
   "Curry is awesome!"
   ```
   2.
   ```haskell
   ghci> "Curry is awesome!" !! 4
   'y'
   ```
   3.
   ```haskell
   ghci> drop 9 "Curry is awesome"
   "awesome"
   ```
2. > Now take each of the above and rewrite it in a source file as a general function that could take different string inputs as ar- guments but retain the same behavior.

   [Here](./build-func-2.hs) is the code, test it on your computer!

3. > Write a function of type `String -> Char` which returns the third character in a String. Be sure to fill in the type signature and fill in the function definition after the equals sign.
   ```haskell
   thirdLetter :: String -> Char
   thirdLetter x = x !! 2
   ```

4. > Change that function so the string input is always the same and the variable represents the number of the letter you want to return.
   ```haskell
   letterIndex :: Int -> Char
   letterIndex x = "Curry is awesome" !! x
   ```

5. > Using the `take` and `drop` functions we looked at above, see if you can write a function called `rvrs`. `rvrs` should take the string "Curry is awesome" and return the result "awesome is Curry".
   ```haskell
   rvrs :: String -> String
   rvrs x = drop 9 x ++ take 4 (drop 5 x) ++ take 5 x
   ```

6. > Let’s see if we can expand that function into a module.
   > There are different ways you could lay it out, but for the sake of convenience, we’ll show you a sample layout so that you can fill in the blanks:
   > ```haskell
   > module Reverse where
   > 
   > rvrs :: String -> String
   > rvrs x = 
   > 
   > main :: IO()
   > main :: print ()

   [Here](./build-func-6.hs) is the code.