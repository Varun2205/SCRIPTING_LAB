#!/usr/bin/python3

s = "module add(input A, input B, output sum);"
module_name = s.split()[1].split("(")[0]
# print(module_name)

port_section = s[s.find("(")+1 : s.find(")")]
ports = port_section.split(",")
# print(port_section)
# print(ports)

input_ports = []
output_ports = []

# print(ports[0].replace("input", ""))

for port in ports:
    port = port.strip()
    # print(port)
    if port.startswith("input"):
        input_ports.append(port.replace("input", "").strip())
    elif port.startswith("output"):

        output_ports.append(port.replace("output", "").strip())

print("Module Name:", module_name)

print("Number of input ports:", len(input_ports))
print("Input Ports:", input_ports)

print("Number of output ports:", len(output_ports))
print("Output Ports:", output_ports)
