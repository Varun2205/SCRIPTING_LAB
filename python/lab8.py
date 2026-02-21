#!/bin/python3

a = int(input("Enter A: "))
b = int(input("Enter B: "))

def calc(a,b):
    if ((a*b)<=1000):
        return (a*b)
    return (a+b)


print(f'After calculation: {calc(a,b)}')
