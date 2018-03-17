module Main where

import Data.Semigroup
import Test.QuickCheck

data Three a b c = Three a b c deriving (Eq, Show)

instance (Semigroup a, Semigroup b, Semigroup c) 
  => Semigroup (Three a b c) where 
  Three a1 b1 c1 <> Three a2 b2 c2 = Three (a1 <> a2) (b1 <> b2) (c1 <> c2)
instance (Arbitrary a, Arbitrary b, Arbitrary c) 
  => Arbitrary (Three a b c) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return $ Three a b c

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type ThreeAssoc = 
     Three (Sum Int) (Product Int) (Sum Int) 
  -> Three (Sum Int) (Product Int) (Sum Int)
  -> Three (Sum Int) (Product Int) (Sum Int)
  -> Bool

main :: IO () 
main =
  quickCheck (semigroupAssoc :: ThreeAssoc)