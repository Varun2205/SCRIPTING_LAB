#!/usr/bin/python3

#val = ["VARUN", 24162019, "VLSI", 4]
#key; = ["NAME", "ROLL NO", "BRANCH", "SECTION"]

# Loop through keys
my_dict = {'name': 'John', 'age': 30, 'city': 'New York'}
for key in my_dict:
	print(key,end=" ")
# Loop through values
for value in my_dict.values():
	print(value,end=" ")
#Loop through key-value pairs
print()
'''
for key, value in my_dict.items():
	print(key, value)'''
print(f'{my_dict.items()}')
