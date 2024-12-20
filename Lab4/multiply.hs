multiplyElements :: Num a => [a] -> a -> [a]
multiplyElements list n = [x * n | x <- list]

main :: IO ()
main = do
    let numbers = [1, 2, 3, 4]
    let multiplier = 2
    
    let result = multiplyElements numbers multiplier
    
    putStrLn $ "Original List: " ++ show numbers
    putStrLn $ "Multiplier: " ++ show multiplier
    putStrLn $ "Resulting List: " ++ show result
