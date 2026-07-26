"""sample = "SAMPLE"
i = 0
print(len(sample))
while (i < len(sample)):
    print(sample[i])
    print(i)
    i += 1"""

"""slicing"""

sample = "SAMPLE"
print(sample[0:4:2])
#  sample[start:stop:step] & if we don't provide start it will start from 0 and
#  if we don't provide stop it will go till the end of the string and 
# if we don't provide step it will take step as 1 by default $ if we provide negative step it will reverse the string
print(sample[::-1])