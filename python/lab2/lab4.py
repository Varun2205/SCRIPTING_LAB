#!/usr/bin/python3

s = "addr[15:0]"
bus = s.split("[")[0]
msb = s.split("[")[1].split("]")[0].split(":")[0]
lsb = s.split("[")[1].split("]")[0].split(":")[1]

# print(s.split("[")[1].split("]")[0].split(":"))

print(f"BUS NAME: {bus}\nMSB: {msb}\nLSB: {lsb}")