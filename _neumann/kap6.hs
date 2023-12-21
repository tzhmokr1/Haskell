module Neumann6 where

summe :: Num a => [a] -> a  -- sum []
summe [] = 0
summe (x:xs) = x + summe xs

produkt :: Num a => [a] -> a -- product []
produkt [] = 1
produkt (x:xs) = x * produkt xs


-- Folds  : Bei einer Faltung werden die Elemente einer Liste mit Hilfe eines Operators zusammengefasst.

                                                  --    f x1 (f x2 (. . . (f xn s) . . . ))
faltenRechts :: (b -> a -> a) -> a -> [b] -> a    -- foldr  : z.B.:   foldr (+) 0 [1,2,3,4,5]
faltenRechts _ s [] = s
faltenRechts f s (x:xs) = f x (faltenRechts f s xs)

summeListe :: [Int] -> Int       -- sum[] mit foldr
summeListe (x:xs) = foldr (+) 0 xs

concat' :: [[a]] -> [a]
concat' = foldr (++) []

mapFaltung :: (a -> b) -> [a] -> [b]
mapFaltung f = faltenRechts ((:).f) []  -- Durch die Funktionskomposition ((:).f) wird zunächst
  -- die Funktion f auf das Listenelement angewendet und die erhaltenen Resultate anschließend mit 
  -- dem Operator (:) zu einer neuen Liste zusammengefügt

and', or' :: [Bool] -> Bool
and' = foldr (&&) True
or' = foldr (||) False




--ZIP
zippe :: [t] -> [u] -> [(t,u)]           -- zip
zippe (x:xs) (y:ys) = (x,y):zippe xs ys
zippe _ _ = []




-- Funktionskompositionen:
-- Wenn wir die Resultate einer Funktion als Eingabe in eine neue Funktion verwenden
-- möchten, können wir diese beliebig verschachteln (mit . Operator):

--		Neumann6 > (inkrementiere.dekrementiere) 5
--		5
--		*Neumann6> (negate.abs) (-1)
--		-1
--		*Neumann6> (reverse.take 3) [1..10]
--		[3,2,1]


-- Operator $ : wir sparen die Klammern:
-- 		Hugs > f(g(x))
-- 		...
-- 		Hugs > (f.g) x
-- 		...
-- 		Hugs > f.g $ x
-- 		...
-- 		Hugs > f $ g $ x
-- 		...



-- Currying  : alle Funktionen in Haskell werden entweder konstant oder exakt mit einem
-- Argument erwartet. Verwenden wir eine Funktion mit n Argumenten, so konsumiert diese zunächst nur
-- ein einzelnes Argument. Statt des endgültigen Ergebnisses, das wir eigentlich berechnen wollen,
-- wird dann eine Funktion zurückgeliefert, die noch n−1 Argumente erwartet. Sie kann dann ein 
-- weiteres Argument konsumieren usw., bis das erwartete Ergebnis vollständig berechnet ist. Dieses
-- Verhalten wurde nach demMathematiker Haskell Brooks Curry mit Currying bezeichnet.

--		curry :: ((a, b) -> c) -> a -> b -> c
--		curry f x y = f (x, y)

--		uncurry :: (a -> b -> c) -> ((a, b) -> c)
--		uncurry f p = f (fst p) (snd p)
--		Die Funktion curry wandelt Funktionen in der Weise um, dass sie Tupel erwarten,
--		uncurry kehrt diese Transformation um.
