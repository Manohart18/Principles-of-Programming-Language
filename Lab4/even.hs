filterEven :: [Int] -> [Int]
filterEven xs = filter odd xs

main :: IO ()
main = do
    putStrLn "Enter a list of numbers (space-separated):"
    input <- getLine
    let nums = map read (words input) :: [Int]
    let result = filterEven nums
    print result
