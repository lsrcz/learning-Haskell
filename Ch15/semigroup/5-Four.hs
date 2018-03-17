module Main where

import Data.Semigroup
import Test.QuickCheck

data Four a b c d = Four a b c d deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c, Semigroup d) 
  => Semigroup (Four a b c d) where 
  Four a1 b1 c1 d1 <> Four a2 b2 c2 d2 = Four (a1 <> a2) (b1 <> b2) (c1 <> c2) (d1 <> d2)
instance (Arbitrary a, Arbitrary b, Arbitrary c, Arbitrary d) 
  => Arbitrary (Four a b c d) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    d <- arbitrary
    return $ Four a b c d

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type FourAssoc = 
     Four (Sum Int) (Product Int) (Sum Int) (Product Int)
  -> Four (Sum Int) (Product Int) (Sum Int) (Product Int)
  -> Four (Sum Int) (Product Int) (Sum Int) (Product Int)
  -> Bool

main :: IO () 
main =
  quickCheck (semigroupAssoc :: FourAssoc)