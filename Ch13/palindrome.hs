module Palindrome where

import Control.Monad
import System.Exit

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  case line1 == reverse line1 of
    True -> putStrLn "It's a palindrome!"
    False -> do
      putStrLn "Nope!"
      exitSuccess