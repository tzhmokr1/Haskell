-- Currying: eine Funktion in gecurrieter Form erhält alle ihre Argumente auf einmal, also z. B. 
-- wenn wir x und y multiplizieren wollen, übergeben wir gleichzeitig x und y.

-- Higher-Order-Function: Eine Funktion, die als Parameter eine Funktion verarbeiten kann und 
-- auch eine Funktion zurück geben kann.

-- An expression is basically a piece of code that returns a value.

-- prefix/infix Funktionen

-- Reference Trancparency -> Funktion mehrmals aufrufen und das gleiche Reultat zurück erhalten.

-- Function application -> Funktion mit Klammern ausschreiben:
   is the same:
   ghci> succ 9 + max 5 4 + 1  
   16  
   ghci> (succ 9) + (max 5 4) + 1  
   16  

-- Prädikat  : Funktion, die für einen Eingabeparameter einen Bool zurückliefert.

-- Polymorphe Datentypen : Parameter, die als Platzhalter für unterschiedliche Datentypen verwendet werden, z.B.:  head :: [a] -> a

-- Overloaded Functions: Wenn eine Typenklasse vorhanden ist, und mehrere Typen akzeptiert, z.B.:  (+) :: Num a => a -> a -> a


!! Extractor
:: Assignement
: is actually 1:2:3:[]  -- : cons-Operator -> etwas an den Anfang einer Liste setzten.
x:xs
_:ys

null [1,2,3]
  False
error
head [_,2,3,4,5]
tail [1,_,_,_,_]
last [1,2,3,4,_]
init [_,_,_,_,5]
length
reverse
take
drop
maximum
minimum
sum
product
elem
sqrt
cycle
repeat
show
concat [[1,2,3], [5,6,7]]
[1,2,3,5,6,7]
div 6 3
2

fst
snd
zip [1,2,3] ['a','b','c']
[(1,'a'),(2,'b'),(3,'c')]


succ 8  
9 
pred 10
9
min 9 10  
9  
max 100 101  
101 



compare 10 5
GT

even 4
True

odd 3
True

any (1==) [0,1,2,3,4,5] 
True

and [True,True,False,True]
False

not True
False





foldr (+) 0 [1,2,3,4,5]
15

map (+10) [1..5]
[11,12,13,14,15]

filter (>5) [1..10]
[6,7,8,9,10]
filter (==3) [1,2,3,4,5]  
[3]
filter even [1..10] 
[2,4,6,8,10]

takeWhile (<5) [1..10]
[1,2,3,4]

dropWhile (<3) [1,2,3,4,5] 
[3,4,5]




(negate . abs) (-1)
-1

