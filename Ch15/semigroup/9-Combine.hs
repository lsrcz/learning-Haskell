module Main where

import Data.Semigroup
import Test.QuickCheck
import Test.QuickCheck.Classes

newtype Combine a b =
  Combine { unCombine :: (a -> b) }
  deriving (Show)

instance (Semigroup b) => Semigroup (Combine a b) where 
  Combine f <> Combine g = Combine $ (\x -> f x <> g x)
instance (CoArbitrary a, CoArbitrary b, Arbitrary a, Arbitrary b) => Arbitrary (Combine a b) where
  arbitrary = do
    f <- arbitrary
    return $ Combine f

type CombineAssoc =
     Combine (Sum Int) (Product Int)
  -> Combine (Sum Int) (Product Int)
  -> Combine (Sum Int) (Product Int)
  -> Sum Int
  -> Bool

semigroupAssoc :: CombineAssoc
semigroupAssoc a b c d = unCombine (a <> (b <> c)) d == unCombine ((a <> b) <> c) d
     

main :: IO () 
main =
  quickCheck semigroupAssoc