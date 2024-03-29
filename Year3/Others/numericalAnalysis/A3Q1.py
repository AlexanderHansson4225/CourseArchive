from sympy import symbols, Matrix
import numpy as np

x1, x2, x3 = symbols('x1 x2 x3')
r = Matrix([1, 1, 1])
START = Matrix([1, 2, 3])


def f(x1, x2, x3):
    return Matrix([
        x1**2 - 2*x1 + x2**2 - x3 + 1,
        x1*x2**2 - x1 - 3*x2 + x2*x3 + 2,
        x1*x3**2 - 3*x3 + x2*x3**2 + x1*x2
    ])
    
def Jacobian(a, b, c):
    jacobian_matrix = f(x1, x2, x3).jacobian([x1, x2, x3]).subs({x1: a, x2: b, x3: c})
    return jacobian_matrix.inv()

def NEXTITER(M):
    x1, x2, x3 = M[0], M[1], M[2]
    return Matrix([x1, x2, x3]) - Jacobian(x1, x2, x3) @ f(x1, x2, x3)


def NormTwo(n):
    n_numpy = np.array(n, dtype=float)  
    return np.linalg.norm(n_numpy, 2)

def error(x):
    return NormTwo(r-x)

iterations = [START]

def run(numIterations):
    for i in range(1, numIterations):
        next_iteration = NEXTITER(iterations[i-1])
        iterations.append(next_iteration)
    return iterations


A = START
for _ in range(6):
    A = NEXTITER(A)

B = START
for _ in range(5):
    B = NEXTITER(B)

error_ratio = error(A) / error(B)
print(error_ratio) # 0.2082442422257944
# 0.2082
