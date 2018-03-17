module Main where

import Data.Semigroup
import Test.QuickCheck

newtype BoolConj =
  BoolConj Bool
  deriving (Eq, Show)

instance Semigroup BoolConj where 
  BoolConj b1 <> BoolConj b2 = BoolConj $ b1 && b2
instance Arbitrary BoolConj where
  arbitrary = do
    b <- arbitrary
    return $ BoolConj b

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type BoolConjAssoc = 
     BoolConj
  -> BoolConj
  -> BoolConj
  -> Bool

main :: IO () 
main =
  quickCheck (semigroupAssoc :: BoolConjAssoc)