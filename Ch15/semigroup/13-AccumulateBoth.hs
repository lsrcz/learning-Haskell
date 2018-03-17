module Main where

import Data.Semigroup
import Test.QuickCheck

data Validation a b = 
    Failure a 
  | Success b 
  deriving (Eq, Show)

newtype AccumulateBoth a b = 
  AccumulateBoth (Validation a b) 
  deriving (Eq, Show)

instance (Semigroup a, Semigroup b) => 
  Semigroup (AccumulateBoth a b) where
    AccumulateBoth (Main.Success a) <> AccumulateBoth (Main.Success b) = 
      AccumulateBoth (Main.Success $ a <> b)
    AccumulateBoth (Main.Failure a) <> AccumulateBoth (Main.Failure b) = 
      AccumulateBoth (Main.Failure $ a <> b)
    AccumulateBoth (Main.Success a) <> _ = AccumulateBoth (Main.Success a)
    _ <> b = b

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccumulateBoth a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    frequency [(1, return $ AccumulateBoth (Main.Failure a)),
               (1, return $ AccumulateBoth (Main.Success b))]

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type AccumulateBothAssoc = 
     AccumulateBoth (Sum Int) (Sum Int)
  -> AccumulateBoth (Sum Int) (Sum Int)
  -> AccumulateBoth (Sum Int) (Sum Int)
  -> Bool

main :: IO () 
main =
  quickCheck (semigroupAssoc :: AccumulateBothAssoc)