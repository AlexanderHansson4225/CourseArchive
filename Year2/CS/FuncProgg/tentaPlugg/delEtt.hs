module DelEtt where
import GHC (GeneralFlag(Opt_PrintExplicitRuntimeReps))
import GHC.Driver.Session (initDynFlags)

sieve :: Int -> [Int]
sieve n = sieveHelper [2..n]
    where
        sieveHelper [] = []
        sieveHelper (x:xs) = x : sieveHelper (filter (\y -> y `mod` x /= 0) xs)

plusThenTimes :: Int -> Int
plusThenTimes = (*2) . (+1)

testWhereAndIn :: Int -> Int
testWhereAndIn n =
    let
        x = n + 1
        y = x * 2
    in
        y + z
    where
        z = 3

data Color =
    Red | Green | Blue

data Price =
    Euro Int | Dollar Int | Yen Int

complement :: Color ->  Color
complement Red = Green
complement Green = Blue
complement Blue = Red

printColor :: Color -> String
printColor Red = "Red"
printColor Green = "Green"
printColor Blue = "Blue"

priceInDollar :: Price -> Price
priceInDollar (Euro n) = Dollar (n * 2)
priceInDollar (Dollar n) = Dollar n

data Shape =
    Circle Float | Rectangle Float Float

data Tree a =
    Leaf a | Node (Tree a) (Tree a)
-- Innehåller typ a eller två träd av typ a
-- Definitionen av node finns inuti definitionen av Tree

-- Show a hints that a is an instance of the Show typeclass
-- This means that we can use the show function on a
printTree :: Show a => Tree a -> String
printTree (Leaf a) = show a
printTree (Node t1 t2) = "(" ++ printTree t1 ++ " " ++ printTree t2 ++ ")"

printTree123 :: String
printTree123 = printTree (Node (Leaf 1) (Node (Leaf 2) (Leaf 3)))

-- Qualified types

-- class EqMy a where
--     (==) :: a -> a -> Bool
--     (/=) :: a -> a -> Bool
--     x == y = not (x /= y)
--     x /= y = not (x == y)


greeting :: IO ()
greeting = do
    putStrLn "What is your name?"
    name <- getLine
    putStrLn ("Hello " ++ individual ++ name)
    where 
        individual = "Mr. "

greetingThatReturnsMessage :: IO String
greetingThatReturnsMessage = do
    putStrLn "What is your name?"
    name <- getLine
    putStrLn ("Hello " ++ individual ++ name)
    return ("Hello " ++ individual ++ name)
    where 
        individual = "Mr. "


class Example a where
    f1 :: a -> a -> String
    f2 :: a -> a
    f3 :: a
    f4 :: a
    f4 = f3 
    --f4 = 3 kommer inte fungerar

-- Har typ en abstrakt class samt att vi ärver från den
instance Example Int where
    f1 x y = show $ x + y
    f2 x = x + 1
    f3 = 0

-- oklart varför detta inte fungerar-
--class Eq a where
--(==), (!=) :: a -> a -> Bool
--x != y = not (x == y)
--x == y = not (x!=y)


data Season = 
    Spring 
    | Summer 
    | Autumn 
    | Winter 
    deriving (Eq, Ord, Enum, Show, Read)
    -- antyder att man kan göra dessa grejer på
    -- tror du måstr ha alla eller en?
    -- iaf annars kan man inte göra dom grejerna


-- Field labelling
data SamePoint = SamePoint Double Double

data Point = Point
    { xCoord :: Double
    , yCoord :: Double
    }
-- These are the same
-- the second one is called field labelling
-- We have deconstructed the data type
-- and said that the first field is called xCoord
-- and the second field is called yCoord
-- so they are just names of the things, so we can later do

point = Point {yCoord = 1, xCoord = 2}

-- Gör en tostring på din class
--showNat n = show (intValue n)
--  where
--  intValue Zero = 0
--  intValue (Succ x) = 1 + intValue x

--instance Show MyNatural where
--  show = showNat


-- Allows sequencing and naming the returned values:
-- Note the use of <- instead of = (let)
echoReverse :: IO ()
echoReverse = do
    aLine <- getLine
    putStrLn (reverse aLine)




