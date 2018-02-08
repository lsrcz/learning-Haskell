module FoldBool where

foldBool1 :: a -> a -> Bool -> a
foldBool1 x y b
    | b         = x
    | otherwise = y

foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b =
    case b of
        True  -> x
        False -> y
