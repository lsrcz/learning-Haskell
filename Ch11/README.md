# Chapter 11. Algebraic Datatypes

## Multiple choice
1. > Given the following datatype:
   > ```haskell
   > data Weekday =
   >     Monday
   >   | Tuesday
   >   | Wednesday
   >   | Thursday
   >   | Friday
   > ```
   > we can say:
   > 
   > a) `Weekday` is a type with five data constructors
   > 
   > b) `Weekday` is a tree with five branches
   > 
   > c) `Weekday` is a product type
   > 
   > d) `Weekday` takes five arguments

   Answer: a.
2. > and with the same datatype definition in mind, what is the type of the following function, `f`?
   > ```haskell
   > f Friday = "Miller Time"
   > ```
   > a) `f :: [Char]`
   > 
   > b) `f :: String -> String`
   > 
   > c) `f :: Weekday -> String`
   > 
   > d) `f :: Day -> Beer`

   Answer: c.
3. > Types defined with the data keyword 
   >
   > a) must have at least one argument
   >
   > b) must begin with a capital letter 
   >
   > c) must be polymorphic
   >
   > d) cannot be imported from modules

   Answer: b.
4. > The function `g xs = xs !! (length xs - 1)`
   >
   > a) is recursive and may not terminate 
   >
   > b) delivers the head of `xs`
   >
   > c) delivers the final element of `xs`
   >
   > d) has the same type as `xs`

   Answer: c.

## Ciphers
Write a Vigenère cipher.

[Here](./vigenere.hs) is the code.

## As-patterns
Use as-patterns in implementing the following functions:
1. > This should return True if (and only if) all the values in the first list appear in the second list, though they need not be contiguous.
   > ```haskell
   > isSubsequenceOf :: (Eq a) => [a] -> [a] -> Bool
   > ```
   [Here](./issubseqof.hs) is the code.
2. > Split a sentence into words, then tuple each word with the capitalized form of each.
   > ```haskell
   > capitalizeWords :: String -> [(String, String)]
   > ```
   [Here](./capwords.hs) is the code.

## Language exercises
1. > Write a function that capitalizes a word.
   > ```haskell
   > capitalizeWord :: String -> String
   > capitalizeWord = undefined
   > ```
2. > Write a function that capitalizes sentences in a paragraph. Recognize when a new sentence has begun by checking for periods. Reuse the capitalizeWord function.
   > ```haskell
   > capitalizeParagraph :: String -> String
   > capitalizeParagraph = undefined
   > ```
[Here](./cappara.hs) is the code.

## Phone exercise
> Here is the layout of the phone:
> |1     |2 ABC|3 DEF |
> |:-:   |:-:  |:-:   |
> |4 GHI |5 JKL|6 MNO |
> |7 PQRS|8 TUV|9 WXYZ|
> |* ^   |0 +_ |# .,  |
> Where star (*) gives you capitalization of the letter you’re writing to your friends, and 0 is your space bar. To represent the digit itself, you press that digit once more than the letters it represents. If you press a button one more than than is required to type the digit, it wraps around to the first letter.
> 1. Create a data structure that captures the phone layout above. The data structure should be able to express enough of how the layout works that you can use it to dictate the behavior of the functions in the following exercises.
> ```haskell
> -- fill in the rest.
> data DaPhone = DaPhone
> ```
> 2. Convert the following conversations into the key presses required to express them. We’re going to suggest types and functions to fill in order to accomplish the goal, but they’re not obligatory. If you want to do it differently...you do you.
> ```haskell
> convo :: [String]
> convo =
>   ["Wanna play 20 questions",
>    "Ya",
>    "U 1st haha",
>    "Lol ok. Have u ever tasted alcohol lol",
>    "Lol ya",
>    "Wow ur cool haha. Ur turn",
>    "Ok. Do u think I am pretty Lol",
>    "Lol ya",
>    "Haha thanks just making sure rofl ur turn"]
> -- validButtons = "1234567890*#"
> type Digit = Char
> -- Valid presses: 1 and up
> type Presses = Int
> reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
> reverseTaps = undefined
> -- assuming the default phone definition
> -- 'a' -> ('2', 1)
> -- 'A' -> [('*', 1), ('2', 1)]
> cellPhonesDead :: DaPhone
>                -> String
>                -> [(Digit, Presses)]
> cellPhonesDead = undefined
> ```
> 3. How many times do digits need to be pressed for each message?
> ```haskell
> fingerTaps :: [(Digit, Presses)] -> Presses
> fingerTaps = undefined
> ```
> 4. What was the most popular letter for each message? What was its cost? You’ll want to combine reverseTaps and fingerTaps to figure out what it cost in taps. reverseTaps is a list because you need to press a different button in order to get capitals.
> ```haskell
> mostPopularLetter :: String -> Char
> mostPopularLetter = undefined
> ```
> 5. What was the most popular letter overall? What was the most popular word?
> ```haskell
> coolestLtr :: [String] -> Char
> coolestLtr = undefined
> coolestWord :: [String] -> String
> coolestWord = undefined
> ```
[Here](./daphone.hs) is the code.

## Hutton's Razor
> Hutton’s Razor10 is a very simple expression language that expresses integer literals and addition of values in that expression language.
> 1. Your first task is to write the “eval” function which reduces an expression to a final sum.
> ```haskell
> data Expr
>   = Lit Integer
>   | Add Expr Expr
> eval :: Expr -> Integer
> eval = error "do it to it"
> ```
> 2. Write a printer for the expressions.
> ```haskell
> printExpr :: Expr -> String
> printExpr = undefined
> ```
[Here](./hutton.hs) is the code.
