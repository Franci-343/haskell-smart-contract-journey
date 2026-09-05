-- ============================================================
-- 05 - Lists
-- ============================================================
--
-- Lists are one of the most important data structures
-- in Haskell.
--
-- A list contains multiple values of the same type.
--
-- Examples:
--
-- [1, 2, 3, 4, 5]
--
-- ["Haskell", "Cardano", "Plutus"]
--
-- [True, False, True]
--
-- Important:
--
-- All elements in a list must have the same type.
--
-- ============================================================


-- ------------------------------------------------------------
-- List of Int
-- ------------------------------------------------------------

numbers :: [Int]
numbers = [1, 2, 3, 4, 5]


-- ------------------------------------------------------------
-- List of String
-- ------------------------------------------------------------

languages :: [String]
languages = ["Haskell", "Rust", "JavaScript"]


-- ------------------------------------------------------------
-- List of Bool
-- ------------------------------------------------------------

booleanValues :: [Bool]
booleanValues = [True, False, True]


-- ------------------------------------------------------------
-- Empty list
-- ------------------------------------------------------------
--
-- An empty list is written as:
--
-- []

emptyList :: [Int]
emptyList = []


-- ------------------------------------------------------------
-- List type syntax
-- ------------------------------------------------------------
--
-- [Int]
--
-- means:
--
-- "a list of Int values"
--
-- [String]
--
-- means:
--
-- "a list of String values"


-- ------------------------------------------------------------
-- head
-- ------------------------------------------------------------
--
-- head returns the first element of a list.
--
-- Example:
--
-- head [10, 20, 30]
--
-- returns:
--
-- 10

firstNumber :: Int
firstNumber = head numbers


-- ------------------------------------------------------------
-- tail
-- ------------------------------------------------------------
--
-- tail returns everything except the first element.
--
-- Example:
--
-- tail [10, 20, 30]
--
-- returns:
--
-- [20, 30]

remainingNumbers :: [Int]
remainingNumbers = tail numbers


-- ------------------------------------------------------------
-- last
-- ------------------------------------------------------------
--
-- last returns the last element of a list.

lastNumber :: Int
lastNumber = last numbers


-- ------------------------------------------------------------
-- init
-- ------------------------------------------------------------
--
-- init returns every element except the last one.

initialNumbers :: [Int]
initialNumbers = init numbers


-- ------------------------------------------------------------
-- length
-- ------------------------------------------------------------
--
-- length returns the number of elements in a list.

numbersLength :: Int
numbersLength = length numbers


-- ------------------------------------------------------------
-- null
-- ------------------------------------------------------------
--
-- null checks if a list is empty.
--
-- It returns a Bool.

isNumbersEmpty :: Bool
isNumbersEmpty = null numbers


isEmptyListEmpty :: Bool
isEmptyListEmpty = null emptyList


-- ------------------------------------------------------------
-- Adding an element with :
-- ------------------------------------------------------------
--
-- The : operator is called "cons".
--
-- It adds one element to the beginning of a list.
--
-- Example:
--
-- 0 : [1, 2, 3]
--
-- returns:
--
-- [0, 1, 2, 3]

numbersWithZero :: [Int]
numbersWithZero = 0 : numbers


-- ------------------------------------------------------------
-- Concatenating lists with ++
-- ------------------------------------------------------------
--
-- ++ joins two lists together.
--
-- Example:
--
-- [1, 2] ++ [3, 4]
--
-- returns:
--
-- [1, 2, 3, 4]

moreNumbers :: [Int]
moreNumbers = numbers ++ [6, 7, 8]


-- ------------------------------------------------------------
-- Membership with elem
-- ------------------------------------------------------------
--
-- elem checks if a value exists inside a list.
--
-- Example:
--
-- elem 3 [1, 2, 3]
--
-- returns:
--
-- True

containsThree :: Bool
containsThree = elem 3 numbers


containsTen :: Bool
containsTen = elem 10 numbers


-- ------------------------------------------------------------
-- notElem
-- ------------------------------------------------------------
--
-- notElem checks if a value does NOT exist in a list.

doesNotContainTen :: Bool
doesNotContainTen = notElem 10 numbers


-- ------------------------------------------------------------
-- Ranges
-- ------------------------------------------------------------
--
-- Haskell can generate lists using ranges.
--
-- Example:
--
-- [1..5]
--
-- produces:
--
-- [1,2,3,4,5]

oneToTen :: [Int]
oneToTen = [1..10]


-- ------------------------------------------------------------
-- Ranges with steps
-- ------------------------------------------------------------
--
-- [2,4..10]
--
-- means:
--
-- start at 2
-- then 4
-- continue using the same difference
--
-- Result:
--
-- [2,4,6,8,10]

evenNumbers :: [Int]
evenNumbers = [2,4..20]


oddNumbers :: [Int]
oddNumbers = [1,3..19]


-- ------------------------------------------------------------
-- Character ranges
-- ------------------------------------------------------------
--
-- Ranges also work with characters.

alphabetStart :: [Char]
alphabetStart = ['a'..'f']


-- ------------------------------------------------------------
-- String and [Char]
-- ------------------------------------------------------------
--
-- In Haskell, String is essentially a list of Char values.
--
-- These two types are equivalent:
--
-- String
--
-- [Char]

word :: String
word = "Haskell"


characters :: [Char]
characters = ['H', 'a', 's', 'k', 'e', 'l', 'l']


-- ------------------------------------------------------------
-- take
-- ------------------------------------------------------------
--
-- take returns the first N elements of a list.
--
-- Example:
--
-- take 3 [10,20,30,40,50]
--
-- returns:
--
-- [10,20,30]

firstThreeNumbers :: [Int]
firstThreeNumbers = take 3 numbers


-- ------------------------------------------------------------
-- drop
-- ------------------------------------------------------------
--
-- drop removes the first N elements.
--
-- Example:
--
-- drop 2 [10,20,30,40]
--
-- returns:
--
-- [30,40]

afterTwoNumbers :: [Int]
afterTwoNumbers = drop 2 numbers


-- ------------------------------------------------------------
-- reverse
-- ------------------------------------------------------------
--
-- reverse reverses the order of a list.

reversedNumbers :: [Int]
reversedNumbers = reverse numbers


-- ------------------------------------------------------------
-- maximum
-- ------------------------------------------------------------

largestNumber :: Int
largestNumber = maximum numbers


-- ------------------------------------------------------------
-- minimum
-- ------------------------------------------------------------

smallestNumber :: Int
smallestNumber = minimum numbers


-- ------------------------------------------------------------
-- sum
-- ------------------------------------------------------------

total :: Int
total = sum numbers


-- ------------------------------------------------------------
-- product
-- ------------------------------------------------------------

numbersProduct :: Int
numbersProduct = product numbers


-- ------------------------------------------------------------
-- Functions receiving lists
-- ------------------------------------------------------------
--
-- Functions can receive lists just like any other value.

listSize :: [Int] -> Int
listSize xs = length xs


-- ------------------------------------------------------------
-- Function checking if a value exists
-- ------------------------------------------------------------

containsNumber :: Int -> [Int] -> Bool
containsNumber number xs = elem number xs


-- ------------------------------------------------------------
-- Function adding an element
-- ------------------------------------------------------------

addToBeginning :: Int -> [Int] -> [Int]
addToBeginning number xs = number : xs


-- ------------------------------------------------------------
-- Function combining two lists
-- ------------------------------------------------------------

combineLists :: [Int] -> [Int] -> [Int]
combineLists xs ys = xs ++ ys


-- ------------------------------------------------------------
-- Warning about partial functions
-- ------------------------------------------------------------
--
-- Some list functions can fail on empty lists.
--
-- For example:
--
-- head []
--
-- tail []
--
-- last []
--
-- init []
--
-- These cause runtime errors.
--
-- Later we will learn safer ways to work with lists,
-- especially using pattern matching and Maybe.


-- ------------------------------------------------------------
-- main
-- ------------------------------------------------------------

main :: IO ()
main = do
    putStrLn "=== Lists ==="

    putStrLn ("numbers = " ++ show numbers)

    putStrLn ("languages = " ++ show languages)

    putStrLn ("firstNumber = " ++ show firstNumber)

    putStrLn ("remainingNumbers = " ++ show remainingNumbers)

    putStrLn ("lastNumber = " ++ show lastNumber)

    putStrLn ("initialNumbers = " ++ show initialNumbers)

    putStrLn ("numbersLength = " ++ show numbersLength)

    putStrLn ("isNumbersEmpty = " ++ show isNumbersEmpty)

    putStrLn ("isEmptyListEmpty = " ++ show isEmptyListEmpty)

    putStrLn ("numbersWithZero = " ++ show numbersWithZero)

    putStrLn ("moreNumbers = " ++ show moreNumbers)

    putStrLn ("containsThree = " ++ show containsThree)

    putStrLn ("containsTen = " ++ show containsTen)

    putStrLn ("oneToTen = " ++ show oneToTen)

    putStrLn ("evenNumbers = " ++ show evenNumbers)

    putStrLn ("oddNumbers = " ++ show oddNumbers)

    putStrLn ("alphabetStart = " ++ show alphabetStart)

    putStrLn ("firstThreeNumbers = " ++ show firstThreeNumbers)

    putStrLn ("afterTwoNumbers = " ++ show afterTwoNumbers)

    putStrLn ("reversedNumbers = " ++ show reversedNumbers)

    putStrLn ("largestNumber = " ++ show largestNumber)

    putStrLn ("smallestNumber = " ++ show smallestNumber)

    putStrLn ("total = " ++ show total)

    putStrLn ("numbersProduct = " ++ show numbersProduct)

    putStrLn ("listSize [10,20,30] = " ++ show (listSize [10,20,30]))

    putStrLn ("containsNumber 20 [10,20,30] = " ++ show (containsNumber 20 [10,20,30]))

    putStrLn ("addToBeginning 0 [1,2,3] = " ++ show (addToBeginning 0 [1,2,3]))

    putStrLn ("combineLists [1,2] [3,4] = " ++ show (combineLists [1,2] [3,4]))


-- ============================================================
-- Exercises
-- ============================================================

-- 1. Create a list called favoriteNumbers.
--
-- favoriteNumbers :: [Int]
-- favoriteNumbers = ...


-- 2. Create a list with three programming languages.
--
-- programmingLanguages :: [String]


-- 3. Create a function called firstElement.
--
-- It should return the first element of a list.
--
-- firstElement :: [Int] -> Int


-- 4. Create a function called lastElement.
--
-- It should return the last element of a list.
--
-- lastElement :: [Int] -> Int


-- 5. Create a function called addNumber.
--
-- It receives an Int and a list of Int.
--
-- Add the number to the beginning of the list.
--
-- addNumber :: Int -> [Int] -> [Int]


-- 6. Create a function called hasNumber.
--
-- It should check whether a number exists in a list.
--
-- hasNumber :: Int -> [Int] -> Bool


-- 7. Create a list containing the numbers from 1 to 100.
--
-- numbersFromOneToHundred :: [Int]


-- 8. Create a list containing even numbers from 2 to 100.


-- 9. Create a function called firstFive.
--
-- Use take.
--
-- firstFive :: [Int] -> [Int]


-- 10. Create a function called removeFirstThree.
--
-- Use drop.
--
-- removeFirstThree :: [Int] -> [Int]


-- 11. Open GHCi and test:
--
-- :load 05-lists.hs
--
-- numbers
--
-- head numbers
--
-- tail numbers
--
-- length numbers
--
-- reverse numbers
--
-- 0 : numbers
--
-- numbers ++ [6,7]
--
-- elem 3 numbers
--
-- [1..20]
--
-- [2,4..20]
--
-- :t numbers
--
-- :t head
--
-- :t tail
--
-- :t elem