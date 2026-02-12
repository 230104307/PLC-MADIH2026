module Main where

import System.IO (hSetBuffering, stdout, BufferMode(..))

main :: IO ()
main = do
    initialiseIO
    -- 1. Show the user what they can type (The "Symptoms")
    putStrLn ("known results = " ++ show allErrors)
    
    -- 2. Get the input and save it to variable 'e' (short for input error/symptom)
    -- Your mistake was here: You named it 'results' but used 'error' later.
    e <- getElement "result" 
    
    -- 3. Calculate the cause using your conversion function
    -- We use 'e' (the input) and pass it to error2Result
    putStrLn (show e ++ " results from: " ++ show (error2Result e))

initialiseIO :: IO ()
initialiseIO = do
    hSetBuffering stdout NoBuffering

-- Your Data types were named a bit confusingly vs the question, but the logic works.
-- Result = The underlying cause (e.g., Overflow)
data Result = FP_Rounding | FP_Overflow | FP_Underflow | Int_Overflow
    deriving (Show, Read, Eq, Bounded, Enum) 

-- Error = The visible symptom (e.g., Infinity)
data Error = Zero | Infinity | ABitDifferent | VeryDifferent
    deriving (Show, Read, Eq, Bounded, Enum) 

allErrors :: [Error]
allErrors = [minBound .. maxBound]

-- This function maps the Symptom (Error) to the Cause (Result)
error2Result :: Error -> Result
error2Result ABitDifferent = FP_Rounding
error2Result Infinity      = FP_Overflow
error2Result Zero          = FP_Underflow
error2Result VeryDifferent = Int_Overflow

-- Standard helper functions provided in your lab
getElement :: String -> IO Error
getElement elementTypeName = do
    putStr ("Input one " ++ elementTypeName ++ ": ")
    line <- getLine
    case parseElement line of
        Just element -> return element
        Nothing -> do
            putStrLn ("Invalid " ++ elementTypeName ++ ", try again")
            getElement elementTypeName

parseElement :: String -> Maybe Error
parseElement line =
    case reads line of
        [] -> Nothing
        ((e,_) : _) -> Just e