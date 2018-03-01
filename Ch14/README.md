# Chapter 14. Testing

## Intermission: Short Exercise
> Write a function that multiplies two numbers using recursive summation. The type should be `(Eq a, Num a) => a -> a -> a` although, depending on how you do it, you might also consider adding an Ord constraint.
>
> If you still have your answer, great! If not, rewrite it and then write Hspec tests for it.

[Here](./sumfromone/) is the code.

## Chapter Exercises
### Validating numbers into words
> Remember the “numbers into words” exercise in Recursion? You’ll be writing tests to validate the functions you wrote.
> ```haskell
> module WordNumberTest where
> 
> import Test.Hspec
> import WordNumber (digitToWord, digits, wordNumber)
> 
> main :: IO () 
> main = hspec $ do
>   describe "digitToWord does what we want" $ do
>     it "returns zero for 0" $ do
>       digitToWord 0 `shouldBe` "zero"
>     it "returns one for 1" $ do
>       print "???"
>   describe "digits does what we want" $ do
>     it "returns [1] for 1" $ do
>       digits 1 `shouldBe` [1]
>     it "returns [1, 0, 0] for 100" $ do
>       print "???"
>   describe "wordNumber does what we want" $ do 
>     it "returns one-zero-zero for 100" $ do
>       wordNumber 100 `shouldBe` "one-zero-zero" 
>     it "returns nine-zero-zero-one for 9001" $ do
>       print "???"
> ```
> Fill in the test cases that print question marks. If you think of additional tests you could perform, add them.

[Here](./wordnumber/) is the code.

### Using QuickCheck
> Test some simple arithmetic properties using QuickCheck.
1. > ```haskell
   > -- for a function
   > half x = x / 2
   > 
   > -- this property should hold
   > halfIdentity = (*2) . half
   > ```
   [Here](./quickcheck/1.hs) is the code.
2. > ```haskell
   > import Data.List (sort)
   > 
   > -- for any list you apply sort to
   > -- this property should hold
   > listOrdered :: (Ord a) => [a] -> Bool
   > listOrdered xs = snd $ foldr go (Nothing, True) xs
   >   where go _ status@(_, False) = status
   >         go y (Nothing, t) = (Just y, t)
   >         go y (Just x, t) = (Just y, x >= y)
   > ```
   [Here](./quickcheck/2.hs) is the code.
3. > Now we’ll test the associative and commutative properties of addition:
   > ```haskell
   > plusAssociative x y z =
   >   x + (y + z) == (x + y) + z
   > plusCommutative x y = 
   >   x + y == y + x
   > ```
   [Here](./quickcheck/3.hs) is the code.
4. > Now do the same for multiplication.

   [Here](./quickcheck/4.hs) is the code.
5. > We mentioned in one of the first chapters that there are some laws involving the relationship of `quot` and `rem` and `div` and `mod`. Write QuickCheck tests to prove them.

   [Here](./quickcheck/5.hs) is the code.
6. > Is (^) associative? Is it commutative? Use QuickCheck to see if the computer can contradict such an assertion.

    (^) is neither associative nor commutative. [Here](./quickcheck/6.hs) is the code.
7. > Test that reversing a list twice is the same as the identity of the list:
   > ```haskell
   > reverse . reverse == id
   > ```
   [Here](./quickcheck/7.hs) is the code.
8. > Write a property for the definition of ($).
   > ```haskell
   > f $ a = f a
   > f . g = \x -> f (g x)
   > ```
   ```haskell
   prop_applyComp :: (Eq b) => (a -> b) -> (c -> a) -> c -> Bool
   prop_applyComp f g x = (f . g) x == (f $ g x)
   ```
   [Here](./quickcheck/8.hs) is the code.
9. > See if these twoo functions are equal:
   > ```haskell
   > foldr (:) == (++)
   >
   > foldr (++) [] == concat
   > ```
   The first two functions are not equal while the second two functions are equal. [Here](./quickcheck/9.hs) is the code.
10. > Hm. Is that so?
    > ```haskell
    > f n xs = length (take n xs) == n
    > ```
    [Here](./quickcheck/10.hs) is the code.
11. > Finally, this is a fun one. You may remember we had you compose `read` and `show` one time to complete a “round trip.” Well, now you can test that it works:
    > ```haskell
    > f x = (read (show x)) == x
    > ```
    [Here](./quickcheck/11.hs) is the code.