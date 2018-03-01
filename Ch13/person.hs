module Person where

import Text.Read (readMaybe)

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty
                   | AgeTooLow
                   | PersonInvalidUnknown String
                   deriving (Eq, Show)

mkPerson :: Name
         -> Age
         -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 = Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise = Left $ PersonInvalidUnknown $
                       "Name was: " ++ show name ++
                       " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  putStr "Name? "
  name <- getLine
  putStr "Age? "
  line <- getLine
  case readMaybe line :: Maybe Integer of
    Nothing -> putStrLn "Error: NotAnInt"
    Just age -> 
      case mkPerson name age of
        Left err -> print err
        Right person -> putStrLn $ "Yay! Successfully got a person " ++ show person
