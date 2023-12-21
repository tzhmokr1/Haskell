module Tag8 where

data Align = L | C | R
data Entry = Entry String
data Row = Row [Entry]
data Column = Column [Entry]


spaces :: Int -> String
spaces 0 = ""
spaces n = ' ' : spaces (n-1)


formatEntry :: Align -> Int -> Entry -> String
formatEntry C width (Entry entry) =
  let
    { n = width - length entry }
  in
    spaces (div n 2) ++ entry ++ spaces (div (n+1) 2)



div :: Integral a => a -> a -> a
div n 2 + div (n+1) 2 == n



columnWidths :: [Row] -> [Int]




transposeTable :: [Row] -> [Column]
transposeTable [] = []
transposeTable [Row es] = map (\e -> Column [e]) es



test1 = formatTable [R,L,L]
  [Row [Entry "Funktionsname"
    ,Entry "Typ"
    ,Entry "wann"
	]
  ,Row [Entry "sum"
    ,Entry "Num a => [a] -> a"
    ,Entry "Tag 4"
    ]
  ,Row [Entry "null"
    ,Entry "[a] -> Bool"
    ,Entry "Tag 5"
    ]
  ,Row [Entry "foldr"
    ,Entry "(a -> b -> b) -> b -> [a] -> b"
    ,Entry "noch nicht"
    ]
  ]