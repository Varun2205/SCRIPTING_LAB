#!/usr/bin/python3
s = "module add(input A, input B, output sum);"

s = s.replace("add", "add_4bit", 1)

s = s.replace("input A", "input [3:0] A")
s = s.replace("input B", "input [3:0] B")

s = s.replace("output sum", "output [4:0] sum")

print(s)