#vowels are A,E,I,O,U
count = 0
sample = (input("give input: "))
for i in sample:
    if (i == "A" or i == "a"):
        count +=1
    elif(i == "E" or i == "e"):
        count +=1
    elif(i == "I" or i == "i"):
        count +=1
    elif(i == "O" or i == "o"):
        count +=1
    elif(i == "U" or i == "u"):
        count +=1
print("There are ",count," in the given input.")  

