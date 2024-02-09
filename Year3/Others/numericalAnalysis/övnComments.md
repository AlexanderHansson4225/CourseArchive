# E1Q2
## Representing 0.4
1. 0.4 = 0.0110...0110
2. fl(0.4) != 1.1001...1001|1001 * 2^(-2)
    - DVS representerar alltid som 1.xxx
3. 53rd is 1 -> round up. gives 101 in the end
    - DECIMALER. Ej tal
4. **fl(0.4) = 1.1001...1010| * 2^(-2)**

## Representing 0.3

2. fl(0.3) != 1.0011...0011|0011 * 2^(-2)
3. 53rd is 0 -> truncate.
4. **fl(0.3) = 1.0011...0011 * 2^(-2)**



## Getting the subtraction
What is given is **`fl( fl(0.4)-fl(0.3) )`**
1. Flytta 1 till framsidan av fl(0.4)-fl(0.3)
    - Får en ny lägre potens.
2. Lös fl( fl(0.4)-fl(0.3) )
    - Avrunda vid behov

## Machine error
- 2^(-52)

# E1Q3
a) The error is 
|x(k)-r| <= (b-a) / 2^(2k + 1)
- a and b are bounds. 
- k is the iteration

b) 6 correct decimal places means error is less than 1/2*10^(-6)

Solve what k needs to be

# E1Q4
Fixed points definition: f(a)=a means `a` is a fixed point of `f(x)`

# E1Q5
## Sidenote: Map a fixed-point iteration problem to a root finding and vice versa
- Consider a problem f(r)=0
- can be solved by x=THETA(x)=x-f(x)

## Fixed point iteration
x_{k+1}=THETA(x_k)

## Speed of convergence
1/f'(r) is the speed. (ergo lower is better)
Also note that numbers lower than 1 means convergence happens.

# E1Q6
## Find all fixed points
1. x_{k+1} = THETA(x_k)
2. g(x) = 0.39 - x^2
3. Solve g(x) = x if possible

## To which points is the fixed point iteration locally convvergent
Tror enbart convergent till 0.3 eftersom |g'(0.3)| < 1 medans det samma gäller inte för den andra lösning x = -1.3

## Convergence rate
1. fixed point: |g'(0.3)|. Linear with a factor of |-2*0.3|
2. bisection: Alltid linear med 0.5 verkar det som

# E1Q7
## Problem to solve
x_{k+1} = THETA(x_k)

## Writing a program for deriving
- Use the diffenition or library

## Stopping criterion for fixed point iteration
**OKLART**

# E2Q2: Newton raphson
## Finished?
When f'(x_k) = 0, we are finished
Alternativly if x_{k+1} is the same as x_k => finished

## Stopping criterion for Newton-Raphson
```python
abs(f.subs(x, x0)) > tol

```

# E2Q5: LU decomposition
## Solving
Använd formel givet i slidsen. Lecture 8

## Exists?
Doesnt exist om en nämnare blir 0.

# E3E2: LU decomposition with pivoting
## Solving
How is L, U and P solved?