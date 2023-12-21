module Tag7 where
data Numerus = Singular | Plural

drittePerson :: String -> Numerus -> String
drittePerson stamm num =
  case num of
    Singular -> stamm ++ "t"
    Plural -> stamm ++ "en"


zweitePerson :: String -> Numerus -> String
zweitePerson stamm Singular = stamm ++ "t"
zweitePerson stamm Plural = stamm ++ "en"


data BinTree a = Node (BinTree a) (BinTree a) | Leaf a
countLeaves :: BinTree a -> Integer
countLeaves (Leaf x) = 1
countLeaves (Node l r) = countLeaves l + countLeaves r
