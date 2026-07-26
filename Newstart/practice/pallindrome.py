#pallindrome is a text that is same from both directions like "radar"

print("want to check for number or alphabets")
check = int(input("for number press 1 & for alphabet press 2: "))
if (check == 1):
    i = str(input("give input: "))
    if (i == i[::-1]):
        print("it's a pallindrome")
    else: print("it's not a pallindrome")
elif (check == 2):
    i = str(input("give input: "))
    if (i == i[::-1]):
        print("it's a pallindrome")
    else: print("it's not a pallindrome")
else: print("give a valid input")



