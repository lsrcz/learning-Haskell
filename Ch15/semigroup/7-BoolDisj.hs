module Main where

import Data.Semigroup
import Test.QuickCheck

newtype BoolDisj =
  BoolDisj Bool
  deriving (Eq, Show)

instance Semigroup BoolDisj where 
  BoolDisj b1 <> BoolDisj b2 = BoolDisj $ b1 || b2
instance Arbitrary BoolDisj where
  arbitrary = do
    b <- arbitrary
    return $ BoolDisj b

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type BoolDisjAssoc = 
     BoolDisj
  -> BoolDisj
  -> BoolDisj
  -> Bool

main :: IO () 
main =
  quickCheck (semigroupAssoc :: BoolDisjAssoc)