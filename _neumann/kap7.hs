module Neumann7 where



-- type
type Name = String
type Adresse = String
type Adressbuch = [(Name , Adresse)]
eintrag :: Name -> Adressbuch -> Adresse
eintrag name ((n,a):r)
  | name == n = a
  | otherwise = eintrag name r
eintrag _ [] = error "nicht enthalten"




-- data

data Einfach = Wert deriving Show
f :: Einfach -> String
f Wert = "Das ist ein Wert"

data Wochenende = Sonntag | Samstag deriving Show
f2 :: Wochenende -> Int
f2 Sonntag = 23
f2 Samstag = 42

data Box = B Int deriving Show  -- nicht monomorph   B ist ein Datenkonstruktor
tueRein :: Int -> Box
tueRein = B
nimmRaus :: Box -> Int
nimmRaus (B n) = n


data MultiBox = Y Int Float String   -- hat keine Typenparameter
-- *Neumann7> :kind MultiBox
-- MultiBox :: *

data Box2 a = Z a  -- Box ist in diesem Beispiel eine Abbildung von einem beliebigen
                  -- Typen a zu einem Typen in einer Box.
-- *Neumann7> :kind Box2
-- Box2 :: * -> *

data Tupel a b = P a b
fst (P a _) = a
snd (P _ a) = a

-- data Maybe a = Just a | Nothing
teilen :: Int -> Int -> Maybe Int
teilen n 0 = Nothing
teilen n m = Just (div n m)

data Eintrag = E {
 vorname :: String,
 nachname :: String,
 strasse :: String,
 stadt :: String,
 land :: String }

data Saison = Fruehling | Sommer | Herbst | Winter
 deriving(Eq, Ord, Enum, Show, Read, Bounded)         -- diese Ableitungen möglich
 
 
minimum :: Ord a => [a] -> a  -- Typen Einschränkung
minimum = foldl1 min
 
-- Seite: 93