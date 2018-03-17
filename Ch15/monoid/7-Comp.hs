module Main where

import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Classes

newtype Comp a =
  Comp { unComp :: (a -> a) }
  deriving (Show)

instance Monoid (Comp a) where 
  mempty = Comp id
  mappend (Comp f) (Comp g) = Comp $ f . g

instance (CoArbitrary a, Arbitrary a) => Arbitrary (Comp a) where
  arbitrary = do
    f <- arbitrary
    return $ Comp f

type CompAssoc =
     Comp (Sum Int)
  -> Comp (Sum Int)
  -> Comp (Sum Int)
  -> Sum Int
  -> Bool

monoidAssoc :: CompAssoc
monoidAssoc a b c d = unComp (a <> (b <> c)) d == unComp ((a <> b) <> c) d
  

type CompIdentity =
    Comp (Sum Int)
 -> Sum Int
 -> Bool

monoidLeftIdentity :: CompIdentity
monoidLeftIdentity a b = unComp (mempty `mappend` a) b == unComp a b

monoidRightIdentity :: CompIdentity
monoidRightIdentity a b = unComp (a `mappend` mempty) b == unComp a b

main :: IO () 
main = do
 quickCheck monoidAssoc
 quickCheck monoidLeftIdentity
 quickCheck monoidRightIdentity