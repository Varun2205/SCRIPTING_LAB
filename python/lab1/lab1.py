#!/bin/python3

l1 = [1,2,3,4,5]
l2 = [6,7,8,9,10]
dict1 = {}
for i in range(len(l1)):
    dict1[l1[i]] = l2[i]

for i in range (len(dict1)):
    print(f'{l1[i]}:{l2[i]}')


'''
#Zip method
dict1 = dict(zip(l1,l2))
'''
