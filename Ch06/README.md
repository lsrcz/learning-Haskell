# Chapter 6. Typeclasses

## Multiple choice
1. > The Eq class
   >
   > a) includes all types in Haskell 
   >
   > b) is the same as the Ord class 
   >
   > c) makes equality tests possible 
   >
   > d) only includes numeric types
   
   Answer: c.
2. > The typeclass Ord
   >
   > a) allows any two values to be compared 
   >
   > b) is a subclass of Eq
   >
   > c) is a superclass of Eq
   >
   > d) has no instance for Bool

   Answer: a(total order), b.
3. > Suppose the typeclass Ord has an operator >. What is the type of >?
   >
   > a) `Ord a => a -> a -> Bool` 
   >
   > b) `Ord a => Int -> Bool`
   >
   > c) `Ord a => a -> Char`
   >
   > d) `Ord a => Char -> [Char]`

   Answer: a.
4. > In `x = divMod 16 12`
   > 
   > a) the type of x is Integer
   > 
   > b) the value of x is undecidable 
   > 
   > c) the type of x is a tuple
   > 
   > d) x is equal to `12 / 16`

   Answer: c.
5. > The typeclass Integral includes
   > 
   > a) Int and Integer numbers
   > 
   > b) integral, real, and fractional numbers 
   > 
   > c) Schrodinger’s cat
   > 
   > d) only positive numbers

   Answer: a.
## Does it typecheck?
> Examine the following code and decide whether it will typecheck. If you can, fix the error and re-run the code.
1. > Does the following code typecheck? If not, why not?
   > ```haskell
   > data Person = Person Bool 
   >
   > printPerson :: Person -> IO ()
   > printPerson person = putStrLn (show person)
   > ```
   
   `printPerson` won't work because `Person` has no instance of Show.
2. > Does the following typecheck? If not, why not?
   > ```haskell
   > data Mood = Blah
   >           | Woot deriving Show
   > settleDown x = if x == Woot 
   >                  then Blah
   >                  else x
   > ```

   `settleDown` won't work because `Mood` has no instance of Eq.
4. > If you were able to get settleDown to typecheck:
   >
   > a) What values are acceptable inputs to that function?
   >
   > b) What will happen if you try to run settleDown 9? Why? 
   >
   > c) What will happen if you try to run Blah > Woot? Why?

   Change the declaration of Mood to
   ```haskell
   data Mood = Blah | Woot deriving (Show, Eq)
   ```
   `Woot` and `Blah` are acceptable, `settleDown 9` won't type check since `Mood` has no instance of Num so the literal `9` can't have the type `Mood`. Running `Blah > Woot` will cause an type error, since `Mood` has no instance of Ord.
4. > Does the following typecheck? If not, why not?
   > ```haskell
   > type Subject = String
   > type Verb = String
   > type Object = String
   > 
   > data Sentence =
   >   Sentence Subject Verb Object
   >   deriving (Eq, Show)
   > 
   > s1 = Sentence "dogs" "drool"
   > s2 = Sentence "Julie" "loves" "dogs"
   > ```

   It typechecks and the type of `s1` is `Object -> Sentence` and the typeof `s2` is `Sentence`.

## Given a datatype declaration, what can we do?
> Given the following datatype definitions:
> ```haskell
> data Rocks =
>   Rocks String deriving (Eq, Show)
> 
> data Yeah =
>   Yeah Bool deriving (Eq, Show)
> 
> data Papu =
>   Papu Rocks Yeah deriving (Eq, Show)
> ```
> Which of the following will typecheck? For the ones that don’t typecheck, why don’t they?
1. Expression:
   > ```haskell
   > phew = Papu "chases" True
   > ```

   It doesn't typecheck, `"chases"` doesn't have the type `Rocks` and `True` doesn't have the type `Yeah`.
2. Expression:
   > ```haskell
   > truth = Papu (Rocks "chomskydoz")
   >              (Yeah True)
   > ```

   It typechecks.
3. Expression:
   > ```haskell
   > equalityForall :: Papu -> Papu -> Bool
   > equalityForall p p' = p == p'
   > ```

   It typechecks because type `Papu` has an instance of Eq.
4. Expression:
   > ```haskell
   > comparePapus :: Papu -> Papu -> Bool
   > comparePapus p p' = p > p'
   > ```

   It doesn't typecheck because type `Papu` has no instance of Ord.
## Match the types
> We’re going to give you two types and their implementations. Then we’re going to ask you if you can substitute the second type for the first.
1. > For the following definition.
   >
   > a) 
   > ```haskell
   > i :: Num a => a
   > i = 1
   > ```
   > b) Try replacing the type signature with the following:
   > ```haskell
   > i :: a
   > ```
   It fails, since the type variable `a` doesn't has an instance of `Num` so it can't hold the value of the literal `1`.
2. > a)
   > ```haskell
   > f :: Float
   > f = 1.0
   > ```
   > b)
   > ```haskell
   > f :: Num a => a
   > ```
   It fails, since the type `Num a => a` doesn't imply `Fractional a`.
3. > a)
   > ```haskell
   > f :: Float
   > f = 1.0
   > ```
   > b)
   > ```haskell
   > f :: Fractional a => a
   > ```
   It typechecks.
4. > Hint for the following: type :info RealFrac in your REPL.
   > a)
   > ```haskell
   > f :: Float
   > f = 1.0
   > ```
   > b)
   > ```haskell
   > f :: RealFrac a => a
   > ```
   It typechecks, since `RealFrac a` implies `Fractional a`.
5. > a)
   > ```haskell
   > freud :: a->a
   > freud x = x
   > ```
   > b)
   > ```haskell
   > freud :: Ord a => a -> a
   > ```
   It typechecks.
6. > a)
   > ```haskell
   > freud' :: a->a
   > freud' x = x
   > ```
   > b)
   > ```haskell
   > freud' :: Int -> Int
   > ```
   It typechecks.
7. > a)
   > ```haskell
   > myX = 1 :: Int
   > 
   > sigmund :: Int -> Int
   > sigmund x = myX
   > ```
   > b)
   > ```haskell
   > sigmund :: a -> a
   > ```
   It fails, since the type variable `a` doesn't imply an `Int`.
8. > a)
   > ```haskell
   > myX = 1 :: Int
   > 
   > sigmund' :: Int -> Int
   > sigmund' x = myX
   > ```
   > b)
   > ```haskell
   > sigmund' :: Num a => a -> a
   > ```
   It fails, since the type `Num a` doesn't imply an `Int`.
9. > a) You'll need to import `sort` from `Data.List`
   > ```haskell
   > jung :: Ord a => [a] -> a
   > jung xs = head (sort xs)
   > ```
   > b)
   > ```haskell
   > jung :: [Int] -> Int
   > ```
   It typechecks.
10. > a)
    > ```haskell
    > young :: [Char] -> Char
    > young xs = head (sort xs)
    > ```
    > b)
    > ```haskell
    > young :: Ord a => [a] -> a
    > ```
    It typechecks.
11. > a)
    > ```haskell
    > mySort :: [Char] -> [Char]
    > mySort = sort
    >
    > signifier :: [Char] -> Char
    > signifier xs = head (mySort xs)
    > ```
    > b) 
    > ```haskell
    > signifier :: Ord a => [a] -> a
    > ```
    It fails, since `Ord a` doesn't imply that a is `Char`.
## Type-Kwon-Do
> Same rules apply — you’re trying to fill in terms (code) which’ll fit the type.
1. > Expression
   > ```haskell
   > chk :: Eq b => (a -> b) -> a -> b -> Bool 
   > chk = ???
   > ```
   ```haskell
   chk :: Eq b => (a -> b) -> a -> b -> Bool 
   chk f a b = (f a) == b
   ```
2. > Expression
   > ```haskell
   > -- Hint: use some arithmetic operation to
   > -- combine values of type 'b'. Pick one.
   > arith :: Num b => (a -> b) -> Integer -> a -> b
   > arith = ???
   > ```
   ```haskell
   arith :: Num b => (a -> b) -> Integer -> a -> b
   arith f i a = (f a) + (fromInteger i)
   ```

   
