from hashlib import sha256 as sha
from hashlib import blake2b
#from random import randbytes #only in 3.9 :(
from secrets import token_bytes
from hextobinconvtable import HEX_TO_BINARY_CONVERSION_TABLE
import time


def hex_to_binary(hex_string):
    binary_string = ""
    for character in hex_string:
        binary_string += HEX_TO_BINARY_CONVERSION_TABLE[character]
    return binary_string

def readfile(filename):
    with open(filename,"r") as textfile: 
        return textfile.read()

def sha256test(text):
    m = sha()
    m.update(str.encode(text))
    output = m.digest()
    print("hex: ")
    print(output.hex())
    print("binary: ")
    print(hex_to_binary(output.hex()))

    print("checking how many times I can")
    print("hash in 1 second:")

    start = time.time()
    i = 0
    while True:
        m = sha()
        m.update(str.encode(text))
        m.digest()
        if time.time() - start > 1:
            break
        i += 1
    print("Number of hash: ", i)
    print("compair to black2b")
    start = time.time()
    i = 0
    while True:
        m = blake2b()
        m.update(str.encode(text))
        m.digest()
        if time.time() - start > 1:
            break
        i += 1
    print("Number of hash (black2b): ", i)

def findbday(l):
    currenthex = ""
    bytestring = b""
    totalTime = time.time()
    print("####################")
    for i in l:
        start = time.time()
        while i != currenthex[:len(i)]:
            
            #print(currenthex[:len(i)])
            m = sha()
            bytestring = token_bytes(128)
            m.update(bytestring)
            output = m.digest()
            currenthex = output.hex()
        print("time it took: ",round(time.time() - start,4), " seconds!")
        print("overall time: ",round(time.time() - totalTime,4), " seconds!")
        print("digits we want:",i)
        print("sha output: ", currenthex)#[:10])
        print("bytestring: ",bytestring)#[:10])
        print("####################")
    print("total time it took: ",round(time.time() - totalTime,4), " seconds!")

            



def task1():
    print("----------TASK1----------")
    print("3 files -> 112 bit, 1024 bit, 8,000 bit")
    f0 = readfile("file0.txt")
    f1 = readfile("file1.txt")
    f2 = readfile("file2.txt")
    l = [f0,f1,f2]
    #sha256test("1")
    for i in l:
        print("########################################")
        print("number of chars: ", len(i))
        sha256test(i)
    print("black2b seems like it is faster, although after reading docs it seems to be optimised for use like this.")
    print("on the shortest string it would take")
    print("seconds: 116,132,473,517,195,094,244,802,501,139,527,864,022,720,578,681,756,793,200,327,744,627,416,086.18855465368996528825")
    print("Days: 1,344,125,850,893,461,738,944,473,392,818,609,537,300,006,697,705,518,439,818,608,155,409.90840496012330659682")
    print("centurys: 13,441,258,508,934,617,389,444,733,928,186,095,373,000,066,977,055,184,398,186,081,554.09908404960123306596")
    print("this timescale makes anything you do seem insignificant")
    print("CPU: Intel Core i5-6600k @3.5GHz")
    print("one core, multiprocessing wouldn't do much :(")

def task2():
    print("----------TASK2----------")
    #print("hash outputs + bytestrings have been shorted for readability")
    #bday = "11051996" 
    bday = "1105199"
    bdaylist = []
    for i in range(len(bday)):
        bdaylist.append(bday[:i+1])
    print(bdaylist)
    findbday(bdaylist)
    print("lets think of sha256 as outputing 64 hex digits instead of the bits it does output")
    print("for each character \"n\" characters it wants to guess right it has to generate 16^n guesses (maximum)")
    print("for the first few this doesn't matter but for only 6 characters it has a possible of 16777216 different combinations with only one being right")
    print("I've found that it would take too long to find to find the full birthday text so I've subbed a shorter bit of it in.")
    print("it should be a number small enough that with multiprocessing I should be able to calculate it in a reasonable time")
    print("my estimations are all overthe place but it seems like it would take like 35 min for 6 digits")
    print("it seems like sometimes while running it I get lucky and generate a hash that matches the text fairly quickly")

def main():
    task1()
    task2()
main()