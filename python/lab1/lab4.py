#!/bin/python3

a = int(input("Enter first number: "))
b = int(input("Enter second number: "))

count = 0

if b == 0:
    print("Division by zero is not allowed.")
elif a == 0:
    print("0 can be divided infinite times by any non-zero number.")
else:
    while a % b == 0:
        a = a // b
        count += 1

    if count > 0:
        print("A is purely divisible by B.")
        print("It can be divided", count, "time(s).")
    else:
        print("A is not purely divisible by B.")
