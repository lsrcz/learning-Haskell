-- arith6.hs
module Arith6 where

roundTrip :: (Show a, Read b) => a -> b
roundTrip = read . show

main :: IO()
main = do
    print (roundTrip (4 :: Int) :: Integer)
    print (roundTrip (4 :: Int) :: Float)