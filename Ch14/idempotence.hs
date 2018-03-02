module Main where

import Test.Hspec
import Test.QuickCheck
import Data.Char (toUpper)
import Data.List (sort)

twice :: (a -> a) -> a -> a
twice f = f . f
fourTimes :: (a -> a) -> a -> a
fourTimes = twice . twice

capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (c:cs) = toUpper c : cs

main :: IO ()
main = hspec $ do
  describe "capitalizeWord has the idemptence property" $ do
    it "capitalizeWord has the idemptence property when applied twice" $
      property $ \x -> capitalizeWord x == twice capitalizeWord (x :: String)
    it "capitalizeWord has the idemptence property when applied four times" $
      property $ \x -> capitalizeWord x == fourTimes capitalizeWord (x :: String)
  describe "sort has the idemptence property" $ do
    it "sort has the idemptence property when applied twice" $
      property $ \x -> sort x == twice sort (x :: [Int])
    it "sort has the idemptence property when applied four times" $
      property $ \x -> sort x == fourTimes sort (x :: [Int])