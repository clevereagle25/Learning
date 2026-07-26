# fibonacchi series means the sum of last 2 numbers is 3rd number

i = 0
i1 = 1
i2 = 0
sum = 0

till = int(input("fibonacchi series till: "))

while(till >= i2):
    sum = i + i1
    print(i,i1,sum)
    i = i1
    i1 = sum
    i2 +=1





#0,1,1,2,3,5,8,13