#!/usr/bin/python

import sys

if len(sys.argv[1]) > 2:
    
    ascii = [ord(c) for c in sys.argv[1]] #Converts the fist 3 characters to ascii
    
    s = str(ascii[0]%10) + str(ascii[1]%10) + str(ascii[2]%10) #Puts them together
    
    i = (int(s)%125) #There are 125 different files.
    
    if i < 0:
        i = 1
    elif i > 125:
        print("Something whent wrong contact us")
    print("Your file is: ")
    print(i)
else:
    print("Your user name is too short")
