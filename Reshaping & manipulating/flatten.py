"""
.ravel() -> it only changes the view of array same like .reshape
.flatten() -> it creates a copy of original array so npthing chnges in original array

"""
import numpy as np 

arr = np.array([[1,2,3],[4,5,6]])

print(arr.ravel())
print(arr.flatten())

