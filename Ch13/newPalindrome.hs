module Palindrome where

import Control.Monad
import System.Exit
import Data.Char

isPalindrome :: String -> Bool
isPalindrome line =
  x == reverse x
  where x = filter isAlpha $ map toLower line

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  case isPalindrome line1 of
    True -> putStrLn "It's a palindrome!"
    False -> do
      putStrLn "Nope!"
      exitSuccess