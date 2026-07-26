""" A year that is divisible by 4 is leap year"""

sample = int(input("Enter Year: "))
"""
if (sample % 4 == 0):
    if (sample % 100 == 0):
        if(sample % 400 == 0):
            print(sample, " is a leap year.")
        else:     print(sample, " is not aleap year.")
    else:    print(sample, " is not aleap year.")
else:   print(sample, " is not aleap year.")

"""
if (sample % 100 == 0 ) and (sample % 400 == 0):
    print(sample, " is a leap year.")
elif(sample % 4 == 0) and (sample % 100 != 0):
    print(sample, " is a leap year.")
else: print(sample, " is not aleap year.")