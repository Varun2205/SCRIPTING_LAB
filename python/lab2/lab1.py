#!/usr/bin/python3

l = ["adder.sdc", "adder.v", "adder.txt", "mux.v", "mux.sdc"]

for i in l:
    if (i.endswith(".v")):
        print(i)