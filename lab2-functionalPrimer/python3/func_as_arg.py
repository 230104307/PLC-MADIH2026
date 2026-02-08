def listFunc(a, b) :
#creating a list of ints from a to b equivelent to task5 Haskell
    return [i for i in range(a, b+1)]

def applicatorFunc(inpFunc, s, a , b):
    if s== 's' :
        return sum(inpFunc(a, b))
    else:
        return sum (inpFunc(a, b))/(b-a+1)
    
print (applicatorFunc(listFunc, 'a' , 1, 10))