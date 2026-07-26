"""
np.inserting(array, index, value, axis)
array = original array
index = index no. at which we are going to insert 
value = value we are going to inser
axis -> 0 - for row-wise
     -> 1 - for column-wise

"""
import numpy as np

arr = np.array([10,20,30,40,50,60])

print(arr)
updated_array = np.insert(arr,3,102)
print(updated_array)



