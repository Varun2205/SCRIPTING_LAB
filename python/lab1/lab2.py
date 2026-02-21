#!/bin/python3
a = int(input("Enter 1st number: "))
b = int(input("Enter 2nd number:"))

if (a>b):
    print(f'{a}>{b}')
elif (a<b):
    print(f'{a}<{b}')
else:
    print(f'{a}={b}')
