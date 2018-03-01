module Main where

import Test.Hspec

mult :: Int -> Int -> Int
mult x y 
  | y > 0 = mult x (y - 1) + x
  | y < 0 = mult x (y + 1) - x
  | otherwise = 0

main :: IO ()
main = hspec $ do
  describe "mult" $ do
    it "positive number times positive number" $ do
      1 `mult` 1 == 1 `shouldBe` True
      50 `mult` 50 == 2500 `shouldBe` True
    it "positive number times negative number" $ do
      (-1) `mult` 1 == (-1) `shouldBe` True
      (-50) `mult` 50 == (-2500) `shouldBe` True
      1 `mult` (-1) == (-1) `shouldBe` True
      50 `mult` (-50) == (-2500) `shouldBe` True
    it "negative number times negative number" $ do
      (-1) `mult` (-1) == 1 `shouldBe` True
      (-50) `mult` (-50) == 2500 `shouldBe` True
    
