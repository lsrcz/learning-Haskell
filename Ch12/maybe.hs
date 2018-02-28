module Maybe where

isJust :: Maybe a -> Bool
isJust Nothing = False
isJust _ = True

isNothing :: Maybe a -> Bool
isNothing = not . isJust

mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee i _ Nothing = i
mayybee _ f (Just x) = f x

fromMaybe :: a -> Maybe a -> a
fromMaybe i Nothing = i
fromMaybe _ (Just x) = x

listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:_) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [x]

catMaybes :: [Maybe a] -> [a]
catMaybes = foldr (
  \x acc ->
    case x of
      Nothing -> acc
      Just y -> y : acc
  ) []

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe [] = Nothing
flipMaybe xs = foldr (
  \x acc ->
    case acc of
      Nothing -> Nothing
      Just ls ->
        case x of
          Nothing -> Nothing
          Just l -> Just (l:ls)
  ) (Just []) xs