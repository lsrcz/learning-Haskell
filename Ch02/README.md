# Chapter 2. Hello, Haskell!

## Parenthesization
> Given what we know about the precedence of `(*)`, `(+)`, and `(^)`, how can we parenthesize the following expressions more explicitly without changing their results? Put together an answer you think is correct, then test in the GHCi REPL.
>
> Example:
> ```haskell
> -- We want too make this more explicit
> 2 + 2 * 3 - 3
> -- this will produce the same result
> 2 + (2 * 3) - 3
> ```
>
> Attempt the above on the following expressions.
> 1. `2 + 2 * 3 - 1`
> 2. `(^) 10 $ 1 + 1`
> 3. `2 ^ 2 * 4 ^ 5 + 1`
1. `2 + (2 * 3) - 1`
2. `((^) 10) $ (1 + 1)` or `(10^) $ (1 + 1)`
3. `((2 ^ 2) * (4 ^ 5)) + 1`

## Equivalent expressions
> Which of the following pairs of expressions will return the same result when evaluated? Try to reason them out in your head by reading the code and then enter them into the REPL to check your work:
> 1. `1 + 1`
>
>    `2`
> 2. `10 ^ 2`
>
>    `10 + 9 * 10`
> 3. `400 - 37`
>
>    `(-) 37 400`
> 4. `2 * 5 + 18`
>
>    `2 * (5 + 18)`
1. Same.
2. Same, both will be evaluated to 100.
3. Same, both will be evaluated to 363.
4. Not same, the first is equivalent to `(2 * 5) + 18` and is evaluated to 28, while the second is evaluated to 46.

## More fun with functions
> Look at this code and rewrite it such that it could be evaluated in the REPL.
> 
> ```haskell
> z = 7
> x = y ^ 2
> waxOn = x * 5
> y = z + 8
> ```
The declarations are evaluated one by one so they should be declared before use.
```haskell
ghci> let z = 7
ghci> let y = z + 8
ghci> let x = y ^ 2
ghci> let waxOn = x * 5
```
1. > Now you have a value called `waxOn` in your REPL. What do you think will happen if you enter:
   > 
   > ```haskell
   > 10 + waxOn
   > -- or
   > (+10) waxOn 
   > -- or
   > (-) 15 waxOn 
   > -- or
   > (-) waxOn 15
   > ```
   ```haskell
   ghci> 10 + waxOn
   1135
   ghci> (+10) waxOn
   1135
   ghci> (-) 15 waxOn
   -1110
   ghci> (-) waxOn 15
   1110
   ```
2. > Earlier we looked at a function called `triple`. While your REPL has `waxOn` in session, re-enter the `triple` function at the prompt:
   > ```haskell
   > let triple x = x * 3
   > ```
   ```haskell
   ghci> let triple x = x * 3
   ```
3. > Now, what will happen if we enter this at our GHCi prompt. Try to reason out what you think will happen first, considering what role `waxOn` is playing in this function call. Then enter it, see what does happen, and check your understanding:
   > ```haskell
   > triple waxOn
   > ```
   ```haskell
   ghci> triple waxOn
   3375
   ```
4. > Rewrite waxOn as a function with a where clause in your source file. Load it into your REPL and make sure it still works as expected!

   [Here](./waxOn-4.hs) is the code.

5. > Now to the same source file where you have `waxOn`, add the `triple` function. Remember: You don’t need `let` and the function name should be at the left margin (that is, not nested as one of the `waxOn` expressions). Make sure it works by loading it into your REPL and then entering `triple waxOn` again at the REPL prompt. You should have the same answer as you did above.

   [Here](./waxOn-5.hs) is the code.
   ```haskell
   ghci> triple waxOn
   3375
   ```

6. > Now, without changing what you’ve done so far in that file, add a new function called `waxOff` that looks like this:
   > ```haskell
   > waxOff x = triple x
   > ```

   [Here](./waxOn-6.hs) is the code.

7. > Load the source file into your REPL and enter `waxOff waxOn` at the prompt.

   ```haskell
   ghci> waxOff waxOn
   3375
   ```