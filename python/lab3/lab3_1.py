import re

file_name = "aes_ip_HVT_delay.log"
startpoint = None
endpoint = None
library = None
data_arrival_time = None
data_required_time = None
slack = None

with open(file_name, "r") as file:
    text = file.readlines()

    for line in text:

        if "Startpoint:" in line:
            startpoint = line.split(":")[1].strip()
        elif "Endpoint" in line:
            endpoint = line.split(":")[1].strip()
        elif "Library" in line:
            library=line.split(" ")[6].strip()
        elif "data arrival time" in line.lower():
            data_arrival_time = line[0]
            print(data_arrival_time)

