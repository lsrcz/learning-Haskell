# Chapter 7. More functional patterns

## Multiple choice
1. > A polymorphic function
   >
   > a) changes things into sheep when invoked 
   >
   > b) has multiple arguments
   >
   > c) has a concrete type
   >
   > d) may resolve to values of different types, depending on inputs

   Answer: d.
2. > Two functions named `f` and `g` have types `Char -> String` and `String -> [String]` respectively. The composed function `g . f` has the type
   >
   > a) `Char -> String`
   >
   > b) `Char -> [String]`
   >
   > c) `[[String]]`
   >
   > d) `Char -> String -> [String]`

   Answer: b.
3. > A function `f` has the type `Ord a => a -> a -> Bool` and we apply it to one numeric value. What is the type now?
   >
   > a) `Ord a => a -> Bool`
   >
   > b) `Num -> Num -> Bool`
   >
   > c) `Ord a => a -> a -> Integer`
   >
   > d) `(Ord a, Num a) => a -> Bool`

   Answer: d.
4. > A function with the type `(a -> b) -> c`
   >
   > a) requires values of three different types 
   >
   > b) is a higher-order function
   >
   > c) must take a tuple as its first argument 
   >
   > d) has its parameters in alphabetical order

   Answer: a.
5. > Given the following definition of `f`, what is the type of `f True`?
   > ```haskell
   > f :: a -> a
   > f x = x
   > ```
   > a) `f True :: Bool`
   > 
   > b) `f True :: String`
   > 
   > c) `f True :: Bool -> Bool`
   > 
   > d) `f True :: a`

   Answer: a.

## Let's write code
1. > The following function returns the tens digit of an integral argument.
   > ```haskell
   > tensDigit :: Integral a => a -> a 
   > tensDigit x = d
   >    where xLast = x `div` 10
   >          d     = xLast `mod` 10
   > ```
   > 1. First, rewrite it using `divMod`.
   > 2. Does the `divMod` version have the same type as the original version?
   > 3. Next, let’s change it so that we’re getting the hundreds digit instead. You could start it like this (though that may not be the only possibility):
   > ```haskell
   > hundD x = d2
   >     where d   = undefined
   >     ...
   > ```
   [Here](./tensDigit.hs) is the code. The `divMod` version has the same type as the original version.
2. > Implement the function of the type `a -> a -> Bool -> a` once each using a case expression and once with a guard.
   > Here is the pattern matching version to get you started:
   > ```haskell
   > foldBool3 :: a -> a -> Bool -> a
   > foldBool3 x y True  = x
   > foldBool3 x y False = y
   > ```
   [Here](./foldBool.hs) is the code.
3. > Fill in the definition.
   > ```haskell
   > g :: (a -> b) -> (a, c) -> (b, c)
   > g = undefined
   > ```
   Answer:
   ```haskell
   g :: (a -> b) -> (a, c) -> (b, c)
   g f (x, y) = (f x, y)
   ```
4. > Write the following code into a source file. Then load it and run it in GHCi to make sure you understand why the evaluation results in the answers you see. ([Here](./arith4.hs) is the code)
5. > Next, write a pointfree version of roundTrip.
   ```haskell
   roundTrip :: (Show a, Read a) => a -> a
   roundTrip = read . show
   ```
   [Here](./arith5.hs) is the code.
6. > Your task now is to change the type of `roundTrip` in `Arith4` to `(Show a, Read b) => a -> b`. How might we tell GHC wich instance of Read to dispatch against the String now?
   ```haskell
   roundTrip (4 :: Int) :: Integer
   roundTrip (4 :: Int) :: Float
   ```
   This works, and [Here](./arith6.hs) is the code.
