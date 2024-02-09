import numpy as np
from scipy.misc import derivative

def newton_raphson(f, x0, tol=1e-6):
    while abs(f(x0)) > tol:
        x0 = x0 - f(x0) / derivative(f, x0)
    return x0

def f(x):
    return x**3 - 6*x**2 + 4*x + 12

def g(x):
    return (np.e)**(np.sin(x)**3)+x**6 - 2*x**4 - x**3 - 1
    

# a
#result = newton_raphson(f, -1)

# b
#result = newton_raphson(g, 2)

# c
# s_1 = -1.19; g'(s_1) != 0. Single root. Quadratic convergence.
# s_2 = 0; g'(s_2) = g''(s_2) = g'''(s_2) = 0. g^(4)(s_2) != 0. 
# Four roots. Linear convergence. Quadratic convergence can be achive with m = 4 before f/f'
# s_3 =1.53; g'(s_3) != 0. Single root. Quadratic convergence.

# d



rounded_result = round(result, 4)
print(rounded_result)