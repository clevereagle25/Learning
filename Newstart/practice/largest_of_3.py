""" Largest of 3"""

sample1 = int(input("1st number: "))
sample2 = int(input("2st number: "))
sample3 = int(input("3st number: "))

if sample1 >= sample2 :
    if sample1 >= sample3:
        print("Largest number is: ", sample1)
elif sample2 >= sample1 :
    if sample2 >= sample3 :
        print("Largest number is: ", sample2)
else: print("Largest number is: ", sample3)