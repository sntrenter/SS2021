from cryptography.fernet import Fernet
from cryptography.hazmat.primitives.ciphers.algorithms import AES
import random
import string
import os
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
import time

def demo():
    key = Fernet.generate_key()
    print(key)
    print("key: ", key)
    f = Fernet(key)
    token = f.encrypt(b'attack at dawn')
    print("attack at dawn: ", token)
    print(token,"-decrypt->",f.decrypt(token))


def generate_files():
    #1 (2digit) hex => 8 bit
    one =  ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(128))#128
    two = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(1000))#1kb
    three = ''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(1000000))#1mb
    return (one,two,three)
    #Generate files of different lengths
    #file1,file2,file3 = generate_files()
    #print(len(file1))
    #text_file = open("file1.txt", "w")
    #n = text_file.write(file1)
    #text_file.close()
    #print(len(file2))
    #text_file = open("file2.txt", "w")
    #n = text_file.write(file2)
    #text_file.close()
    #print(len(file3))
    #text_file = open("file3.txt", "w")
    #n = text_file.write(file3)
    #text_file.close()

def readfile(filename):
    with open(filename,"r") as textfile: 
        return textfile.read()

def time_convert(sec):
  mins = sec // 60
  sec = sec % 60
  hours = mins // 60
  mins = mins % 60
  print("Time Lapsed = {0}:{1}:{2}".format(int(hours),int(mins),sec))

def AESTest(keylen,plaintext):
    key = os.urandom(keylen//8)
    iv = os.urandom(16)
    backend = default_backend()
    cipher = Cipher(algorithms.AES(key),modes.CBC(iv),backend)
    encryptor = cipher.encryptor()
    decryptor = cipher.decryptor()
    #ciphertext = b'this is text1111'
    if type(plaintext) != bytes:
        plaintext = plaintext.encode()
    while len(plaintext) % 16 != 0:
        plaintext = plaintext + b"0"
    
    print("showing first ten chars:")
    print("plaintext -> ciphertext -> plaintext")
    print(plaintext[:10].decode())
    ct = encryptor.update(plaintext) + encryptor.finalize()
    print(ct.hex()[:10])
    pt = decryptor.update(ct) + decryptor.finalize()
    print(pt[:10].decode())
    
    print("checking how many times I can")
    print("encode/decode in 1 second:")

    start = time.time()
    i = 0
    while True:
        encryptor = cipher.encryptor()
        decryptor = cipher.decryptor()
        ct = encryptor.update(plaintext) + encryptor.finalize()
        pt = decryptor.update(ct) + decryptor.finalize()
        if time.time() - start > 1:
            break
        i += 1
    print("Number of encryp/decrypts: ", i)
    print("############################################")


def main():
    print("#####Task1#####")
    demo()
    print("#####Task2#####")
    f1 = readfile("file1.txt")
    f2 = readfile("file2.txt")
    f3 = readfile("file3.txt")
    print("############################################")
    print("128bit")
    AESTest(128,f1)
    print("############################################")
    print("moderatly sized file")
    AESTest(128,f2)
    print("############################################")
    print("1mb")
    AESTest(128,f3)
    print("############################################")
    print("128bit")
    AESTest(256,f1)
    print("############################################")
    print("moderatly sized file")
    AESTest(256,f2)
    print("############################################")
    print("1mb")
    AESTest(256,f3)
    print("############################################")

    #generated a text file and tested to see how long it would take to decrypt using methods I used above
    print("how big of a file could you decrypt in one second? ", 306000000, " bytes")

    print("how long would it take me to decrypt a short message with brute force: ")
    print("2^256 / how many decryptions I was able to do in one second = number of seconds to try all keys")
    print("the above number / seconds in a year = number of years to brute force this")
    print("143,069,569,033,364,026,228,207,255,906,711,312,031,358,398,373,928,510,982,364,609,272 years")
    print("this number is so big I feel like it has to be wrong. But I'm also not doing anything to speed this up and it is a modern encryption standard, so It should be good at what it does.")
    print("I'm also not using a GPU, or my multiple cores, so I could probably cut down that number, but not enough to matter")



    


main()