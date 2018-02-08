module Curring where

cattyConny :: String -> String -> String
cattyConny x y = x ++ " mrow " ++ y

-- fill in the types
flippy :: String -> String -> String
flippy = flip cattyConny

appedCatty :: String -> String
appedCatty = cattyConny "woops"

frappe :: String -> String
frappe = flippy "haha"

main :: IO()
main = do
    print(appedCatty "woohoo!")
    print(frappe "1")
    print(frappe (appedCatty "2"))
    print(appedCatty (frappe "blue"))
    print(cattyConny (frappe "pink")
               (cattyConny "green" (appedCatty "blue")))
    print(cattyConny (flippy "Pugs" "are") "awesome")