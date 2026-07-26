#gives a count of how many times each word appeared

sample = input("Give a input: ")
count = 0
checked = str()
ans = str()
for i in sample:
    if (i != " "):
        ans += i
for i in ans:
    if i not in checked:
        for j in sample:
            if (i == j):
                count += 1
        checked += i
        print("frequency of ",i," is ", count)
        count = 0



