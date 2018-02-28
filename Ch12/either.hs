module Either where

lefts' :: [Either a b] -> [a]
lefts' = foldr (
  \x acc -> 
    case x of
      Left l -> l : acc
      _ -> acc
  ) []

rights' :: [Either a b] -> [b]
rights' = foldr (
  \x acc -> 
    case x of
      Right l -> l : acc
      _ -> acc
  ) []

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' xs = (lefts' xs, rights' xs)

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' f (Right x) = Just $ f x

either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left x) = f x
either' _ f (Right x) = f x

eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' f = either' (const Nothing) (Just . f)