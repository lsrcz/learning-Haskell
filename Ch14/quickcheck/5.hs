module Main where

import Test.QuickCheck

prop_quotrem :: (Integral a) => NonZero a -> NonZero a -> Bool
prop_quotrem nx ny = 
  let 
    x = getNonZero nx
    y = getNonZero ny
  in
    (quot x y) * y + (rem x y) == x

prop_divmod :: (Integral a) => NonZero a -> NonZero a -> Bool
prop_divmod nx ny = 
  let 
    x = getNonZero nx
    y = getNonZero ny
  in
    (div x y) * y + (mod x y) == x

main :: IO ()
main = do
  quickCheck (prop_quotrem :: NonZero Int -> NonZero Int -> Bool)
  quickCheck (prop_divmod :: NonZero Int -> NonZero Int -> Bool)