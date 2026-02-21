#!/bin/python3

l = []

for i in range(24):
    l.append(int(input(f'Enter {i+1} element: ')))

print("Divisible by 3: ")
for i in l:
    if (i%3==0):
        print(i, end=" ")
print()
