# it should not be divisible by any number

n = int(input("number: "))

if (n>1):
    if (n == 2) or (n == 3) or (n ==5):
        print("It's a Prime Number")
    elif (n % 2 != 0) and (n % 3 != 0 ) and (n % 5 != 0) :
        print("It's a Prime Number")
    else: print("It's not a Prime Number")
else: print("It's not a Prime Number")