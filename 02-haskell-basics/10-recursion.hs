-- ============================================================
-- 10 - Recursion
-- ============================================================
--
-- Recursion happens when a function calls itself.
--
-- A recursive function usually needs:
--
-- 1. A base case
-- 2. A recursive case
--
-- The base case stops the recursion.
--
-- The recursive case makes the problem smaller
-- and calls the function again.
--
-- ============================================================


-- ------------------------------------------------------------
-- Simple countdown
-- ------------------------------------------------------------
--
-- Base case:
--
-- countdown 0
--
-- Recursive case:
--
-- countdown n
--
-- calls:
--
-- countdown (n - 1)

countdown :: Int -> [Int]
countdown 0 = [0]
countdown n = n : countdown (n - 1)


-- ------------------------------------------------------------
-- Sum from 1 to n
-- ------------------------------------------------------------
--
-- Example:
--
-- sumTo 4
--
-- becomes:
--
-- 4 + sumTo 3
-- 4 + 3 + sumTo 2
-- 4 + 3 + 2 + sumTo 1
-- 4 + 3 + 2 + 1 + sumTo 0
-- 4 + 3 + 2 + 1 + 0
--
-- Result:
--
-- 10

sumTo :: Int -> Int
sumTo 0 = 0
sumTo n = n + sumTo (n - 1)


-- ------------------------------------------------------------
-- Factorial
-- ------------------------------------------------------------
--
-- n! means:
--
-- n * (n - 1) * (n - 2) * ...
--
-- Example:
--
-- 5! = 5 * 4 * 3 * 2 * 1
--
-- Result:
--
-- 120

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)


-- ------------------------------------------------------------
-- Multiplication using recursion
-- ------------------------------------------------------------

multiplyRecursive :: Int -> Int -> Int
multiplyRecursive _ 0 = 0
multiplyRecursive x y =
    x + multiplyRecursive x (y - 1)


-- ------------------------------------------------------------
-- Power
-- ------------------------------------------------------------
--
-- power base exponent
--
-- Example:
--
-- power 2 3
--
-- 2 * 2 * 2
--
-- Result:
--
-- 8

power :: Int -> Int -> Int
power _ 0 = 1
power base exponent =
    base * power base (exponent - 1)


-- ------------------------------------------------------------
-- Recursion with lists
-- ------------------------------------------------------------
--
-- Lists naturally work with recursion because we can
-- split them into:
--
-- []
--
-- and:
--
-- x : xs
--
-- where:
--
-- x  = first element
-- xs = remaining elements


-- ------------------------------------------------------------
-- Count elements
-- ------------------------------------------------------------

countElements :: [Int] -> Int
countElements [] = 0
countElements (_ : xs) =
    1 + countElements xs


-- ------------------------------------------------------------
-- Sum a list
-- ------------------------------------------------------------

sumList :: [Int] -> Int
sumList [] = 0
sumList (x : xs) =
    x + sumList xs


-- ------------------------------------------------------------
-- Multiply all elements
-- ------------------------------------------------------------

productList :: [Int] -> Int
productList [] = 1
productList (x : xs) =
    x * productList xs


-- ------------------------------------------------------------
-- Reverse a list
-- ------------------------------------------------------------
--
-- Example:
--
-- reverseList [1,2,3]
--
-- becomes:
--
-- reverseList [2,3] ++ [1]
--
-- reverseList [3] ++ [2] ++ [1]
--
-- reverseList [] ++ [3] ++ [2] ++ [1]
--
-- Result:
--
-- [3,2,1]

reverseList :: [Int] -> [Int]
reverseList [] = []
reverseList (x : xs) =
    reverseList xs ++ [x]


-- ------------------------------------------------------------
-- Check if a number exists
-- ------------------------------------------------------------

contains :: Int -> [Int] -> Bool
contains _ [] = False
contains target (x : xs)
    | target == x = True
    | otherwise   = contains target xs


-- ------------------------------------------------------------
-- Get the maximum value
-- ------------------------------------------------------------
--
-- This version assumes the list is not empty.

maximumRecursive :: [Int] -> Int
maximumRecursive [x] = x
maximumRecursive (x : xs) =
    if x > maximumRecursive xs
        then x
        else maximumRecursive xs


-- ------------------------------------------------------------
-- Better maximum version
-- ------------------------------------------------------------
--
-- We can avoid repeating the recursive call
-- using a local value.

maximumRecursiveBetter :: [Int] -> Int
maximumRecursiveBetter [x] = x
maximumRecursiveBetter (x : xs)
    | x > restMaximum = x
    | otherwise       = restMaximum
    where
        restMaximum = maximumRecursiveBetter xs


-- ------------------------------------------------------------
-- Minimum value
-- ------------------------------------------------------------

minimumRecursive :: [Int] -> Int
minimumRecursive [x] = x
minimumRecursive (x : xs)
    | x < restMinimum = x
    | otherwise       = restMinimum
    where
        restMinimum = minimumRecursive xs


-- ------------------------------------------------------------
-- Take elements recursively
-- ------------------------------------------------------------
--
-- Similar to the built-in take function.

takeRecursive :: Int -> [Int] -> [Int]
takeRecursive 0 _ = []
takeRecursive _ [] = []
takeRecursive n (x : xs) =
    x : takeRecursive (n - 1) xs


-- ------------------------------------------------------------
-- Drop elements recursively
-- ------------------------------------------------------------

dropRecursive :: Int -> [Int] -> [Int]
dropRecursive 0 xs = xs
dropRecursive _ [] = []
dropRecursive n (_ : xs) =
    dropRecursive (n - 1) xs


-- ------------------------------------------------------------
-- Duplicate every element
-- ------------------------------------------------------------

duplicateElements :: [Int] -> [Int]
duplicateElements [] = []
duplicateElements (x : xs) =
    x : x : duplicateElements xs


-- ------------------------------------------------------------
-- Double every element
-- ------------------------------------------------------------

doubleElements :: [Int] -> [Int]
doubleElements [] = []
doubleElements (x : xs) =
    (x * 2) : doubleElements xs


-- ------------------------------------------------------------
-- Keep only positive numbers
-- ------------------------------------------------------------

positiveNumbers :: [Int] -> [Int]
positiveNumbers [] = []
positiveNumbers (x : xs)
    | x > 0     = x : positiveNumbers xs
    | otherwise = positiveNumbers xs


-- ------------------------------------------------------------
-- Keep only even numbers
-- ------------------------------------------------------------

evenNumbers :: [Int] -> [Int]
evenNumbers [] = []
evenNumbers (x : xs)
    | mod x 2 == 0 = x : evenNumbers xs
    | otherwise    = evenNumbers xs


-- ------------------------------------------------------------
-- Recursion with Strings
-- ------------------------------------------------------------
--
-- Remember:
--
-- String = [Char]
--
-- So we can process Strings recursively too.

countCharacters :: String -> Int
countCharacters [] = 0
countCharacters (_ : xs) =
    1 + countCharacters xs


-- ------------------------------------------------------------
-- Check whether a String contains a character
-- ------------------------------------------------------------

containsCharacter :: Char -> String -> Bool
containsCharacter _ [] = False
containsCharacter target (x : xs)
    | target == x = True
    | otherwise   = containsCharacter target xs


-- ------------------------------------------------------------
-- Remove a character
-- ------------------------------------------------------------

removeCharacter :: Char -> String -> String
removeCharacter _ [] = []
removeCharacter target (x : xs)
    | target == x = removeCharacter target xs
    | otherwise   = x : removeCharacter target xs


-- ------------------------------------------------------------
-- Fibonacci
-- ------------------------------------------------------------
--
-- Fibonacci sequence:
--
-- 0, 1, 1, 2, 3, 5, 8, 13...
--
-- fib 0 = 0
-- fib 1 = 1
--
-- Every other value is:
--
-- fib (n - 1) + fib (n - 2)
--
-- This version is simple for learning,
-- but it is not efficient for large numbers.

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n =
    fibonacci (n - 1) + fibonacci (n - 2)


-- ------------------------------------------------------------
-- Important: base cases
-- ------------------------------------------------------------
--
-- Recursive functions need a way to stop.
--
-- For example:
--
-- factorial 0 = 1
--
-- is the base case.
--
-- Without a base case, recursion may continue forever.


-- ------------------------------------------------------------
-- Important: make progress
-- ------------------------------------------------------------
--
-- Each recursive call should normally move closer
-- to the base case.
--
-- Good:
--
-- factorial n =
--     n * factorial (n - 1)
--
--
-- Bad:
--
-- factorial n =
--     n * factorial n
--
-- The second version never gets closer to 0.


-- ------------------------------------------------------------
-- Recursion pattern for lists
-- ------------------------------------------------------------
--
-- A very common recursive pattern is:
--
-- function [] = baseValue
-- function (x : xs) =
--     somethingWith x (function xs)
--
-- Example:
--
-- sumList [] = 0
-- sumList (x : xs) =
--     x + sumList xs


-- ------------------------------------------------------------
-- main
-- ------------------------------------------------------------

main :: IO ()
main = do
    putStrLn "=== Recursion ==="

    putStrLn ("countdown 5 = " ++ show (countdown 5))

    putStrLn ("sumTo 5 = " ++ show (sumTo 5))

    putStrLn ("factorial 5 = " ++ show (factorial 5))

    putStrLn ("multiplyRecursive 5 4 = "
        ++ show (multiplyRecursive 5 4))

    putStrLn ("power 2 5 = "
        ++ show (power 2 5))

    putStrLn ("countElements [10,20,30,40] = "
        ++ show (countElements [10,20,30,40]))

    putStrLn ("sumList [1,2,3,4,5] = "
        ++ show (sumList [1,2,3,4,5]))

    putStrLn ("productList [1,2,3,4] = "
        ++ show (productList [1,2,3,4]))

    putStrLn ("reverseList [1,2,3,4] = "
        ++ show (reverseList [1,2,3,4]))

    putStrLn ("contains 3 [1,2,3,4] = "
        ++ show (contains 3 [1,2,3,4]))

    putStrLn ("contains 10 [1,2,3,4] = "
        ++ show (contains 10 [1,2,3,4]))

    putStrLn ("maximumRecursiveBetter [10,5,30,20] = "
        ++ show (maximumRecursiveBetter [10,5,30,20]))

    putStrLn ("minimumRecursive [10,5,30,20] = "
        ++ show (minimumRecursive [10,5,30,20]))

    putStrLn ("takeRecursive 3 [10,20,30,40,50] = "
        ++ show (takeRecursive 3 [10,20,30,40,50]))

    putStrLn ("dropRecursive 2 [10,20,30,40,50] = "
        ++ show (dropRecursive 2 [10,20,30,40,50]))

    putStrLn ("duplicateElements [1,2,3] = "
        ++ show (duplicateElements [1,2,3]))

    putStrLn ("doubleElements [1,2,3,4] = "
        ++ show (doubleElements [1,2,3,4]))

    putStrLn ("positiveNumbers [-3,5,-1,10,0] = "
        ++ show (positiveNumbers [-3,5,-1,10,0]))

    putStrLn ("evenNumbers [1,2,3,4,5,6] = "
        ++ show (evenNumbers [1,2,3,4,5,6]))

    putStrLn ("countCharacters \"Haskell\" = "
        ++ show (countCharacters "Haskell"))

    putStrLn ("containsCharacter 'a' \"Haskell\" = "
        ++ show (containsCharacter 'a' "Haskell"))

    putStrLn ("removeCharacter 'l' \"Hello\" = "
        ++ removeCharacter 'l' "Hello")

    putStrLn ("fibonacci 10 = "
        ++ show (fibonacci 10))


-- ============================================================
-- Exercises
-- ============================================================

-- 1. Create a function called sumFromOne.
--
-- Example:
--
-- sumFromOne 4
--
-- 1 + 2 + 3 + 4
--
-- Result:
--
-- 10
--
-- sumFromOne :: Int -> Int


-- 2. Create a recursive function called squareSum.
--
-- Example:
--
-- squareSum 3
--
-- 3^2 + 2^2 + 1^2
--
-- Result:
--
-- 14
--
-- squareSum :: Int -> Int


-- 3. Create your own recursive version of length.
--
-- Do not use length.
--
-- myLength :: [Int] -> Int


-- 4. Create your own recursive version of sum.
--
-- Do not use sum.
--
-- mySum :: [Int] -> Int


-- 5. Create a recursive function called incrementAll.
--
-- Example:
--
-- incrementAll [1,2,3]
--
-- returns:
--
-- [2,3,4]
--
-- incrementAll :: [Int] -> [Int]


-- 6. Create a recursive function called removeNegative.
--
-- Example:
--
-- removeNegative [-5,10,-3,20]
--
-- returns:
--
-- [10,20]
--
-- removeNegative :: [Int] -> [Int]


-- 7. Create a recursive function called countEven.
--
-- Example:
--
-- countEven [1,2,3,4,6]
--
-- returns:
--
-- 3
--
-- countEven :: [Int] -> Int


-- 8. Create a recursive function called repeatValue.
--
-- Example:
--
-- repeatValue 3 10
--
-- returns:
--
-- [10,10,10]
--
-- repeatValue :: Int -> Int -> [Int]


-- 9. Create your own recursive version of elem.
--
-- myElem :: Int -> [Int] -> Bool


-- 10. Create a recursive function called lastRecursive.
--
-- Example:
--
-- lastRecursive [10,20,30]
--
-- returns:
--
-- 30
--
-- Assume the list is not empty.


-- 11. Create a recursive function called removeFirst.
--
-- It removes only the first occurrence of a number.
--
-- Example:
--
-- removeFirst 2 [1,2,3,2]
--
-- returns:
--
-- [1,3,2]


-- 12. Create a recursive function called countCharacter.
--
-- Example:
--
-- countCharacter 'l' "Hello"
--
-- returns:
--
-- 2


-- 13. Try to understand this evaluation:
--
-- sumList [1,2,3]
--
-- becomes:
--
-- 1 + sumList [2,3]
--
-- 1 + (2 + sumList [3])
--
-- 1 + (2 + (3 + sumList []))
--
-- 1 + (2 + (3 + 0))
--
-- 6


-- 14. Open GHCi and test:
--
-- :load 10-recursion.hs
--
-- factorial 5
--
-- factorial 10
--
-- sumTo 100
--
-- countdown 10
--
-- power 2 8
--
-- sumList [1..10]
--
-- countElements [1..100]
--
-- reverseList [1,2,3,4,5]
--
-- contains 50 [1..100]
--
-- takeRecursive 5 [1..20]
--
-- dropRecursive 5 [1..20]
--
-- doubleElements [1..10]
--
-- positiveNumbers [-5..5]
--
-- evenNumbers [1..20]
--
-- fibonacci 10
--
-- :t factorial
--
-- :t sumList
--
-- :t contains
--
-- :t fibonacci