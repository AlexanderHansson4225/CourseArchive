# Innehållsförteckning
- [Föreläsning 1](#föreläsning-1)
- [Föreläsning 3](#föreläsning-3)
- [Föreläsning 4](#föreläsning-4)
- [Föreläsning 5](#föreläsning-5)
- [Föreläsning 6](#föreläsning-6)
- [Föreläsning 7](#föreläsning-7)


# Information
 - Labs in pairs (fyra)
    - Assignments are submitted online
 - Slides på kurshemsidan
    - De första 10 föreläsningarna är detsamma iaf.
 - Han följer Graham Hutton, Programming in Haskell nära.
 - Koden som han skriver finns på kurshemsidan.

# Godtyckliga functioner
```
const :: a -> b -> a
const x y = x
-- meaning that const takes a parameter x and a parameter y and returns x
```

# Föreläsning 1
### Information
- Glasgow Haskell Compiler (GHC)
  - Run repl through ghci
- Consider installing Haskell Platform or haskell-stack
---
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

```
`ackumulate f i [] = i`  
`ackumulate f i (x:xs) = f x (ackumulate f i xs)`  
```

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
```
runningSums xs = theSolution   
  where    
    theSolution = 0 : zipWith (+) xs (0:theSolution)
```

`runningSums [1,2,3]` ger `[1,3,6]`

I pseuocode:
xs (which is out former output) + the current input (called solution)
- (0:theSolution) is the previous output (theSolution) with a 0 in front of it, so that the first element is 0.

Note zipwith:  
Takes two lists and a function and applies the function to the two lists elementwise.  
so `zipWith (+) [1,2,3] [4,5,6]` ger `[5,7,9]`

---
### Typing
Haskell is strong and statically types
Type declarations are optional
- Type checking uses type interencing
- Kan dock vara bra att skriva typer för att dokumentera koden
Enforced conventionen:
- Type names: begin with a capital letter
- Variable/expression names: begin with a lower case letter
---
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
\ is used for lambda expressions in Haskell
så man har map functionen (addera med 1) till alla element i listan som ges efter incAll

**Note map**  
`map f xs` ger en lista där alla element i xs har applicerats på funktionen f.

ex `map (+2) [1,2,3]` ger `[3,4,5]`
---
### Pattern-based definitions
count :: Int -> String
count 1 = "one"
count 2 = "two"
count _ = "many"


one function can have many equations, depending on the input.

**Guards**
```
count :: Int -> String  
count n | n == 1 = "one"  
        | n == 2 = "two"  
        | n < 0 = "negative"  
        | otherwise = "many" 
```
---
### Indentation
- Indentationdenotes continuation, unless brace notation is used
- Some keywords (let, where, do, of) can be used to begin layout block
- More about this later
---
### Polynmorphic types
The type of (.)
(f.g) x = f (g x)
is 
(b -> c) -> (a -> b) -> (a -> c)

So if f takes us from b to c  
g takes us from a to b  
then (f.g) takes us from a to c  

Polymorphic types are types that can be used for many different types.

(go from b to c of going to a to b is going from a to c)

### Tuples
Fixed number of elements, may be of different types:
Pairs:

### Lists
```
[1,2,3]
[1..10]
[1,3..10]
[2..] :: [Int]
```

**Sidenote**   
.. is a function that takes two parameters and returns a list of all the numbers between the two parameters. 

**Sidenote**  
Lists kind of behave like ints
```
func [] = 0
func (x:xs) = x + func xs
```

**Some standard list functions**  
filter even [1..10] ger [2,4,6,8,10]

map doublePlusOne [1..3] ger [3,5,7]

fold: Hängde inte riktigt med här

zipWith (+) [1,2,3] [4,5,6] ger [5,7,9]

zip [1,2,3] [4,5,6] ger [(1,4),(2,5),(3,6)]


### Strings
Strings are lists of characters
String = [Char]
`"hello"` is the same as ['h','e','l','l','o']

### List comprehensions
```
allIntPairs = [(i,j) | i <- [0..], j <- [0..i]]
```
gives all pairs of integers where the first element is less than or equal to the second element.
---
### Type synonyms
```
type Name = String
type Age = Int
type Person = (Name, Age)
```
Mostly nice for documenation
### Enumurated types

data is an enumurated type

```
data Color =
  Red | Green | Blue | Yellow |
  Cyan | Magenta | White | Black

data Price = Euro Int Int | Dollar Int Int
```

**Pattern matching with enumurated types**
```
complement :: Color -> Color
complement Red = Cyan
complement Green = Magenta
complement _ = Yellow
```
Takes a color and returns the complement of that color.

**Recursive type definitions**  

```
data intTree = IntEmpty | IntNode Int intTree intTree
```

or polymorphic version:
```
data Tree a = Empty | Node a (Tree a) (Tree a)
```

### Qualified types
the type of `elem x xs = any (==x) xs` is `Eq a => a -> [a] -> Bool`

ex `elem 2 [1,2,3]` ger True because 2 is in the list

---
### Referens och innehållslikhet
- Kom ihåg att de inte alltid är samma sak, även i haskell

Solution?

**Type classes**   
This is how we define that Eq is a type class.
A type class is a set of types that have some common properties.

Motsvarigheten till interface i java
- A type class is a set of types that have some common properties.

```
class Eq a where
  (==), (/=) :: a -> a -> Bool
  x /= y = not (x == y)
  x == y = not (x /= y)
```

(obviously built in to haskell)

**Class instances**
This is how we define that Bool is an instance of Eq

```
instance Eq Bool where
  False == False = True
  True == True = True
  _ == _ = False
```
(obviously built in to haskell)

**Subclassing type classes**
```
class (Eq a) => Ord a where
  (<), (<=), (>=), (>) ...
```

Defining an order (meaning ord is a subclass of Eq)


---

### Input/output
The abstract datatype IO a of I/O actions
```
putChar :: Char -> IO ()
getChar :: IO Char

```

IO tells us there are side effects, and that the result is not a value of type a, but a value of type IO a. 
DVS it is similiar to void?

**The do notation**
```
greeting :: IO ()  

greeting = do
  putStrLn "What is your name?"
  name <- getLine
  putStrLn ("Hello " ++ name ++ "!")
```

syntatic sugar for bind and then

The do notation is used to sequence I/O actions. Not very typical for a functional language, but useful. SO to allow sequencing of I/O actions, we need to use the do notation?

# Föreläsning 4
### Tip for writing multiple lines in ghci
```
{main = do {foo 1
            ;foo 2}
-- hann inte... vet inte om detta är rätt
}
```

### Random numbers
How do you randomise r?
* RandomIO is a library function that returns a random number of type a. So in the example, it returns a random number of type Float.
```
somethingsRandom rs = do
  r <- RandomIO :: IO Float 
  return (pick r rs)
```

* The (pick r rs) is used to extract a random element from the list rs. Something of just type IO Float isnt very useful, so we use the return function to turn it into an I/O action that returns a random element from the list rs.

### Modules
Each Haskell prgram is collection of modules   
A module is a an organization unit, controlling the namespace   
One module must be called Main and must export value main  

### Importing
```
import A
import A() as B
```
---

### Enum functions
```
fromEnum :: Enum a => a -> Int
-- Returns the integer code for the given value. The integers returned are in the ascending order of constructors in the data declaration.

toEnum :: Enum a => Int -> a
-- Returns the value corresponding to the given integer code. The argument must be in the range returned by fromEnum. If it is not, the result is unspecified.

enumFrom :: Enum a => a -> [a]
-- Returns an infinite list of successive values from the given one.
-- for example, enumFrom 'a' returns the string ['a'..'z']

enumFromTo :: Enum a => a -> a -> [a]
-- Returns a list of all values in the specified range, including both endpoints.

enumFromThen :: Enum a => a -> a -> [a]
-- Returns an infinite list of values in the specified range, where the first two values are given. For example, enumFromThen 'a' 'c' returns the string ['a','c'..'z'].
```

### Union types
```
data Either a b = Left a | Right b
```

"mixing apples and pears"
need to define what you do with apples and what you do with pears:
```
either :: (a -> c) -> (b -> c) -> Either a b -> c
```
So depending on if you have an apple or a pear, you do something different.

### Maybe
```
data Maybe a = Nothing | Just a

-- Taking care of nothing:

maybe :: b -> (a -> b) -> Maybe a -> b
maybe 0 (+1) (Just 1) = 2
```
Either we have success or we have failure.
Depending on the case, we get Nothing or Just a.

# Föreläsning 5
### Recources for Haskell
* [Hoogle](http://www.haskell.org/hoogle/)
* [Lunds tekniska högskola CS Website for Haskell](www.google.com)

### Lists funtions


```
(:) :: a -> [a] -> [a]
'a' : "bc" = "abc"
-- Insertion

(++) :: [a] -> [a] -> [a]
"ab" ++ "cd" = "abcd"
-- Concatenation

head :: [a] -> a
head "abc" = 'a'
-- First element

tail :: [a] -> [a]
tail "abc" = "bc"
-- All but first element

last :: [a] -> a
last "abc" = 'c'
-- Last element

filter :: (a -> Bool) -> [a] -> [a]
filter even [1,2,3,4] = [2,4]
-- Filter out elements that do not satisfy the predicate

map :: (a -> b) -> [a] -> [b]
map (+1) [1,2,3,4] = [2,3,4,5]
-- Apply a function to all elements

repeat :: a -> [a]
repeat 'a' = "aaaaa..."
-- Infinite list of the same element

replicate :: Int -> a -> [a]
replicate 3 'a' = "aaa"
-- List of n copies of the same element

cycle :: [a] -> [a]
cycle "abc" = "abcabcabcabc..."
-- Infinite list of the same list

until :: (a -> Bool) -> (a -> a) -> a -> a
until (>10) (*2) 1 = 16
-- Apply a function until a predicate is satisfied
-- So 1*2*n until n>10 = 16

span :: (a -> Bool) -> [a] -> ([a],[a])
span (<5) [1,2,3,4,5,6,7] = ([1,2,3,4],[5,6,7])
-- Split a list into two parts, the first part satisfies the predicate, the second does not

show :: (Show a) => a -> String
show 1 = "1"
-- Convert to string
-- Show can be used to convert any type to a string if it the type is an instance of the Show type class

read :: (Read a) => String -> a
read "1" = 1
-- Convert from string if the type is an instance of the Read type class
-- Note that if you make your own type, and you want to be able to read it from a string, you need to make it an instance of the Read type class
-- Functions are not instances of the Read type class

-- in ghci read "5" gives an error, but read "5" :: Int works
-- we need to tell ghci what type we want to read



```
---

### Refering types
```
:t (+) :: Num a => a -> a -> a  
-- Num is a type class

:type (+) :: Num a => a -> a -> a  
-- Num is a type class
```

```
:type filter
filter :: (a -> Bool) -> [a] -> [a]

:type filter odd
filter odd :: Integral a => [a] -> [a]
-- Integral is a type class which elements are Int & Integer

```

### => means "is an instance of"
so `Integral => n -> Bool`
* means that n is an instance of Integral
* which means that n is either an Int or an Integer

Futhermore we can see that filter takes a function that takes an element of type a and returns a Bool, and a list of type a, and returns a list of type a.

### Writing the type
The type in haskell is used to tell the compiler what type of value we want to return.
* It is often not necessary to write the type, but it is helpful because it makes the code more readable and helps the compiler to find errors.

### Basic types
```
Int -- fixed precision
Integer --abbretrary precision
Float 
Double
Char
Bool
String
```

Note: Basic types start with a capital letter.


### Basic types during exam (example)
```
:t ((.):)

-- ex tentafråga: Vad är typen av detta
-- svar: [(b -> c) -> (a -> b) -> a -> c]
--     -> [(b -> c) -> (a -> b) -> a -> c]
-- (.) är kompositionen av funktioner
-- (.): är ... oklart
```

```
:t (+0).(0+)

-- ex tentafråga: Vad är typen av detta
-- svar: Num a => a -> a
```

```
:t (.)(.)
--  ex tentafråga: Vad är typen av detta
-- (a1 -> b -> c) -> a1 -> (a2 -> b) -> a2 -> c
```

### More type derivation during exam (example)
```
-- What is the type' of the following function?
:t g x = map ($x)
-- "map :: (a -> b) -> [a] -> [b]
-- ($) :: (c->d) -> c -> d
-- map ($x) :: c -> d -> d
-- Note that $ gives a function that takes a value and returns a value
```
The diffrence between `map ($x)` and `map (x)` is that the first one takes a function and applies it to x, while the second one takes a value and applies it to x.



- Ex: `map ($x) [(*2), (+1)]` = [6, 4] 
  - if x = 3 because `(*2) 3 = 6` and `(+1) 3 = 4`
- Ex: `map (x) [(*2), (+1)]` = ???
---
### Making a type class
```
class Example a where
  f1 :: a -> a -> String
  f2 :: a -> a
  f3 :: a
```

**The child of this type class:**
```
instance Example Int where
  f1 x y = show $ (+) x y 
  -- "adds x and y and converts the result to a string"
  f2 = (+1)
  f3 = 0
```
### Class inherticance
- Inget konstigt. Bara standard

### Derived instances
```
data Season = Spring | Summer | Autumn | deriving (Eq, Ord, Show, Read, Enum)

notWinter = [Spring .. Autumn]
```
meaning...
From Prelude only Eq, Ord, Show, Read, Enum, Bounded can be derived

**More deriving**
```
-- Maybe type
data Maybe a = Nothing | Just a deriving (Eq, Ord, Read, Show)

maybe :: b -> (a -> b) -> Maybe a -> b
maybe n f Nothing = n
maybe n f (Just x) = f x
```

**How does deriving work?**
Haskell tries to derive form what he already knowd
- Complains if there is no logical way to derive

### Functor
A prelude
Represents a type that can be mapped over

**Examples of functor**

```
-- Maybe type
instance Functor Maybe where
  fmap f (Just x) = Just (f x)
  fmap f Nothing = Nothing

-- Tree
data Tree a = EmptyTree | Node a (Tree a) (Tree a)
instance Functor Tree where
  fmap f EmptyTree = EmptyTree
  fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)
```

Meaning...

### Field labelling
Type definitions 
```
data C = F Int Int Bool
and 
data C = F {f1, f2 :: Int, f3 :: Bool}
```
are the same
Note that in pattern matching F {} denotes that we want to match on the fields of the type, and not the type itself.

### Type renaming
`newtype Age = Age Int`
or 
`newtype Age = Age {unAge :: Int}`

Note: Just one field possible!
Note: The second variant brings into the scope two functions, constructor and deconstructor

```
Age :: Int -> Age
unAge :: Age -> Int
```

--- 
### Church numbers
Numbers that are defined by numbers
type ChurchNatural a = (a -> a) -> (a -> a)

```
zeroC, oneC, twoC :: ChurchNatural a
zero f = id 
oneC f = f 
twoC f = f . f
```

Meaning we define an alternative to zero using id while we define oneC as the function itself 

# Föreläsning 6: Assignment 1
- Inlämning den `2/5`

- Egen tanke 
```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

### Chatterbots (N1)
- Chatterbot is a program that simulates a conversation with a human user, typically via a chat interface.

# Föreläsning 7
Checka canvas ish en timme innan föreläsningen den 26/4
- Han kan potentiellt inte komma (eller kommer sent)

Fråga han om hur länge assignments tar:
- De undersöker hur länge folk tar på sig
  * I medel tar det 30h **per person**
  * Men den lägre gränsen de har fått in är 10h (per person)
--- 
### IO fördjupning
**Pure functions**
- Always return the same value for the same input
- No side effects
- Are able to mathimatically be prove thatt hey always behave the same output

**Impure functions**
- Can have side effects
- The do notation is used to sequence impure functions
```
let x = (outputChar 'h'; outputChar 'a') in 
x; x

// kommer ge ha (dvs inte två gånger)
```
För att let x kommer beräknas en gång.
Sån när vi  kallar x så beräknas den och outputtar
När vi gör x

jämför det med
```
var x = print("hej")
x;
x;
// will only print "hej" once
```

### Return
return does "nothing" in the context of IO
```
getInt :: IO Int
getInt = do
  aLine <- getLine
  return (read aLine :: Int) 
  transform aLine to Int
  -- IO takes an argument, annotates it as `IO, andr return unannotates it

```
Clarification: Return doesnt return anything in classic way
- It simply unpackages whats in it

### lambda laughter fixed with monads (more about monads later)
The IO monad gives type safe laughters
```
laugh :: IO ()
laugh =
  let x = do putChar ’h’; putChar ’a’
  in do x; x

```

---

### IO-stripping (**FORGET IMMEDIETLY and AVOID**)
Finns metoders om tar bort om io notationen
ex:
```
stripIO :: IO a -> a
```

**Forget it (not typesafe.)**

---

### Monad class: Usecases and notes
* Separation of pure and sequential code
  * Pure code is easier to reason about
* Introduction of state and its transformations
* Simply see it as yet another type class
  - *hade läst på om detta lite till*

### The monad class
```
class Monad m where
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b
  return :: a -> m a
  fail :: String -> m a
```
### Monadic introduction of state and its state

```
type Dictionary = [(String,String)]
  dictAdd key value dict = (key, value):dict
  dictFind key dict = lookup key dict

```
**Passing state without side effects is clumsy:**
- Becausew e have to keep track what has already been done
  - `d1 = ..., d2 = f(d1), d3 = f(d2)`
```

result1 = r where
d1 = dictAdd "no" "norway" []
d2 = dictAdd "se" "sweden" d1
r1 = dictFind "fr" d2
d3 = dictAdd "fr" "france" d2
r = dictFind "fr" d3
```
**Better to pack into an monadic type**
```
type DictMonad = StateTransform Dictionary

result2 = snd (runST [] dictM) where
  dictM :: DictMonad (Maybe String)
  dictM = do
    stateUpdate (dictAdd "no" "norway")
    stateUpdate (dictAdd "se" "sweden")
    r1 <- stateQuery (dictFind "fr")
    stateUpdate (dictAdd "fr" "france")
    r <- stateQuery (dictFind "fr")

// more robust and not as clumsy
// Note: StateTransform is a monad that stores a state
// Can then pack the updates in a do notation
// Update state with stateUpdate


```

### Monad axioms 
Regler som gäller och måste gälla för monads

1. return acts as a neutral element of >>=.
* `(return x) >>= f` ⇔ `f x`
* `m >>= return` ⇔ `m`
    *  (På sammas sätt som 0 är neutral element av + (0+x) = x )
2. Binding two functions in succession is the same as binding
one function that can be determined from them.
* `(m >>= f ) >>= g` ⇔ `m >>= λx.(f x >>= g)`
  * Dvs den är associativ

**Importance**
- ghc wont check if this is true
  - its the programmers responsibility to make sure that the monad laws are true
- if it is not true, then your "monad" wont work in a monadic way
  - cant just define abbritary functions and call them monads

---

### Reminder of functors: IO is a functor
Please note that IO is a functor
```
class Functor f where
  fmap :: (a -> b) -> f a -> f b
```
=>

```
instance Functor IO where
  fmap f action = do
    result <- action
    return (f result)
```

So it is a functor because:
* it has a fmap function that takes a function (a -> b) and an action (IO a) and returns an action (IO b)

### Applicative functors
- `(<*>)` is an apply
  - Introducing the possiblityt to also add a function to the action `f (a -> b)`
```
class (Functor f) => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b
```
```
instance Applicative Maybe where
  pure = Just 
  Nothing <*> _ = Nothing
  (Just f) <*> something = fmap f something -- Are extracting x 'from under Just and applying f to the result
```
**Examples**
```
Just (+3) <*> Just 9
-- gives Just 12

pure (+) <*> Just 3 <*> Nothing
-- gives Nothing
```

**Notes: Can have more than one single function**
```
[(+),(*)] <*> [1,2] <*> [3,4]
// gives '[4,5,5,6,3,4,6,8]'
```
so:

```

// gives [1+2, 1*2, 2+2, 2*2]
[(+),(*)] <*> [1,2]  <*> [3,4] 
// gives [1+3,1+4, 2+3, 2+4, 1*3, 1*4, 2*3, 2*4] 
// lika med [4,5,5,6,3,4,6,8]

```

Clarification: List are applicatives
```
instance Applicative [] where
  pure x = [x]
  fs <*> xs = [f x | f <- fs, x <- xs]
```

### List comprehension
Allows you to define lists in a concise and expressive way
* "Reverse do-notation"
```
list1 = [ (x,y) | x<-[1..], y<-[1..x]]

list2 = do
  x <- [1..]
  y <- [1..x]
  return (x,y)
```
**Notera:**
`list1` = `list2`





 









