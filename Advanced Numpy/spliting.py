"""
np.split(array, number) #for equal spliting

np.vsplit
np.hsplit
"""

import numpy as np

arr = np.array([1,2,3,4,5,6,7,8])

updated_arr = np.split(arr,4)

print(updated_arr)