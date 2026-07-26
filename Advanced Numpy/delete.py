"""
.delete(array, index, axis)
"""

import numpy as np
arr = np.array([[1,2,3],[4,5,6]])

updated_arr = np.delete(arr, 1,axis = 0)
print(updated_arr)