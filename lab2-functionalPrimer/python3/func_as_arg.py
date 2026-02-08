def listFunc() :
#creating a list of ints from a to b equivelent to task5 Haskell
    return [i for i in range(a, b)]

def applicatorFunc(inpFunc, s):
    if s== 's' :
        return sum(inpFunc(a, b))
    else:
        return sum (inpFunc(a, b))/5
    
print (applicatiorFunc(listFunc, 's'))