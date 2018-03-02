module Main where

import Hangman
import Test.Hspec

testPuzzle :: Puzzle
testPuzzle = Puzzle "abc" [Just 'a', Nothing, Nothing] "a"

main :: IO ()
main = hspec $ do
  describe "fillInCharacter" $ do
    it "fill in an guessed char" $ 
      case fillInCharacter testPuzzle 'a' of
        Puzzle word lst guessed -> 
          (word, lst, guessed) `shouldBe` 
          ("abc", [Just 'a', Nothing, Nothing], "aa")
    it "fill in an unguessed char" $ 
      case fillInCharacter testPuzzle 'b' of
        Puzzle word lst guessed -> 
          (word, lst, guessed) `shouldBe` 
          ("abc", [Just 'a', Just 'b', Nothing], "ba")
  describe "handleGuess" $ do
    it "already guessed" $ do
      puzzle <- handleGuess testPuzzle 'a'
      case puzzle of
        Puzzle word lst guessed -> 
          (word, lst, guessed) `shouldBe`
          ("abc", [Just 'a', Nothing, Nothing], "a")
    it "in the word" $ do
      puzzle <- handleGuess testPuzzle 'b'
      case puzzle of
        Puzzle word lst guessed -> 
          (word, lst, guessed) `shouldBe`
          ("abc", [Just 'a', Just 'b', Nothing], "ba")
    it "not in the word" $ do
      puzzle <- handleGuess testPuzzle 'd'
      case puzzle of
        Puzzle word lst guessed -> 
          (word, lst, guessed) `shouldBe`
          ("abc", [Just 'a', Nothing, Nothing], "da")