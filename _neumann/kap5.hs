module Neumann5 where


-- ghci > ’a’:[’b’,’c’]
-- [’a’,’b’,’c’]
-- ghci > 1:2:2:[]
-- [1,2,2]
-- ghci > [1,2]:[]
-- [[1,2]]


-- Lisen
zahlenListe :: [Int]
zahlenListe = [1,2,3,4,5]

head' :: [a] -> a    -- Wir bezeichnen a als Typvariable / Element.
head' (x:_) = x      -- Nimm das erste Element der Liste, nenne es x und ignoriere den Rest der Liste.

tail' :: [a] -> [a]
tail' (_:xs) = xs    -- Ignoriere den Kopf der Liste und nenne den Rest xs.

last' :: [a] -> a
last' [x] = x
last' (_:xs) = last' xs

last2 :: [a] -> a
last2 xs = xs!!(length xs - 1)

init' :: [a] -> [a]        -- liste ohne letztes Element.
init' [x] = []
init' (x:xs) = x:init' xs  -- Liefert Liste und somit x:ohneletztes xs das
                           -- x vorn an das Ergebnis des rekursiven Aufrufs anhängt.
elem' _ [] = False         -- überprüft, ob gegebenes Element in Liste vorhanden ist.
elem' y (x:xs) = (y==x) || elem' y xs

elementAt :: Int -> [a] -> a  -- (!!)
elementAt 0 (x:_) = x
elementAt n (_:xs) = elementAt (n-1) xs

fassezusammen :: [a] -> [a] -> [a]     -- concat : zwei Listen zusammenfassen 
fassezusammen [] ys = ys
fassezusammen (x:xs) ys = x:fassezusammen xs ys

listenZusammenfassen :: [[a]] -> [a]   -- Verschachelte Liste zusammenfassen mit ++ anstatt :
listenZusammenfassen [] = []
listenZusammenfassen (x:xs) = x ++ listenZusammenfassen xs

laengeListe :: [a] -> Int              -- length
laengeListe [] = 0
laengeListe (_:xs) = 1 + laengeListe xs

-- list Comprehensions
-- [a | a <-[1,2,3,4,5], mod a 2 == 0 ]            eine Bedingung
-- [a | a <-[1,2,3,4,5], mod a 2 /= 0, a /= 1 ]    zwei Bedingungen
-- [a*a | a<-[1,2,3,4,5]]

-- Lazy evaluation
quadrate :: [Int]
quadrate = [n*n | n <- [0 .. 100]]

primzahlen = sieb [2..40]
  where sieb (x:xs) = x:sieb [n|n <- xs, mod n x > 0]

nimm :: Int -> [a] -> [a]     -- take
nimm _ [] = []
nimm 0 _ = []
nimm n (x:xs) = x:nimm (n-1) xs

nimmnicht :: Int -> [a] -> [a]         -- drop
nimmnicht 0 xs = xs
nimmnicht _ [] = []
nimmnicht n (_:xs) = nimmnicht (n-1) xs

dreheUm :: [a] -> [a]     -- reverse
dreheUm [] = []
dreheUm (x:xs) = reverse xs ++ [x]


-- Tupel
erstesElement :: (a, b) -> a    -- fst / snd
erstesElement (x, _) = x

drittesElement :: (a, b, c) -> c
drittesElement (_, _, z) = z


-- Higher order functions  : Funktionen können auch andere Funktionen als Argumente erhalten.
listeUmwandeln :: (a -> Bool) -> [a] -> [Bool] -- Hugs > listeUmwandeln (\x -> x > 2) [1..4]
listeUmwandeln f xs = [f x | x <- xs]          -- [False , False, True , True]

mapListe :: (a -> b) -> [a] -> [b]
mapListe _ [] = []
mapListe f (x:xs) = (f x):mapListe f xs    -- Klammern (f x) wären nicht nötig.

filterListe :: (a -> Bool) -> [a] -> [a]
filterListe f [] = []
filterListe f (x:xs)
  | f x = x:filterListe f xs
  | otherwise = filterListe f xs
