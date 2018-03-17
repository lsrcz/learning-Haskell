module Main where

import Data.Semigroup
import Test.QuickCheck

data Or a b =
    Fst a
  | Snd b
  deriving (Eq, Show)

instance Semigroup (Or a b) where 
  Snd a <> _ = Snd a
  _ <> b = b
instance (Arbitrary a, Arbitrary b) => Arbitrary (Or a b) where
  arbitrary = do
    a <- arbitrary
    b <- arbitrary
    frequency [(1, return $ Fst a),
               (1, return $ Snd b)]

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type OrAssoc = 
     Or Int Int
  -> Or Int Int
  -> Or Int Int
  -> Bool

main :: IO () 
main =
  quickCheck (semigroupAssoc :: OrAssoc)