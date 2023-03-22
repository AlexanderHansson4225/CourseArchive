# Information
 - Labs in pairs (fyra)
    - Assignments are submitted online
 - Slides på kurshemsidan
    - De första 10 föreläsningarna är detsamma iaf.
 - Han följer Graham Hutton, Programming in Haskell nära.
 - Koden som han skriver finns på kurshemsidan.

# Föreläsning 1
### Information
- Glasgow Haskell Compiler (GHC)
  - Run repl through ghci
- Consider installing Haskell Platform or haskell-stack

### What is functional programming?
- Language entirely made up by functions
    - A relation is a function iff
      - Every element only maps to one corresponding output
      - Ex: ((1,a), (2,a), (3,b),(4,c), (5,d)) is a function

### Functions  
 `f x` is the same as `f(x)`  

Defining a function:  
`f x = x + 1`  
f 3 ger 4  

`f x y = x + y`    
f 3 4 ger 7  

Have to write `f (-2)` not `f -2`

### Variables
In functional programming `=` is not assignment, it is a definition.
 - There are no variables in functional programming
 - Everything is written explicitly

The concept of variables:
  - A variabel is expression that can be evaluated to a value

### Lists and recursivity
Follow lines are functions that takes a list as a parameter  
`sum1 [] = 0`  
  - Denotes a empty list in the base case  

`sum1 (x:xs) = x + (sum1 xs)`  
   - Denotes a list with a head and a tail in the recursive case

`sum1 [1,2,3]` ger 6  
`sum1 [] ger 0`

### Higher ordered functions
A function that takes a function as a parameter is called a higher ordered function.

`ackumulate f i [] = i`  
`ackumulate f i (x:xs) = f x (ackumulate f i xs)`  

`ackumulate (+) 0 [1,2,3]` ger 6 because `1 + (0 + (2 + (0 + (3 + 0))))`  

In psuedocode: we apply the function `+` to the head of the list and the result of the recursive call to the tail of the list.

Note that:  
`sum1 = ackumulate (+) 0`

### Infinite lists
`sieve (n:ns) = n : sieve [x | x <- ns, x mod n /= 0]`  
List comprehension that takes x from ns and filters out all x that are divisible by n. Then gives the result to sieve.
Meaning that sieve will only contain prime numbers.

`sieve [2..]` ger `[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251,...`

Notera att om man gör `take 50 (sieve [2..])` så får man 50 tal, och den terminates, trots att sieve tar oönligt lång tid att köra, för kompilatorn vet att den bara ska ta 50 tal.

# Föreläsning 3

### Stream programming
Ex: input x, y, z
ger output x, x+y, x+y+z

Needs a state to keep track of the previous value.

**Running sums**  
`runningSums xs = theSolution   
  where    
    theSolution = 0 : zipWith (+) xs (0:theSolution)`

`runningSums [1,2,3]` ger `[1,3,6]`

I pseuocode:
xs (which is out former output) + the current input (called solution)
- (0:theSolution) is the previous output (theSolution) with a 0 in front of it, so that the first element is 0.

Note zipwith:
Takes two lists and a function and applies the function to the two lists elementwise.
so `zipWith (+) [1,2,3] [4,5,6]` ger `[5,7,9]`

### Typing
Haskell is strong and statically types
Type declarations are optional
- Type checking uses type interencing
- Kan dock vara bra att skriva typer för att dokumentera koden
Enforced conventionen:
- Type names: begin with a capital letter
- Variable/expression names: begin with a lower case letter

### Operators and functions
- Operators: 2 + 3
- Functions: and [True, False, True]

Dvs att `2 + 3` är en operator och `(+) 2 3` är en funktion.

Note that (+) is the function of the operator +.

Note:
add1 = (+)  
´1 'add1' 2` ger 3
- Backticks are used to denote infix functions

### Curried functions
parantheses avoided 
`f a b` is to be read as ((f a) b)

abd is diffrent from `f (a b)` where f is a function that takes a and b as parameters.

Note functions always take one parameter at a time.
- (+) 2 3 is the same as ((+) 2) 3
- So (+) is a function that takes one parameter and returns a function that takes one parameter and returns a value of type int, where that value is the sum of the two parameters 

Curried functions are functions that takes one parameter at a time. So all functions in Haskell are curried.

### Partial application
Partial application is when you apply a function to some of its parameters, but not all of them.
inc2 = (+1)
inc2 3 ger 4
kan även skriva inc2 = (+ 1)

### Compositions of functions
doublePlusOne = inc2.(2*)
alternativt 
doublePlusOne = (+1).(2*)

### Lambda expressions
`incAll = map (\i->i+1)`
\ is used for 