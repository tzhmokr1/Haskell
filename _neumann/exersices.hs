module Exercises where

positions :: Eq a => a -> [a] -> [Int]
positions n xs = [ i | (x, i) <- zip xs [0..] , n == x ]

position2 :: Eq a => a -> [a] -> [Int]
position2 n xs = find n (zip xs [0..])

find :: Eq a => a -> [(a,b)] -> [b]
find n xs = [v | (k,v) <- xs, n == k]



data Answer = Yes | No | Unknown deriving Show

antworten :: [Answer]
antworten = [Yes]

flip2 :: Answer -> Int
flip2 Yes = 5 * 5
flip2 No = 10 * 10
flip2 Unknown = 0


data Shape = Circle Float | Rect Float Float deriving Show
square :: Float -> Shape
square n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r ^ 2
area (Rect x y) = x * y



safehead :: [a] -> Maybe a
safehead [] = Nothing
safehead xs = Just (head xs)






