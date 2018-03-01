# Chapter 13. Building projects

## Intermission: Check your understanding
> Here is the import list from one of the modules in Chris’s library called Blacktip:
> ```haskell
> import qualified Control.Concurrent        as CC
> import qualified Control.Concurrent.MVar   as MV
> import qualified Data.ByteString.Char8     as B
> import qualified Data.Locator              as DL
> import qualified Data.Time.Clock.POSIX     as PSX
> import qualified Filesystem                as FS
> import qualified Filesystem.Path.CurrentOS as FPC
> import qualified Network.Info              as NI
> import qualified Safe
> import Control.Exception (mask, try)
> import Control.Monad (forever, when)
> import Data.Bits
> import Data.Bits.Bitwise (fromListBE)
> import Data.List.Split (chunksOf)
> import Database.Blacktip.Types
> import System.IO.Unsafe (unsafePerformIO)
> ```
1. > What functions are being imported from Control.Monad?
   `forever`, `when`.
2. > Which imports are both unqualified and imported in their entirety?
   ```haskell
   import Data.Bits
   import Database.Blacktip.Types
   ```
3. > From the name, what do you suppose `import Database.Blacktip.Types` is importing?
4. > Now let’s compare a small part of Blacktip’s code to the above import list:
   > ```haskell
   > writeTimestamp :: MV.MVar ServerState
   >                -> FPC.FilePath
   >                -> IO CC.ThreadId
   > writeTimestamp s path = do
   >   CC.forkIO go
   >   where go = forever $ do
   >           ss <- MV.readMVar s
   >           mask $ \_ -> do
   >             FS.writeFile path (B.pack (show (ssTime ss)))
   >           -- sleep for 1 second
   >           CC.threadDelay 1000000
   > ```
   > 1. The type signature refers to three aliased imports. What modules are named in those aliases?
   > 2. Which import does `FS.writeFile` refer to?
   > 3. Which import did `forever` come from?
   1. `MV`: `Control.Concurrent.MVar`
   2. `FPC`: `Filesystem.Path.CurrentOS`
   3. `CC`: `Control.Concurrent`

## Chapter exercises
### Hangman game logic
> You may have noticed when you were playing with the hangman game, that there are some weird things about its game logic.
>
> These make it unlike hangman as you might have played it in the past. Ordinarily, only incorrect guesses count against you, so you can make as many correct guesses as you need to fill in the word. Modifying the game so that it either gives you more guesses before the game ends or only uses shorter words (or both) involves only a couple of uncomplicated steps.

[Here](./hangmanLogic/) I chose that only incorrect guesses count towards the guess limit and also more guesses are given for the longer words.

### Modifying code
1. > Ciphers: Open your Ciphers module and modify it so that the Caesar and Vigenère ciphers work with user input.

   [Here](./cipher.hs) is the code.
2. > Here is a very simple, short block of code. Notice it has a forever that will make it keep running, over and over again. Load it into your REPL and test it out. Then refer back to the chapter and modify it to exit successfully a er a False result.
   > ```haskell
   > import Control.Monad
   > 
   > palindrome :: IO ()
   > palindrome = forever $ do
   >   line1 <- getLine
   >     case (line1 == reverse line1) of
   >     True -> putStrLn "It's a palindrome!"
   >     False -> putStrLn "Nope!"
   > ```
   [Here](./palindrome.hs) is the code.
3. > If you tried using `palindrome` on a sentence such as “Madam I’m Adam,” you may have noticed that palindrome checker doesn’t work on that. Modifying the above so that it works on sentences, too, involves several steps. You may need to refer back to previous examples in the chapter to get ideas for proper ordering and nesting. You may wish to import Data.Char to use the function `toLower`. Have fun.

   [Here](./newPalindrome.hs) is the code.

4. > ```haskell
   > type Name = String
   > type Age = Integer
   >
   > data Person = Person Name Age deriving Show
   >
   > data PersonInvalid = NameEmpty
   >                    | AgeTooLow
   >                    | PersonInvalidUnknown String
   >                    deriving (Eq, Show)
   >
   > mkPerson :: Name
   >          -> Age
   >          -> Either PersonInvalid Person
   > mkPerson name age
   >   | name /= "" && age > 0 = Right $ Person name age
   >   | name == "" = Left NameEmpty
   >   | not (age > 0) = Left AgeTooLow
   >   | otherwise = Left $ PersonInvalidUnknown $
   >                        "Name was: " ++ show name ++
   >                        " Age was: " ++ show age
   > ```
   > Your job is to write the following function without modifying the code above.
   > ```haskell
   > gimmePerson :: IO ()
   > gimmePerson = undefined
   > ```
   > Since `IO ()` is about the least informative type imaginable, we’ll tell what it should do.
   > 1. It should prompt the user for a name and age input.
   > 2. It should attempt to construct a Person value using the name and age the user entered. You’ll need the read function for Age because it’s an Integer rather than a String.
   > 3. If it constructed a successful person, it should print ”Yay! Successfully got a person:” followed by the Person value.
   > 4. If it got an error value, report that an error occurred and print the error.
   
   [Here](./person.hs) is the code.