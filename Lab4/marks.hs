averageMarks :: (String, Int, [Int]) -> Float
averageMarks (_, _, []) = 0  -- Base case: if the list of marks is empty, average is 0
averageMarks (_, _, marks) = fromIntegral (sum marks) / fromIntegral (length marks)

displayStudentsAverage :: [(String, Int, [Int])] -> IO ()
displayStudentsAverage [] = return ()  
displayStudentsAverage ((name, rollNo, marks):xs) = do
    let avg = averageMarks (name, rollNo, marks)
    putStrLn $ "Student: " ++ name ++ ", Average Marks: " ++ show avg
    displayStudentsAverage xs  -- Recursive call to process the rest of the list

readMarks :: IO [Int]
readMarks = do
    putStrLn "Enter marks separated by spaces:"
    input <- getLine
    return $ map read (words input)

readStudent :: IO (String, Int, [Int])
readStudent = do
    putStrLn "Enter student name:"
    name <- getLine
    putStrLn "Enter student roll number:"
    rollNo <- readLn
    marks <- readMarks
    return (name, rollNo, marks)

readStudents :: IO [(String, Int, [Int])]
readStudents = do
    putStrLn "Enter number of students:"
    n <- readLn
    students <- readStudentsHelper n
    return students

readStudentsHelper :: Int -> IO [(String, Int, [Int])]
readStudentsHelper 0 = return []
readStudentsHelper n = do
    student <- readStudent
    rest <- readStudentsHelper (n - 1)
    return (student : rest)

main :: IO ()
main = do
    students <- readStudents
    displayStudentsAverage students
