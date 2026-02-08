sgn score =
 if score >= 90
  then "A"
  else if score >= 80
   then "B"
   else if score >= 70
    then "C"
    else "F"

sgnGuards score | score >= 90 = "A"
                      | score >= 80 = "B"
                      | score >= 70 = "C"
                      | otherwise = "F"

main = do
    putStrLn "Please enter a number"
    input <- getLine 
    let score = (read input :: Int)
    putStrLn( show (sgnGuards (score)) )
