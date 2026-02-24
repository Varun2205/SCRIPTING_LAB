#!/usr/bin/python3

# portname = "A"
# portype = "input"
# prt1 = f"{portype} [3:0] {portname};"
# prt2 = portype + " [3:0] " + portname + ";"
# print(prt1,"\n",prt2,"\n")

# line = " set_clock_uncertainty 0.05 [get_clocks clk] "
# print(line.strip())

# sig = "data in bus" # extra spaces
# print(sig.replace(" ", ""))

# log = "INFO: Read netlist top.v successfully"
# print("netlist" in log) # True
# print(log.find("top.v")) # starting index
# # Robust check
# pos = log.find("ERROR")
# if pos == -1:
#     print("No errors in this line")

netlist_line = "NAND2_X1 u1 ( .A(a), .B(b), .Y(n1) ); NAND2_X1 u2 ( .A(n1), .B(c),.Y(y) );"
print(netlist_line.count("NAND2_X1")) # 2

netlist_line = "NAND2_X1 u1 ( .A(a), .B(b), .Y(n1) ); NAND2_X1 u2 ( .A(n1), .B(c),.Y(y) );"
print(netlist_line.count(".A")) # 2