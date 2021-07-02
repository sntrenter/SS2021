#Sam Trenter
#crypto
#done with python 3.7.6


import re
import itertools
import string


def encrypt(msg = "Hello World!",key = "Default"):
    #remove all but lower alphanumerics
    if len(key) == 0:
        print("no key, no encryption")
        return msg
    msg = re.sub(r'[^a-z ]','',msg.lower())
    key = re.sub(r'[^a-z ]','',key.lower())
    newString = ""
    offset = 97
    keypos = 0 
    for i in range(len(msg)):
        #print("##########",i,keypos,"###############")
        if(msg[i] == " "):
            newString = newString + " "
            continue
        #print(msg[i], key[i%(len(key))])
        num = ord(msg[i]) + (ord(key[keypos%len(key)]) - offset)
        if(num > 122):
            num = num - 26
        newString = newString + chr(num)
        keypos += 1
    #print("message:")
    #print(msg)
    #print("key:")
    #print(key)
    #print("encrypted:")
    #print(newString)
    return newString
    

#TODO Then write a function that, given two strings, decrypts the first string using the second string. Same conditions should apply as before.
def decrypt(msg = "kiqli hhupi", key = "default"):
    #remove all but lower alphanumerics
    if len(key) == 0:
        print("no key, no decryption")
        return msg
    msg = re.sub(r'[^a-z ]','',msg.lower())
    key = re.sub(r'[^a-z ]','',key.lower())
    newString = ""
    offset = 97
    keypos = 0 
    for i in range(len(msg)):
        #print("##########",i,keypos,"###############")
        if(msg[i] == " "):
            newString = newString + " "
            continue
        #print(msg[i], key[i%(len(key))])
        num = ord(msg[i]) - (ord(key[keypos%len(key)]) - offset)
        if(num < 97):
            num = num + 26
        newString = newString + chr(num)
        keypos += 1
    #print("message:")
    #print(msg)
    #print("key:")
    #print(key)
    #print("decrypted:")
    #print(newString)
    return newString
#TODO Once these functions are completed, have your main body prompt the user for a string to encode, then a key string, then perform the encryption of the plaintext and output the ciphertest.. Then decrypt it and show the resulting plaintext.

def decipher(msg = "",sub = "",keysize = 5):
    if keysize == "" or msg == "" or sub == "":
        print("give valid variables")
    keysize = int(keysize)
    alphas = string.ascii_lowercase
    i = 1
    print("trying to dycrypt")
    while i < keysize + 1:
        keys = list(itertools.product(alphas,repeat=i))
        print(len(keys))
        for j in range(len(keys)):
            keys[j] = ''.join(keys[j])

        for k in keys:
            if sub in decrypt(msg,k):
                print("possible solution:",k)
                print("decoded msg: ",decrypt(msg,k))

        if input("continue?(y/n):") == "n":
            break
        i+=1





def main():    
    print("encrypt")
    val1 = input("enter message to encrypt: ")
    val2 = input("enter key to encrypt with: ")
    val3 = encrypt(val1,val2)
    print("the encrypted msg: ", val3)
    print("decrypting")
    print("decrypted message: ",decrypt(val3,val2))

    print("decipher")
    msg = input("give cipher text: ")
    submsg = input("give substring that should exist: ")
    keysize = input("what is the max keysize: ")
    decipher(msg,submsg,keysize)


main()