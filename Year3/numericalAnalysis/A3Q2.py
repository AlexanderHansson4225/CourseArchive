from sympy import Matrix
from sympy import symbols
import numpy as np

x1, x2, x3, x4 = symbols('x1 x2 x3 x4')
b = Matrix([1, 1, 1, 1])

INIT = Matrix([0, 1, 1, 0])

A = matrix = Matrix([
    [3, 1, 1, 0],
    [1, 6, 3, -1],
    [6, 0, 9, -2],
    [1, 0, -1, -7]
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
    DINV = D.inv()
    return -DINV @ (L + U) @ x + DINV @ b
    
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

result = run(25)

print(result[24])
rounded_result = result[24].applyfunc(lambda x: round(x, 2))
print(rounded_result)


print(NormTwo(result[24])) # 0.39612688745557917


