# Least squares fitting of a straight line to a set of data points
# Data in the format: {year: bbl/day * 10^6}
import numpy as np

data = {
    1994: 67052, 1995: 68008, 1996: 69803, 1997: 72024, 1998: 73400,
    1999: 72063, 2000: 74669, 2001: 74487, 2002: 74065, 2003: 76777
}

data = dict(map(lambda entry: (entry[0]-1994, entry[1]), data.items()))


b = [entry[1] for entry in data.items()]
A = [[1, entry[0]] for entry in data.items()]
# x represents the coefficients of the line
    

def transpose(A):
    return [[row[i] for row in A] for i in range(len(A[0]))]

def least_squares(A, b):
    A = np.array(A)
    b = np.array(b)
    
    return np.linalg.inv(transpose(A) @ A) @ transpose(A) @ b

# print result;
for i in least_squares(A, b):
    print(i)
    
# Plot the data and the line
import matplotlib.pyplot as plt
x = np.array([entry[0] for entry in data.items()])
y = np.array([entry[1] for entry in data.items()])

plt.plot(x, y, 'ro')
plt.plot(x, least_squares(A, b)[0] + least_squares(A, b)[1] * x)
plt.show()
# The line is a good fit for the data