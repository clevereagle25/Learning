import numpy as np

arr = np.array([[1,2],[3,4]])
print(arr)
updated_array = np.insert(arr,1,[5,6], axis=1)
print(updated_array)