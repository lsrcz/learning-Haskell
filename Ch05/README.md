# Chapter 5. Types

## Multiple choice
1. > A value of type `[a]` is
   >
   > a) a list of alphabetic characters
   >
   > b) a list of lists
   >
   > c) a list whose elements are all of some type a
   >
   > d) a list whose elements are all of different types

   Answer: c.
2. > A function of type `[[a]] -> [a]`could
   >
   > a) take a list of strings as an argument
   >
   > b) transform a character into a string
   >
   > c) transform a string in to a list of strings
   >
   > d) take two arguments

   Answer: a.
3. > A function of type `[a] -> Int -> a`
   >
   > a) takes one argument
   >
   > b) returns one element of type a from a list
   >
   > c) must return an Int value
   >
   > d) is completely fictional
   Answer: a(Currying), b(can but not have to).
4. > A function of type (a, b) -> a
   > 
   > a) takes a list argument and returns a Char value
   >
   > b) has zero arguments
   >
   > c) takes a tuple argument and returns the first value
   >
   > d) requires that a and b be of different types
   Answer: c(can but not have to).
## Determine the type
> For the following functions, determine the type of the specified value.
1. > All function applications return a value. Determine the value returned by these function applications and the type of that value.
   >
   > 1. `(* 9) 6`
   >
   > 2. `head [(0,"doge"),(1,"kitteh")]`
   >
   > 3. `head [(0 :: Integer ,"doge"),(1,"kitteh")]`
   >
   > 4. `if False then True else False`
   >
   > 5. `length [1, 2, 3, 4, 5]`
   > 
   > 6. `(length [1, 2, 3, 4]) > (length "TACOCAT")`
   1. `(* 9) 6 :: Num a => a`
   2. `head [(0,"doge"),(1,"kitteh")] :: (Num a) => (a, [Char])`
   3. `head [(0 :: Integer ,"doge"),(1,"kitteh")] :: (Integer, [Char])`
   4. `if False then True else False :: Bool`
   5. `length [1, 2, 3, 4, 5] :: Int`
   6. `(length [1, 2, 3, 4]) > (length "TACOCAT") :: Bool`
2. > Given
   > ```haskell
   > x = 5
   > y = x + 5
   > w = y * 10
   > ```
   > What is the type of w?
   The type of w is `Num a => a`.
3. > Given
   > ```haskell
   > x = 5
   > y = x + 5
   > z y = y * 10
   > ```
   > What is the type of z?
   The type of z is `Num a => a -> a`.
4. > Given
   > ```haskell
   > x = 5
   > y = x + 5
   > f = 4 / y
   > ```
   > What is the type of f?
   The type of f is `Fractional a => a`.
5. > Given
   > ```haskell
   > x = "Julie"
   > y = " <3 "
   > z = "Haskell"
   > f = x ++ y ++ z
   > ```
   What is the type of f?
   The type of f is `[Char]`.
## Does it compile?
> For each set of expressions, figure out which expression, if any, causes the compiler to squawk (n.b. we do not mean literal squawking) at you and why. Fix it if you can.
1. Expression:
   > ```haskell
   > bigNum = (^) 5 $ 10
   > wahoo = bigNum $ 10
   > ```
   The code won't compile. The type of `bigNum` is `Num a => a` which is not an function.
   
   Fix:
   ```haskell
   bigNum = (^) 5
   wahoo = bigNum $ 10
   ```
   or
   ```haskell
   bigNum = (^) 5 $ 10
   wahoo = bigNum
   ```
2. Expression:
   > ```haskell
   > x = print
   > y = print "woohoo!"
   > z = x "hello world"
   > ```
   It compiles.
3. Expression:
   > ```haskell
   > a = (+)
   > b=5
   > c = b 10
   > d = c 200
   > ```
   The code won't compile, can't apply `b` to `10`.
4. Expression:
   > ```haskell
   > a = 12 + b
   > b = 10000 * c
   > ```
   The code won't compile, `c` isn't declared.
## Type variable or specific type constructor
1. > You will be shown a type declaration, and you should categorize each type. The choices are a fully polymorphic type variable, constrained polymorphic type variable, or concrete type con- structor.
   > ```haskell
   > f :: Num a => a -> b -> Int -> Int
   > --           [0]  [1]   [2]    [3]
   > ```
   > Here, the answer would be: constrained polymorphic (Num) ([0]), fully polymorphic ([1]), and concrete ([2] and [3]).
2. > Categorize each component of the type signature as described in the previous example.
   > ```haskell
   > f :: zed -> Zed -> Blah
   > ```
   Answer: Fully polymorphic, concrete, concrete.
3. > Categorize each component of the type signature.
   > ```haskell
   > f :: Enum b => a -> b -> C
   > ```
   Answer: Fully polymorphic, constrained polymorphic (Enum), concrete.
4. > Categorize each component of the type signature.
   > ```haskell
   > f :: f -> g -> C
   > ```
   Answer: Fully polymorphic, Fully polymorphic, concrete.
## Write a type signature
> For the following expressions, please add a type signature.
1. Expression:
   > ```haskell
   > functionH ::
   > functionH (x:_) = x
   > ```
   ```
   functionH :: [a] -> a
   functionH (x:_) = x
   ```
2. Expression:
   > ```haskell
   > functionC ::
   > functionC x y = if (x > y) then True else False
   > ```
   ```haskell
   functionC :: Ord a => a -> a -> Bool
   functionC x y = if (x > y) then True else False
   ```
3. Expression:
   > ```haskell
   > functionS ::
   > functionS (x, y) = y
   > ```
   ```haskell
   functionS :: (a, b) -> b
   functionS (x, y) = y
   ```
## Given a type, write the function
> Use the information the type provides to determine what the function should do. (Syntactically different but semantically equivalent imple- mentations are not counted as being different).
1. > There is only one implementation that typechecks.
   > ```haskell
   > i :: a -> a
   > i = undefined
   > ```
   ```haskell
   i :: a -> a
   i x = x
   ```
2. > There is only one version that works.
   > ```haskell
   > c :: a -> b -> a
   > c = undefined
   > ```
   ```haskell
   c :: a -> b -> a
   c x y = x
   ```
3. > Given alpha equivalence are c” and c (see above) the same thing?
   > ```haskell
   > c'' :: b -> a -> b
   > c'' = ?
   > ```
   They are the same thing.
4. > Only one version that works.
   > ```haskell
   > c' :: a -> b -> b
   > c' = undefined
   > ```
   ```haskell
   c' :: a -> b -> b
   c' x y = y
   ```
5. > There are multiple possibilities, at least two of which you’ve seen in previous chapters.
   > ```haskell
   > r :: [a] -> [a]
   > r = undefined
   > ```
   ```haskell
   r1 = tail
   r2 = take 4
   ```
6. > Only one version that will typecheck.
   > ```haskell
   > co :: (b -> c) -> (a -> b) -> (a -> c) 
   > co = undefined
   > ```
   ```haskell
   co :: (b -> c) -> (a -> b) -> (a -> c)
   co f g x = f $ g x
   ```
7. > One version will typecheck.
   > ```haskell
   > a :: (a -> c) -> a -> a 
   > a = undefined
   > ```
   ```haskell
   a :: (a -> c) -> a -> a 
   a f x = x
   ```
8. > One version will typecheck.
   > ```haskell
   > a' :: (a -> b) -> a -> b
   > a' = undefined
   > ```
   ```haskell
   a' :: (a -> b) -> a -> b
   a' f x = f x
   ```
## Fix it.
> Be sure to check carefully for things like capitalization, parentheses, and indentation.
1. Expression:
   > ```haskell
   > module sing where
   > 
   > fstString :: [Char] ++ [Char]
   > fstString x = x ++ " in the rain"
   > 
   > sndString :: [Char] -> Char
   > sndString x = x ++ " over the rainbow"
   > 
   > sing = if (x > y) then fstString x or sndString y
   > where x = "Singin"
   >       x = "Somewhere"
   > ```
   [Here](./fix-1.hs) is the code.
2. > Now that it’s fixed, make a minor change and make it sing the other song. If you’re lucky, you’ll end up with both songs stuck in your head!

   An interesting question. :)
3. Expression:
   > ```haskell
   > -- arith3broken.hs
   > module Arith3Broken where
   >
   > main :: IO ()
   > Main = do
   >   print 1 + 2
   >   putStrLn 10
   >   print (negate -1)
   >   print ((+) 0 blah)
   >   where blah = negate 1
   > ```
   [Here](./fix-3.hs) is the code.
## Type-Kwon-Do
> You’ll use only the declarations provided and what the Prelude provides by default unless otherwise specified. Your goal is to make the ???’d declaration pass the typechecker by modifying it alone.
1. Expression:
   > ```haskell
   > f :: Int -> String 
   > f = undefined
   > 
   > g :: String -> Char 
   > g = undefined
   > 
   > h :: Int -> Char
   > h = ???
   > ```
   [Here](./tkd-1.hs) is the code.
2. Expression:
   > ```haskell
   > data A
   > data B
   > data C
   > 
   > q :: A -> B
   > q = undefined
   > 
   > w :: B -> C
   > w = undefined
   > 
   > e :: A -> C
   > e = ???
   > ```
   [Here](./tkd-2.hs) is the code.
3. Expression:
   > ```haskell
   > data X
   > data Y
   > data Z
   > 
   > xz :: X -> Z
   > xz = undefined
   > 
   > yz :: Y -> Z
   > yz = undefined
   > 
   > xform :: (X, Y) -> (Z, Z)
   > xform = ???
   > ```
   [Here](./tkd-3.hs) is the code.
4. Expression:
   > ```haskell
   > munge :: (x -> y) -> (y -> (w, z)) -> x -> w
   > munge = ???
   > ```
   [Here](./tkd-4.hs) is the code.