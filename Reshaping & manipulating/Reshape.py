"""
.reshape will only change the view of array and does not create a copy so i we change smtg later in array 
then it will change in original one too
to use .reshape give (rows and colums) it should match the original length of array
"""


import numpy as np

arr = np.array([1,2,3,4,5,6,7,8,9])
reshaped_arr = arr.reshape(3,3)

print(reshaped_arr)