#here we will be removing blank spaces 

sample = input("Give input: ")
ans = str()
for i in sample:
    if (i != " "):
        ans += i
print(ans)

