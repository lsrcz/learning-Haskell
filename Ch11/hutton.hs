module Hutton where

data Expr
    = Lit Integer
    | Add Expr Expr

eval :: Expr -> Integer
eval (Lit i) = i
eval (Add lhs rhs) = eval lhs + eval rhs

printExpr :: Expr -> String
printExpr (Lit i) = show i
printExpr (Add lhs rhs) = printExpr lhs ++ " + " ++ printExpr rhs
