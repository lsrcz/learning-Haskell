module Nat where

data Nat =
    Zero
  | Succ Nat
  deriving (Eq, Show)

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = 1 + natToInteger n

integerToNat :: Integer -> Maybe Nat
integerToNat x
  | x < 0 = Nothing
  | otherwise = 
    let 
      go 0 = Zero
      go x = Succ $ go (x - 1)
    in
      Just $ go x