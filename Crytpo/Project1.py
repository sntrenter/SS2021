import re


#TODO  Write a function that will take in two strings and encrypt the first string with the second string using the Vigenere ciphere.
#The first string is the plaintext and your function should ignore all non-alphabetic characters (or your code can remove them from the string). All uppercase letters should be treated as lowercase letters (or you can convert the string to all lowercase letters). 
#The second string is the key and it should be able to be from 1 character long to even longer than the plaintext string itself.

def encrypt(msg = "Hello World!",key = "Default"):
    #remove all but lower alphanumerics
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
    print("message:")
    print(msg)
    print("key:")
    print(key)
    print("encrypted:")
    print(newString)
    return newString
    

#TODO Then write a function that, given two strings, decrypts the first string using the second string. Same conditions should apply as before.
def decrypt(msg = "kiqli hhupi", key = "default"):
    #remove all but lower alphanumerics
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
    print("message:")
    print(msg)
    print("key:")
    print(key)
    print("decrypted:")
    print(newString)
    return newString
#TODO Once these functions are completed, have your main body prompt the user for a string to encode, then a key string, then perform the encryption of the plaintext and output the ciphertest.. Then decrypt it and show the resulting plaintext.





def main():
    encrypt()
    decrypt()
    #encrypt("abcdefghijkl mnopqrstuvwxyz","ab")
main()