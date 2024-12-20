
reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) = reverseList xs ++ [x]

main :: IO ()
main = do
    putStrLn "Enter a list of elements (space-separated):"
    input <- getLine
    let list = words input  
    let reversed = reverseList list
    putStrLn "Reversed list:"
    print reversed
