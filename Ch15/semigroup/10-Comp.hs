module Main where

import Data.Semigroup
import Test.QuickCheck
import Test.QuickCheck.Classes

newtype Comp a =
  Comp { unComp :: (a -> a) }
  deriving (Show)

instance Semigroup (Comp a) where 
  Comp f <> Comp g = Comp $ f . g
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

semigroupAssoc :: CompAssoc
semigroupAssoc a b c d = unComp (a <> (b <> c)) d == unComp ((a <> b) <> c) d

main :: IO () 
main =
  quickCheck semigroupAssoc