module Main where

import Data.Monoid

data Optional a = 
    Nada
  | Only a
  deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty = Only mempty
  mappend Nada a = a
  mappend a Nada = a
  mappend (Only a) (Only b) = Only $ a `mappend` b

main :: IO ()
main = do
  print $ Only (Sum 1) `mappend` Only (Sum 1)
  print $ Only (Product 4) `mappend` Only (Product 2)
  print $ Only [1] `mappend` Nada
  print $ Nada `mappend` Only (Sum 1)
