module Main where
  
import Test.QuickCheck

prop_revTwiceId :: (Eq a) => [a] -> Bool
prop_revTwiceId xs = (reverse . reverse) xs == id xs

main :: IO ()
main = quickCheck (prop_revTwiceId :: [Int] -> Bool)