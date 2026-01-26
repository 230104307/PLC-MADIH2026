module Main where

main =
    do
    print (myFunc1 5)
    print (myFunc2 10)      --print (MyFunc2 10)
    print (thirdFunc)      --print (3rdFunc)

myFunc1 x = x*10
myFunc2 x = x*2             --MyFunc2 x = x*2
thirdFunc = "Hello this is 3rd Func"        --3rdFunc = "Hello, this is 3rd Func"