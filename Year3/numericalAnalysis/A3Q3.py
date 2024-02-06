from sympy import Matrix
import numpy as np

INIT = Matrix([2, 1, 1, 1])
b = Matrix([1, 1, 1, 1])

A = Matrix([
    [15, -5, 1, 1.1],
    [0, 5, 2, -1],
    [2, -1, 9, -1],
    [1, 1.1, -1, -6]
])

def decompose_LDU(A):
    n = A.shape[0]
    L = Matrix.zeros(n)
    D = Matrix.zeros(n)
    U = Matrix.zeros(n)

    for i in range(n):
        for j in range(n):
            if i == j:
                D[i, i] = A[i, i]  
            elif i < j:
                U[i, j] = A[i, j]
            else:
                L[i, j] = A[i, j]  

    return L, D, U


L, D, U = decompose_LDU(A)

def NormTwo(n):
    n_numpy = np.array(n, dtype=float)
    return np.linalg.norm(n_numpy, 2)


def NEXTITER(x):
    return -(L + D).inv() @ U @ x +  (L + D).inv() @ b
    
iterations = [INIT]
def run(numIterations):
    for i in range(1, numIterations):
        next_iteration = NEXTITER(iterations[i-1])
        iterations.append(next_iteration)
    return iterations

def roundToNDecimals(Matrix, N):
    for i in range(len(Matrix)):
        for j in range(len(Matrix[0])):
            Matrix[i][j] = round(Matrix[i][j], N)
    return Matrix


result = run(10)

print(result[9])
rounded_result = result[9].applyfunc(lambda x: round(x, 2))
print(rounded_result)
print(NormTwo(result[9]))