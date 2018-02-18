module Stdfunc where

myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

myElem :: Eq a => a -> [a] -> Bool
myElem x = myAny (==x)

myReverse :: [a] -> [a]
myReverse l = go l []
    where go [] l2 = l2
          go (x:xs) l2 = go xs (x:l2)

myAppend :: [a] -> [a] -> [a]
myAppend [] l2 = l2
myAppend (x:xs) l2 = x : myAppend xs l2

squish :: [[a]] -> [a]
squish [] = []
squish (x:xs) = myAppend x $ squish xs
          

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap _ [] = []
squishMap f (x:xs) = myAppend (f x) $ squishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

myMaximumBy :: (a -> a -> Ordering) -> [a] -> a
myMaximumBy _ [x] = x
myMaximumBy f (x:xs) = 
    case f x y of
        GT -> x
        LT -> y
        EQ -> x
    where y = myMaximumBy f xs

myMinimumBy :: (a -> a -> Ordering) -> [a] -> a
myMinimumBy _ [x] = x
myMinimumBy f (x:xs) =
    case f x y of
        GT -> y
        LT -> x
        EQ -> x
    where y = myMinimumBy f xs

myMaximum :: (Ord a) => [a] -> a
myMaximum = myMaximumBy compare

myMinimum :: (Ord a) => [a] -> a
myMinimum = myMinimumBy compare
