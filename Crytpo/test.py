import itertools
import string
alphas = string.ascii_lowercase


x = list(itertools.product(alphas,repeat=5))

for i in range(len(x)):
    x[i] = ''.join(x[i])
textfile = open("a_file.txt", "w")
for element in x:
    textfile.write(element + "\n")
textfile.close()
#print(x)