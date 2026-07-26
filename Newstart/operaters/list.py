"""
num = [10,20,22,25]
sum = 0
for i in num:
    sum += i
print(sum)

"""
sample = list(map(int, input("Give sample input for list: ").split()))
#sample = list(input("Give sample input for list: ")).split()
target = int(input("Give the target: "))


"""
j= 0
for i in sample:
    sam[j] = i
    j += 1
"""
"""for i in sample:
    if (target == i):
        print("Target found at: ",j)
    j += 1
print("target not found")    

"""

if target in sample:
    print("target found at: ", sample.index(target))
else: print("target not found")

