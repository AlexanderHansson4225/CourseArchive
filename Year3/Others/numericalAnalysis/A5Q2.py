# Implement Gram Smith orthogonalization
import numpy as np

# Define the matrix
matrix = np.array([
    [4, 2, 3, 0],
    [-2, 3, -1, 1],
    [1, 3, -4, 2],
    [1, 0, 1, -1],
    [3, 1, 3, -2]
])

A_examp = np.array([[-4, -4, 1], [-2, 7, 0], [4, -5, 0]])

# Also useful to get the columns
def transpose(A):
    return [[row[i] for row in A] for i in range(len(A[0]))]

def QR_factorization(A):
    m, n = A.shape
    Q = np.zeros((m, n))
    R = np.zeros((n, n))

    for j in range(n):
        v = A[:, j]
        for i in range(j):
            R[i, j] = np.dot(Q[:, i], A[:, j])
            v = v - R[i, j] * Q[:, i]
        R[j, j] = np.linalg.norm(v)
        if j == 3:
            print("this is norm_2 y3: ", R[j, j])
        Q[:, j] = v / R[j, j]

    return Q, R


    
            
for i in QR_factorization(matrix):
    print("..............")
    print(i)
    


