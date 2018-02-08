# Chapter 8. Recursion

## Review of types
1. > What is the type of `[[True, False], [True, True], [False, True]]`?
   > 
   > a) `Bool`
   > 
   > b) mostly `True` 
   >
   > c) `[a]`
   >
   > d) `[[Bool]]`

   The answer is d.
2. > Which of the following has the same type as `[[True, False], [True, True], [False, True]]`?
   >
   > a) `[(True, False), (True, True), (False, True)]` 
   >
   > b) `[[3 == 3], [6 > 5], [3 < 4]]`
   >
   > c) `[3 == 3, 6 > 5, 3 < 4]`
   >
   > d) `["Bool", "more Bool", "Booly Bool!"]`

   The answer is b.
3. > For the following function
   > ```haskell
   > func :: [a] -> [a] -> [a] 
   > func x y = x ++ y
   > ```
   > which of the following is true?
   >
   > a) `x` and `y` must be of the same type
   >
   > b) `x` and `y` must both be lists
   >
   > c) if `x` is a `String` then `y` must be a `String` 
   >
   > d) all of the above

   The answer is d.
4. > For the `func` code above, which is a valid application of `func` to both of its arguments?
   >
   > a) `func "Hello World"`
   >
   > b) `func "Hello" "World"`
   >
   > c) `func [1, 2, 3] "a, b, c" `
   >
   > d) `func ["Hello", "World"]`

   The answer is b.

## Review currying
1. > Given the following definitions, tell us what value results from further applications.
   > ```haskell
   > cattyConny :: String -> String -> String
   > cattyConny x y = x ++ " mrow " ++ y
   > 
   > -- fill in the types
   > 
   > flippy = flip cattyConny
   > appedCatty = cattyConny "woops"
   > frappe = flippy "haha"
   > ```
   > 1. What is the value of `appedCatty "woohoo!"` ? Try to determine
   > the answer for yourself, then test in the REPL.
   > 2. `frappe "1"`
   > 3. `frappe (appedCatty "2")`
   > 4. `appedCatty (frappe "blue")`
   > 5. `cattyConny (frappe "pink") (cattyConny "green" (appedCatty "blue"))`
   > 6. `cattyConny (flippy "Pugs" "are") "awesome"`

   [Here](./curring.hs) are the definitions and applications.

   Here are the values.
   ```haskell
   "woops mrow woohoo!"
   "1 mrow haha"
   "woops mrow 2 mrow haha"
   "woops mrow blue mrow haha"
   "pink mrow haha mrow green mrow woops mrow blue"
   "are mrow Pugs mrow awesome"
   ```

## Recursion
1. > Write out the steps for reducing `dividedBy 15 2` to its final answer according to the Haskell code.

   No answer for this, take a look at page 285.
2. > Write a function that recursively sums all numbers from 1 to n, n being the argument. So that if n was 5, you’d add 1 + 2 + 3 + 4+ 5 to get 15. The type should be `(Eq a, Num a) => a -> a`.
3. > Write a function that multiplies two integral numbers using recursive summation. The type should be `(Integral a) => a -> a -> a`.

   [Here](./recursion.hs) is the answer to the question 2 & 3. Type `(Eq a, Num a) => a -> a` may not be enough for a total function for the question 2.

## Fixing dividedBy
> Our dividedBy function wasn’t quite ideal. For one thing. It was a partial function and doesn’t return a result (bottom) when given a divisor that is 0 or less.
> Using the pre-existing `div` function we can see how negative numbers should be handled.
> Consider using the following datatype to handle zero.
> ```haskell
> data DividedResult =
>     Result Integer
>   | DividedByZero
> ```

[Here](./dividedBy.hs) is the code.

## McCarthy 91 function
> The McCarthy 91 function yields $x - 10$ when 𝑥 > 100 and 91 otherwise. The function is recursive.
> <a href="https://www.codecogs.com/eqnedit.php?latex=MC(n)=&space;\left\{\begin{matrix}&space;n-10&\textrm{if}~n&space;>&space;100\\&space;MC(MC(n&plus;11))&\textrm{if}~n\leq100\\&space;\end{matrix}\right." target="_blank"><img src="https://latex.codecogs.com/gif.latex?MC(n)=&space;\left\{\begin{matrix}&space;n-10&\textrm{if}~n&space;>&space;100\\&space;MC(MC(n&plus;11))&\textrm{if}~n\leq100\\&space;\end{matrix}\right." title="MC(n)= \left\{\begin{matrix} n-10&\textrm{if}~n > 100\\ MC(MC(n+11))&\textrm{if}~n\leq100\\ \end{matrix}\right." /></a>
> ```haskell
> mc91 = undefined
> ```
> ```haskell
> Prelude> map mc91 [95..110]
> [91,91,91,91,91,91,91,92,93,94,95,96,97,98,99,100]
> ```
[Here](./mc91.hs) is the code.

## Numbers into words
> ```haskell
> module WordNumber where
> 
> import Data.List (intersperse)
> 
> digitToWord :: Int -> String 
> digitToWord n = undefined
> 
> digits :: Int -> [Int] 
> digits n = undefined
> 
> wordNumber :: Int -> String 
> wordNumber n = undefined
> ```
> Fill in the implementations of the functions above so that `wordNumber` returns the English word version of the Int value.
> Here is what your output should look in the REPL when it’s working:
> ```haskell
> Prelude> wordNumber 12324546
> "one-two-three-two-four-five-four-six"
> Prelude>
> ```
[Here](./wordNumber.hs) is the code.
