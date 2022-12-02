
main = do
    content <- readFile "input.txt"
    let rounds = lines content

    let score1 = sum $ map scoreStrategy1 rounds
    let score2 = sum $ map scoreStrategy2 rounds

    print score1
    print score2

scoreStrategy1 :: String -> Int
scoreStrategy1 (oponent:' ':selection:_) = scoreOutcome oponent selection + scoreSelection selection
scoreStrategy1 _ = error "Invalid round"

scoreSelection :: Char -> Int
scoreSelection 'X' = 1 
scoreSelection 'Y' = 2 
scoreSelection 'Z' = 3 
scoreSelection _ = error "Invalid selection"

scoreOutcome :: Char -> Char -> Int
scoreOutcome 'A' 'Y' = 6
scoreOutcome 'B' 'Z' = 6
scoreOutcome 'C' 'X' = 6
scoreOutcome 'A' 'X' = 3
scoreOutcome 'B' 'Y' = 3
scoreOutcome 'C' 'Z' = 3
scoreOutcome 'A' 'Z' = 0
scoreOutcome 'B' 'X' = 0
scoreOutcome 'C' 'Y' = 0
scoreOutcome _ _ = error "Invalid round"

---------------------------------------------

scoreStrategy2 :: String -> Int
scoreStrategy2 (oponent:' ':outcome:_) = scoreOutcome oponent choice + scoreSelection choice
    where choice = determineSelection oponent outcome
scoreStrategy2 _ = error "Invalid round"

determineSelection :: Char -> Char -> Char
determineSelection 'A' 'X' = 'Z'
determineSelection 'B' 'X' = 'X'
determineSelection 'C' 'X' = 'Y'
determineSelection 'A' 'Y' = 'X'
determineSelection 'B' 'Y' = 'Y'
determineSelection 'C' 'Y' = 'Z'
determineSelection 'A' 'Z' = 'Y'
determineSelection 'B' 'Z' = 'Z'
determineSelection 'C' 'Z' = 'X'
determineSelection _ _ = error "Invalid round"
