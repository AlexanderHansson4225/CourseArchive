module DelEtt where
import GHC (GeneralFlag(Opt_PrintExplicitRuntimeReps))
import GHC.Driver.Session (initDynFlags)
import Data.List

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
-- Den behandlar alla a i example som intes
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
-- Note the use of <- for IO actions
-- let x = is used for pure values
echoReverseArrow :: IO ()
echoReverseArrow = do
    aLine <- getLine
    putStrLn (reverse aLine)

echoReverseLet :: IO ()
echoReverseLet = do
    aLine <- getLine
    let reversedLine = reverse aLine
    putStrLn reversedLine

-- Return 
-- Does the empty IO-activity
-- This is the same as return ()
-- return :: a -> IO a
-- So :: IO Int and we do IO we cover the IO with return and then can give an int?
-- Tänk på det som actually return i IO iaf

echoReverse :: IO Int
echoReverse = do
    aLine <- getLine
    let reversedLine = reverse aLine
    putStrLn reversedLine
    return 1

-- lambdaLaugh :: IO ()
-- lambdaLaugh = 
--     let x = (outputChar 'h' outputChar 'a') in
--         x; x;

-- monadicLaugh :: IO ()
-- monadicLaugh = do
--     let x = do {putChar 'h'; putChar 'a'}
--     in do x; x


-- fromRational is in the Fractional typeclass
demoFromRational :: (Fractional a) => a
demoFromRational = fromRational (1/2)

-- Takes a list of IO actions and returns an IO action that
-- performs all of them in sequence
-- Om jag hade gjort returrn () hade det blivit en nice IO action
demoSequence :: IO [()]
demoSequence = do
    sequence [putChar 'h', putChar 'a', putChar 'h', putChar 'a']
    

-- return () is crucial here, otherwise the IO action will
-- return the last IO action in the sequence
-- instead of an IO action that does nothing
-- otherwise we get a list of IO actions and
-- kort sagt, behöver return () för att det ska se nice ut
executeDemoSequence :: IO ()
executeDemoSequence = do
    demoSequence
    return ()
    

-- Also executes the IO actions in sequence, but returns 
-- an IO action that does nothing
demoSequence_ :: IO ()
demoSequence_ = do
    sequence_ [putChar 'h', putChar 'a', putChar 'h', putChar 'a']

-- demoMonadListFunc :: IO [Int]
-- demoMonadListFunc = do
--     let myList = [1, 2, 3, 4, 5]
--     let incremented = incrementList myList
--     return incremented

--gives all except the last element  
demoInit :: [Int]
demoInit = init [1, 2, 3, 4, 5]


-- Summerar alla element i listan
-- 0 är startvärdet. Gör (((((0+5)+4)+3)+2)+1)
-- NOTE: foldr är lazy, men det är inte foldl. 
-- DVS bara den fungerar på oändliga listor
-- Använd den som default
demoFoldr :: Int
demoFoldr = foldr (+) 0 [1, 2, 3, 4, 5]

-- Summerar alla element i listan
-- 0 är startvärdet. Gör ((((0+1)+2)+3)+4)+5
demoFoldl :: Int
demoFoldl = foldl (+) 0 [1, 2, 3, 4, 5]

-- tar de första 10 elementen i en oändlig lista 123123123123...
demoCycle :: [Int]
demoCycle = take 10 (cycle [1, 2, 3])

-- constains
demoElem :: Bool
demoElem = elem 1 [1, 2, 3]

demoNotElem :: Bool
demoNotElem = notElem 1 [1, 2, 3]

-- Gör en lista av par med element med samma index
demoZip :: [(Int, Int)]
demoZip = zip [1, 2, 3] [4, 5, 6]

-- Adderar element med samma index
demoZipWith :: [Int]
demoZipWith = zipWith (+) [1, 2, 3] [4, 5, 6]

-- tar lista av par och gör en tupel av två listor
demoUnzip :: ([Int], [Int])
demoUnzip = unzip [(1, 4), (2, 5), (3, 6)]

-- ger en lista av 1 till 5
-- tar bort dupicates
demoNub :: [Int]
demoNub = nub [1, 1, 2, 3, 3, 4, 1, 5, 5]

-- Inserat 4 på rätt plats i listan
demoInsert :: [Int]
demoInsert = insert 4 [1, 2, 3, 5, 6, 7]

-- tar bort alla element i den första listan som finns i den andra
demoBackslashBackslash :: [Int]
demoBackslashBackslash = [1, 2, 3, 4, 5] \\ [1, 2]

-- Ger en lista [2]
-- So \\ är delete all potential issues of
demoBackslashBackslash2 :: [Int]
demoBackslashBackslash2 = [1, 2, 2, 3] \\ [1, 2, 3, 4, 5]












