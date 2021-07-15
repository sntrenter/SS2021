# m 	the modulus  	m > 0
#a 	the multiplier 		0 < a< m
#c 	the increment 	0≤ c < m
#X0 	the starting value, or seed 	0 ≤ X0 < m

def LCG(m,a,c,x):
    l = []
    i = 0
    newX = (a*x +c)%m
    while i < 200:
        l.append((a*newX +c)%m)
        newX = l[-1]
        i+=1
    print(l)


LCG(13,6,0,1)
#[10, 8, 9, 2, 12, 7, 3, 5, 4, 11, 1, 6, 10, 8, 9, 2, 12, 7, 3, 5]
LCG(13,7,0,1)
#[10, 5, 9, 11, 12, 6, 3, 8, 4, 2, 1, 7, 10, 5, 9, 11, 12, 6, 3, 8]