# Backwards substitution - Nonworking
import numpy as np

# Assumes square, nxn U and R^n b
def backward_substitution(U: np.ndarray, b: np.ndarray) -> np.ndarray:
    n = len(U)-1
    x = np.zeros(n+1)
    for n in range(n*n):
        for i in range(n, 1, -1):
            x[i] = (1/U[i][i]) * (b[i] - sum(U, x, i, n))
        
    return x
    

def sum(U: np.ndarray, x: np.ndarray, i: int, n: int) -> int:
    total = 0
    
    for j in range(i+1, n, 1):
        total += U[i][j]*x[j]
        
    return total

print(backward_substitution(np.array([[1, 2], [3, 4]]), np.array([2, 3])))