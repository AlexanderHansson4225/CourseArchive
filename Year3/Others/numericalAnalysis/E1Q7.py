TOLERANCE = 1/2 * 10**(-8)
g = lambda x: (2*x + 2)**(1/3)

def solve(x):
    # Fixed point iteration
    next = g(x)
    if abs(next-x) < TOLERANCE:
        return next
    else:
        return solve(next)
    
    
print(solve(1))