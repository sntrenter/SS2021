import math
relative = 0
for i in range(1,13):
    print(i,":",end="")
    print ("The gcd of 21 and ",i," is : ",end="")
    print (math.gcd(21,i),end="")
    if(math.gcd(21,i) == 1):
        print(" this is relative")
        relative += 1
    else:
        print()
print("ϕ(n) = ",relative)