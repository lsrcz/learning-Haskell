module Tree where

data BinaryTree a =
    Leaf
  | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

unfold :: (a -> Maybe (a, b, a)) -> a -> BinaryTree b
unfold f a = 
  case f a of
    Nothing -> Leaf
    Just (l, t, r) -> Node (unfold f l) t (unfold f r)

treeBuild :: Integer -> BinaryTree Integer
treeBuild = unfold (
    \a -> 
      if a == 0 
        then Nothing
        else Just (a - 1, a - 1, a - 1)
  )