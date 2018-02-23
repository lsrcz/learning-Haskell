module DaPhone where

import Data.List
import Data.Char
import Data.Function(on)

-- validButtons = "1234567890*#"
type Digit = Char

type Key = (Digit, String)

-- Valid presses: 1 and up
type Presses = Int

data DaPhone = DaPhone [Key]

convo :: [String]
convo =
    ["Wanna play 20 questions",
     "Ya",
     "U 1st haha",
     "Lol ok. Have u ever tasted alcohol lol",
     "Lol ya",
     "Wow ur cool haha. Ur turn",
     "Ok. Do u think I am pretty Lol",
     "Lol ya",
     "Haha thanks just making sure rofl ur turn"]

timeOfPresses :: String -> Char -> Maybe Presses
timeOfPresses letters ch = (+1) <$> elemIndex ch letters

reverseTapsLower :: DaPhone -> Char -> (Digit, Presses)
reverseTapsLower (DaPhone ((digit, letters):phone)) ch = 
    case timeOfPresses letters ch of
        Just presses -> (digit, presses)
        Nothing -> reverseTapsLower (DaPhone phone) ch

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps phone ch = 
    if isUpper ch then [('*', 1), lowerTaps] else [lowerTaps]
    where lowerTaps = reverseTapsLower phone $ toLower ch

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead _ [] = []
cellPhonesDead phone str = concatMap (reverseTaps phone) str

fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = sum . map snd

mostPopular :: (Ord a) => [a] -> a
mostPopular = head . maximumBy (compare `on` length) . group . sort

mostPopularLetter :: String -> Char
mostPopularLetter = mostPopular

coolestLtr :: [String] -> Char
coolestLtr = mostPopularLetter . filter isAlpha . map toLower . unwords
coolestWord :: [String] -> String
coolestWord = mostPopular . words . map toLower . unwords

daPhone :: DaPhone
daPhone = DaPhone [
    ('1',"1"),
    ('2',"abc2"),
    ('3',"def3"),
    ('4',"ghi4"),
    ('5',"jkl5"),
    ('6',"mno6"),
    ('7',"pqrs7"),
    ('8',"tuv8"),
    ('9',"wxyz9"),
    ('*',"^*"),
    ('0',"+ _0"),
    ('#',".,#")
    ] 

main :: IO()
main = do
    print $ reverseTaps daPhone 'a'
    print $ reverseTaps daPhone 'B'
    print $ reverseTaps daPhone ' '
    print $ reverseTaps daPhone '2'
    print $ cellPhonesDead daPhone "12a A"
    print $ map (cellPhonesDead daPhone) convo
    print $ fingerTaps $ cellPhonesDead daPhone "12a A"
    print $ map (fingerTaps . cellPhonesDead daPhone) convo
    print $ coolestLtr convo
    print $ coolestWord convo
    print $ coolestLtr ["bcd", "d"]