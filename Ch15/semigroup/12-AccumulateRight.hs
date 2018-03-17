module Main where

import Data.Semigroup
import Test.QuickCheck

data Validation a b = 
    Failure a 
  | Success b 
  deriving (Eq, Show)

newtype AccumulateRight a b = 
  AccumulateRight (Validation a b) 
  deriving (Eq, Show)

instance Semigroup b => 
  Semigroup (AccumulateRight a b) where
    AccumulateRight (Main.Success a) <> AccumulateRight (Main.Success b) = AccumulateRight (Main.Success $ a <> b)
    AccumulateRight (Main.Success a) <> _ = AccumulateRight $ Main.Success a
    _ <> AccumulateRight (Main.Success b) = AccumulateRight $ Main.Success b
    AccumulateRight (Main.Failure a) <> _ = AccumulateRight $ Main.Failure a

instance (Arbitrary a, Arbitrary b) => Arbitrary (AccumulateRight a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    frequency [(1, return $ AccumulateRight (Main.Failure a)),
               (1, return $ AccumulateRight (Main.Success b))]

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type AccumulateRightAssoc = 
     AccumulateRight (Sum Int) (Sum Int)
  -> AccumulateRight (Sum Int) (Sum Int)
  -> AccumulateRight (Sum Int) (Sum Int)
  -> Bool

main :: IO () 
main =
  quickCheck (semigroupAssoc :: AccumulateRightAssoc)