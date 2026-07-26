# 3! = 1*2*3 = 6

n = int(input("Number: "))
m = n
sum = 1
if (n >1):    
    while (n > 1):
        sum *= n 
        n -=1
    print("Factorial of: ",m,"is ",sum)
elif (n == 0) or (n == 1):
    print("Factorial is 1")
