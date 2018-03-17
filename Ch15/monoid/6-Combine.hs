module Main where

import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Classes

newtype Combine a b =
  Combine { unCombine :: (a -> b) }
  deriving (Show)

instance (Monoid b) => Monoid (Combine a b) where 
  mempty = Combine $ const mempty
  mappend (Combine f) (Combine g) = Combine (\x -> f x <> g x)

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

monoidAssoc :: CombineAssoc
monoidAssoc a b c d = unCombine (a <> (b <> c)) d == unCombine ((a <> b) <> c) d

type CombineIdentity =
     Combine (Sum Int) (Product Int)
  -> Sum Int
  -> Bool

monoidLeftIdentity :: CombineIdentity
monoidLeftIdentity a b = unCombine (mempty `mappend` a) b == unCombine a b

monoidRightIdentity :: CombineIdentity
monoidRightIdentity a b = unCombine (a `mappend` mempty) b == unCombine a b

main :: IO () 
main = do
  quickCheck monoidAssoc
  quickCheck monoidLeftIdentity
  quickCheck monoidRightIdentity