main = do 
    putStrLn ("Wie heisst Du?")
    name <- getLine
    putStrLn ("Hallo, " ++ name)