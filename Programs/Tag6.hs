module Tag6 where

identitaet :: a -> a		-- Signature
identitaet = (\x -> x)


swap :: (a, b) -> (b, a)	-- Signature
swap = \pair -> (snd pair, fst pair)

-- ohne Lambda
-- swap :: (a,b) -> (b ,a )
-- swap pair = (snd pair,fst pair)


triEqual :: Integer -> Integer -> Integer -> Bool
triEqual a b c = a == b && b == c


enum :: Integer -> Integer -> [Integer]
enum lower upper = if lower == upper
	then [lower]
	else lower : enum (lower+1) upper
	

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)
