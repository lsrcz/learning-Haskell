module Main where

import Data.Semigroup
import Test.QuickCheck

data Validation a b = 
    Failure a 
  | Success b 
  deriving (Eq, Show)

instance Semigroup a => Semigroup (Validation a b) where
  Main.Failure a <> Main.Failure b = Main.Failure $ a <> b
  Main.Failure a <> _ = Main.Failure a
  _ <> Main.Failure b = Main.Failure b
  _ <> Main.Success b = Main.Success b

instance (Arbitrary a, Arbitrary b) => Arbitrary (Validation a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    frequency [(1, return $ Main.Failure a),
               (1, return $ Main.Success b)]

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type ValidationAssoc = 
     Validation (Sum Int) (Sum Int)
  -> Validation (Sum Int) (Sum Int)
  -> Validation (Sum Int) (Sum Int)
  -> Bool

main :: IO () 
main =
  quickCheck (semigroupAssoc :: ValidationAssoc)