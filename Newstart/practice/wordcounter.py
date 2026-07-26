#calculating words withought spaces

sample = input("give input: ")
count = 0
for i in sample:
    if (i != " "):
        count +=1
print(count)

