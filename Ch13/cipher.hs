module Cipher where

import Data.Char
import Control.Monad (forever)
import Text.Read (readMaybe)

encode :: Char -> (Int, Char)
encode ch = 
  (ord ch - ord base, base)
  where base = if isUpper ch then 'A' else 'a'

decode :: (Int, Char) -> Char
decode (code, base) = chr (ord base + code)

shift :: Int -> Char -> Char
shift i ch = 
  if isAlpha ch
    then decode ((code + (i `rem` 26) + 26) `rem` 26, base)
    else ch
  where (code, base) = encode ch

caesar :: Int -> String -> String
caesar i = map $ shift i

unCaesar :: Int -> String -> String
unCaesar i = map $ shift $ -i

data Functions =
    Cipher
  | Uncipher
  | Wrong
    
choiceToFunc :: String -> Functions
choiceToFunc "1" = Cipher
choiceToFunc "2" = Uncipher
choiceToFunc _   = Wrong

getInt :: IO Int
getInt = do
  int <- getLine
  case readMaybe int of
    Nothing -> do
      putStr "Please input an integer: "
      getInt
    Just i -> return i

getChoice :: IO Functions
getChoice = do
  choice <- getLine
  case choice of
    [_] -> 
      case choiceToFunc choice of
        Wrong -> do
          putStr "Please input 1 or 2: "
          getChoice
        other@_ -> return other
    _ -> do
      putStr "Please input 1 or 2: "
      getChoice

main :: IO()
main = forever $ do
  putStr "The words? "
  sentence <- getLine
  putStrLn "Do you want to cipher or uncipher the words? "
  putStrLn " * 1) cipher"
  putStrLn "   2) uncipher"
  putStr "Your choice? [default: cipher] "
  choice <- getChoice
  putStr "The shift distance? "
  distance <- getInt
  case choice of
    Wrong -> return ()
    Cipher -> putStrLn $ caesar distance sentence
    Uncipher -> putStrLn $ unCaesar distance sentence

