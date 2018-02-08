module Tens where

tensDigit :: Integral a => a -> a
tensDigit = snd . flip divMod 10 . fst . flip divMod 10

hunsD :: Integral a => a -> a
hunsD x = d2
    where d  = x `div` 100
          d2 = d `mod` 10