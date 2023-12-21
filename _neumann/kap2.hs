module Neumann where

plus , minus :: Int -> Int -> Int
plus n m = n + m
minus n m = n - m

xor :: Bool -> Bool -> Bool
xor x y = x /= y 

and' :: Bool -> Bool -> Bool
and' a b = a == b

or' :: Bool -> Bool -> Bool
or' a b = a || b

not' :: Bool -> Bool -> Bool
not' a b = a /= b

mystic :: Int -> Int -> Int
mystic a b = div a 2 + (3*a - b)

zweiundvierzig :: Float -> Int
zweiundvierzig _ = 42

dekrementiere a = inkrementiere a - 2
 where
  inkrementiere :: Int -> Int
  inkrementiere a = a + 1
  
dekrementiere2 a = let inkrement a = a + 1
                   in inkrement a - 2

-- ohne Signatur
-- dekrementiere a = a - 1 
-- Typenklasse Num = Int, Integer, Float und Double (Overloaded)
-- dekrementiere :: Num a => a -> a (mit unbekanntem Parameter a)
 



-- Pattern matching
xor' True False = True
xor' False True = True
xor' _     _    = False

notC b = case b of
  True -> False
  False -> True

  
  

--Guards
xor2 :: Bool -> Bool -> Bool
xor2 x y
  | x && not (y) = True
  | not (y) && x = True
  | otherwise  = False

intbool :: Int -> Bool -> Int
intbool a b = if b then a else 0

greater :: Int -> Int -> Int
greater a b = if (a>b) then a else b




-- eigene Operator Definition
(#) :: Bool -> Bool -> Bool
(#) x y = (x || y) && (not (x && y))

-- Für selbstdefinierte Operatoren ist es möglich, die Assoziativität sowie
-- die Bindungsstärke festzusetzen.
infixr 8 .+.
infixr 7 .*.
(.+.) a b = a + b
(.*.) a b = a * b

-- Präfixschreibweise 	– Operatoren zu Funktionen    	(func) x y
-- Infixschreibweise	– Operatoren zu Funktionen		x 'func' y




-- Lamdda (namenlose Funktionen)
quadrat = \x -> x * x
fakultaetL = \n -> (if n==1 then 1 else (n*fakultaetL (n-1)))



-- Rekursion
fakultaet :: Int -> Int
fakultaet 0 = 1
fakultaet n
  | n > 0 = n * fakultaet (n-1) -- lineare Rekursion
  | otherwise = error "Eingabe muss eine natürliche Zahl sein"

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n 
  | n > 1 = fibonacci (n-1) + fibonacci (n-2) -- kaskadenförmige Rekursion:
  | otherwise = error "FEHLER"


ggT :: Int -> Int -> Int
ggT m n 
  | m > n     = ggT (m-n) n
  | m < n     = ggT m (n-m)
  | otherwise = m

