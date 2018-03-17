module Main where

import Data.Monoid
import Test.QuickCheck
import Test.QuickCheck.Classes

newtype Mem s a = 
  Mem {
    runMem :: s -> (a,s) 
  }
  deriving Show

instance Monoid a => Monoid (Mem s a) where 
  mempty = Mem (\s -> (mempty, s))
  mappend (Mem f) (Mem g) = 
    Mem (\s -> 
        let
          (a,b) = g s
          (c,d) = f b
        in
          (a <> c, d)
      )

instance (CoArbitrary a, Arbitrary a, CoArbitrary s, Arbitrary s) => 
  Arbitrary (Mem s a) where
    arbitrary = do
      f <- arbitrary
      return $ Mem f

type MemAssoc =
     Mem Int String
  -> Mem Int String
  -> Mem Int String
  -> Int
  -> Bool

monoidAssoc :: MemAssoc
monoidAssoc a b c d = runMem (a <> (b <> c)) d == runMem ((a <> b) <> c) d
  

type MemIdentity =
     Mem Int String
  -> Int
  -> Bool

monoidLeftIdentity :: MemIdentity
monoidLeftIdentity a b = runMem (mempty `mappend` a) b == runMem a b

monoidRightIdentity :: MemIdentity
monoidRightIdentity a b = runMem (a `mappend` mempty) b == runMem a b

f' :: Mem Int String
f' = Mem $ \s -> ("hi", s + 1)

main = do
  print $ runMem (f' <> mempty) 0
  print $ runMem (mempty <> f') 0
  print $ (runMem mempty 0 :: (String, Int)) 
  print $ runMem (f' <> mempty) 0 == runMem f' 0 
  print $ runMem (mempty <> f') 0 == runMem f' 0
  quickCheck monoidAssoc
  quickCheck monoidLeftIdentity
  quickCheck monoidRightIdentity