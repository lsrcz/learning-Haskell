module Main where

import Data.Monoid
import Test.QuickCheck

newtype BoolDisj =
  BoolDisj Bool
  deriving (Eq, Show)

instance Monoid BoolDisj where 
  mempty = BoolDisj False
  mappend (BoolDisj b1) (BoolDisj b2) = BoolDisj $ b1 || b2

instance Arbitrary BoolDisj where
  arbitrary = do
    b <- arbitrary
    return $ BoolDisj b

monoidAssoc :: (Eq m, Monoid m) => m -> m -> m -> Bool
monoidAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

monoidLeftIdentity :: (Eq m, Monoid m) => m -> Bool
monoidLeftIdentity a = (mempty `mappend` a) == a 

monoidRightIdentity :: (Eq m, Monoid m) => m -> Bool
monoidRightIdentity a = (a `mappend` mempty) == a

type BoolDisjAssoc = 
     BoolDisj
  -> BoolDisj
  -> BoolDisj
  -> Bool

main :: IO () 
main = do
  quickCheck (monoidAssoc :: BoolDisjAssoc)
  quickCheck (monoidLeftIdentity :: BoolDisj -> Bool)
  quickCheck (monoidRightIdentity :: BoolDisj -> Bool)