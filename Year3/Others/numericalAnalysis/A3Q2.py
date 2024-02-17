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

A = INIT
for _ in range(25):
    A = NEXTITER(A)

print(NormTwo(A)) # 0.38573062068606473
# 0.3857