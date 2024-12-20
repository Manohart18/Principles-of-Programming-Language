swapTuple :: (a, b) -> (b, a)
swapTuple (x, y) = (y, x)

main :: IO ()
main = do
    -- User Input
    putStrLn "\nInput: Please enter two elements separated by space to form a tuple."
    input <- getLine
    
    let inputs = words input
    
    if length inputs /= 2
        then putStrLn "\nError: You must enter exactly two elements."
        else do
            let (x:y:_) = inputs  
                originalTuple = (x, y)
                swappedTuple = swapTuple originalTuple
            
            putStrLn $ "Swapped tuple: " ++ show swappedTuple
