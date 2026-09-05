-- ============================================================
-- 07 - Pattern Matching
-- ============================================================
--
-- Pattern matching allows us to inspect the structure
-- of values directly.
--
-- Instead of manually extracting values with functions
-- like:
--
-- fst
-- snd
-- head
-- tail
--
-- we can describe the shape of the value we expect.
--
-- Pattern matching is very common in Haskell.
--
-- ============================================================


-- ------------------------------------------------------------
-- Matching exact values
-- ------------------------------------------------------------
--
-- We can define different function behaviors depending
-- on the input value.

describeNumber :: Int -> String
describeNumber 0 = "Zero"
describeNumber 1 = "One"
describeNumber 2 = "Two"
describeNumber _ = "Another number"


-- ------------------------------------------------------------
-- The wildcard _
-- ------------------------------------------------------------
--
-- _ means:
--
-- "I don't care about this value."
--
-- In this example:
--
-- describeNumber _
--
-- matches any Int that was not already matched above.


-- ------------------------------------------------------------
-- Matching Bool values
-- ------------------------------------------------------------

describeBool :: Bool -> String
describeBool True = "The value is True"
describeBool False = "The value is False"


-- ------------------------------------------------------------
-- Matching tuples
-- ------------------------------------------------------------
--
-- Instead of:
--
-- getName person = fst person
--
-- we can destructure the tuple directly.

getName :: (String, Int) -> String
getName (name, age) = name


getAge :: (String, Int) -> Int
getAge (name, age) = age


-- ------------------------------------------------------------
-- Using _ with tuples
-- ------------------------------------------------------------
--
-- If we do not need one part of the tuple,
-- we can ignore it using _.

getNameSimple :: (String, Int) -> String
getNameSimple (name, _) = name


getAgeSimple :: (String, Int) -> Int
getAgeSimple (_, age) = age


-- ------------------------------------------------------------
-- Matching tuples with three values
-- ------------------------------------------------------------

getLanguageName :: (String, Int, Bool) -> String
getLanguageName (name, _, _) = name


getLanguageYear :: (String, Int, Bool) -> Int
getLanguageYear (_, year, _) = year


isLanguageFunctional :: (String, Int, Bool) -> Bool
isLanguageFunctional (_, _, isFunctional) = isFunctional


-- ------------------------------------------------------------
-- Swapping tuple values
-- ------------------------------------------------------------

swapPair :: (Int, Int) -> (Int, Int)
swapPair (x, y) = (y, x)


-- ------------------------------------------------------------
-- Adding tuple values
-- ------------------------------------------------------------

addCoordinates :: (Int, Int) -> Int
addCoordinates (x, y) = x + y


-- ------------------------------------------------------------
-- Pattern matching with lists
-- ------------------------------------------------------------
--
-- Lists have two important patterns:
--
-- []
--
-- represents an empty list.
--
-- x : xs
--
-- represents a non-empty list.
--
-- x  = first element
-- xs = rest of the list


describeList :: [Int] -> String
describeList [] = "The list is empty"
describeList (x : xs) = "The list is not empty"


-- ------------------------------------------------------------
-- Getting the first element
-- ------------------------------------------------------------
--
-- This is similar to head,
-- but now we explicitly handle the empty list.

firstElement :: [Int] -> Int
firstElement [] = 0
firstElement (x : xs) = x


-- ------------------------------------------------------------
-- Getting the remaining elements
-- ------------------------------------------------------------

remainingElements :: [Int] -> [Int]
remainingElements [] = []
remainingElements (x : xs) = xs


-- ------------------------------------------------------------
-- Using _ to ignore values
-- ------------------------------------------------------------

firstElementSimple :: [Int] -> Int
firstElementSimple [] = 0
firstElementSimple (x : _) = x


remainingElementsSimple :: [Int] -> [Int]
remainingElementsSimple [] = []
remainingElementsSimple (_ : xs) = xs


-- ------------------------------------------------------------
-- Matching list sizes
-- ------------------------------------------------------------
--
-- We can match specific list structures.

describeListSize :: [Int] -> String
describeListSize [] = "Empty list"
describeListSize [x] = "List with one element"
describeListSize [x, y] = "List with two elements"
describeListSize _ = "List with three or more elements"


-- ------------------------------------------------------------
-- Matching the first two elements
-- ------------------------------------------------------------

firstTwo :: [Int] -> [Int]
firstTwo (x : y : xs) = [x, y]
firstTwo _ = []


-- ------------------------------------------------------------
-- Matching a specific first element
-- ------------------------------------------------------------

startsWithZero :: [Int] -> Bool
startsWithZero (0 : xs) = True
startsWithZero _ = False


-- ------------------------------------------------------------
-- Checking for an empty list
-- ------------------------------------------------------------

isEmpty :: [Int] -> Bool
isEmpty [] = True
isEmpty _ = False


-- ------------------------------------------------------------
-- Pattern matching with Strings
-- ------------------------------------------------------------
--
-- Remember:
--
-- String = [Char]
--
-- This means we can pattern match Strings
-- just like other lists.

firstCharacter :: String -> Char
firstCharacter [] = '?'
firstCharacter (x : xs) = x


-- ------------------------------------------------------------
-- Checking the first character
-- ------------------------------------------------------------

startsWithH :: String -> Bool
startsWithH ('H' : xs) = True
startsWithH _ = False


-- ------------------------------------------------------------
-- Pattern matching function arguments
-- ------------------------------------------------------------
--
-- We can pattern match directly in the parameters.

calculate :: (Int, Int) -> (Int, Int)
calculate (x, y) =
    (x + y, x * y)


-- ------------------------------------------------------------
-- Nested pattern matching
-- ------------------------------------------------------------
--
-- Patterns can also be nested.

playerName :: (String, (Int, Int)) -> String
playerName (name, (x, y)) = name


playerPosition :: (String, (Int, Int)) -> (Int, Int)
playerPosition (name, (x, y)) = (x, y)


-- ------------------------------------------------------------
-- More useful nested matching
-- ------------------------------------------------------------

playerX :: (String, (Int, Int)) -> Int
playerX (_, (x, _)) = x


playerY :: (String, (Int, Int)) -> Int
playerY (_, (_, y)) = y


-- ------------------------------------------------------------
-- Pattern matching order matters
-- ------------------------------------------------------------
--
-- Haskell checks patterns from top to bottom.
--
-- The first matching pattern is used.
--
-- For example:
--
-- classify 0 = ...
-- classify 1 = ...
-- classify _ = ...
--
-- The wildcard should usually come last.
--
-- If we put:
--
-- classify _ = ...
--
-- first, the other patterns would never be reached.


classify :: Int -> String
classify 0 = "Zero"
classify 1 = "One"
classify _ = "Something else"


-- ------------------------------------------------------------
-- Pattern matching and functions
-- ------------------------------------------------------------

loginMessage :: (String, Bool) -> String
loginMessage (username, True) =
    "Welcome, " ++ username ++ "!"

loginMessage (username, False) =
    "Account disabled for " ++ username


-- ------------------------------------------------------------
-- Pattern matching with lists and recursion preview
-- ------------------------------------------------------------
--
-- Pattern matching is especially powerful when combined
-- with recursion.
--
-- We will study recursion properly later.
--
-- For now, observe this structure:
--
-- []       -> empty list
-- (x : xs) -> first element + remaining elements


countElements :: [Int] -> Int
countElements [] = 0
countElements (x : xs) = 1 + countElements xs


-- ------------------------------------------------------------
-- Sum using pattern matching and recursion
-- ------------------------------------------------------------

sumElements :: [Int] -> Int
sumElements [] = 0
sumElements (x : xs) = x + sumElements xs


-- ------------------------------------------------------------
-- Important idea
-- ------------------------------------------------------------
--
-- Pattern matching does NOT compare values in the same
-- way as if / then / else.
--
-- It matches the STRUCTURE of data.
--
-- Examples:
--
-- []
--
-- matches an empty list.
--
-- (x : xs)
--
-- matches a non-empty list.
--
-- (name, age)
--
-- matches a pair.
--
-- (x, y, z)
--
-- matches a tuple with three values.
--
-- 0
--
-- matches exactly the value 0.
--
-- _
--
-- matches anything.


-- ------------------------------------------------------------
-- main
-- ------------------------------------------------------------

main :: IO ()
main = do
    putStrLn "=== Pattern Matching ==="

    putStrLn ("describeNumber 0 = " ++ describeNumber 0)

    putStrLn ("describeNumber 5 = " ++ describeNumber 5)

    putStrLn ("describeBool True = " ++ describeBool True)

    putStrLn ("getName (\"Alice\", 25) = " ++ getName ("Alice", 25))

    putStrLn ("getAge (\"Alice\", 25) = " ++ show (getAge ("Alice", 25)))

    putStrLn ("swapPair (10, 20) = " ++ show (swapPair (10, 20)))

    putStrLn ("addCoordinates (5, 10) = " ++ show (addCoordinates (5, 10)))

    putStrLn ("describeList [] = " ++ describeList [])

    putStrLn ("describeList [1,2,3] = " ++ describeList [1,2,3])

    putStrLn ("firstElement [10,20,30] = " ++ show (firstElement [10,20,30]))

    putStrLn ("remainingElements [10,20,30] = " ++ show (remainingElements [10,20,30]))

    putStrLn ("describeListSize [] = " ++ describeListSize [])

    putStrLn ("describeListSize [10] = " ++ describeListSize [10])

    putStrLn ("describeListSize [10,20] = " ++ describeListSize [10,20])

    putStrLn ("describeListSize [10,20,30] = " ++ describeListSize [10,20,30])

    putStrLn ("firstTwo [1,2,3,4] = " ++ show (firstTwo [1,2,3,4]))

    putStrLn ("startsWithZero [0,1,2] = " ++ show (startsWithZero [0,1,2]))

    putStrLn ("isEmpty [] = " ++ show (isEmpty []))

    putStrLn ("firstCharacter \"Haskell\" = " ++ show (firstCharacter "Haskell"))

    putStrLn ("startsWithH \"Haskell\" = " ++ show (startsWithH "Haskell"))

    putStrLn ("calculate (5,4) = " ++ show (calculate (5,4)))

    putStrLn ("playerName (\"Alice\", (10,20)) = " ++ playerName ("Alice", (10,20)))

    putStrLn ("playerPosition (\"Alice\", (10,20)) = " ++ show (playerPosition ("Alice", (10,20))))

    putStrLn ("loginMessage (\"Alice\", True) = " ++ loginMessage ("Alice", True))

    putStrLn ("countElements [1,2,3,4] = " ++ show (countElements [1,2,3,4]))

    putStrLn ("sumElements [1,2,3,4] = " ++ show (sumElements [1,2,3,4]))


-- ============================================================
-- Exercises
-- ============================================================

-- 1. Create a function called describeDay.
--
-- It receives an Int.
--
-- 1 -> "Monday"
-- 2 -> "Tuesday"
-- 3 -> "Wednesday"
-- anything else -> "Unknown day"
--
-- describeDay :: Int -> String


-- 2. Create a function called getFirstName.
--
-- It receives:
--
-- (String, String)
--
-- Example:
--
-- ("Ada", "Lovelace")
--
-- and returns:
--
-- "Ada"
--
-- Do not use fst.
--
-- Use pattern matching.


-- 3. Create a function called getLastName.
--
-- Do not use snd.
--
-- Use pattern matching.


-- 4. Create a function called multiplyPair.
--
-- Example:
--
-- multiplyPair (5, 4)
--
-- returns:
--
-- 20
--
-- multiplyPair :: (Int, Int) -> Int


-- 5. Create a function called secondElement.
--
-- Example:
--
-- secondElement [10,20,30]
--
-- returns:
--
-- 20
--
-- If the list does not contain at least two elements,
-- return 0.
--
-- Hint:
--
-- (x : y : xs)


-- 6. Create a function called startsWithOne.
--
-- Example:
--
-- startsWithOne [1,2,3]
--
-- True
--
-- startsWithOne [2,3,4]
--
-- False


-- 7. Create a function called hasOneElement.
--
-- []      -> False
-- [x]     -> True
-- anything else -> False


-- 8. Create a function called firstLetter.
--
-- It receives a String.
--
-- If the String is empty:
--
-- return '?'
--
-- Otherwise return its first character.
--
-- Do not use head.


-- 9. Create a function called swapPerson.
--
-- Example:
--
-- swapPerson ("Alice", 25)
--
-- returns:
--
-- (25, "Alice")
--
-- Think carefully about the return type.


-- 10. Create a function called sumThree.
--
-- It receives:
--
-- (Int, Int, Int)
--
-- and returns the sum of all three values.


-- 11. Create a function called listMessage.
--
-- []       -> "Empty"
--
-- [x]      -> "One element"
--
-- [x, y]   -> "Two elements"
--
-- anything else
--          -> "Many elements"


-- 12. Open GHCi and test:
--
-- :load 07-pattern-matching.hs
--
-- describeNumber 0
--
-- describeNumber 10
--
-- getName ("Ada", 36)
--
-- swapPair (10,20)
--
-- describeList []
--
-- describeList [1,2,3]
--
-- firstElement [10,20,30]
--
-- firstTwo [1,2,3,4]
--
-- startsWithZero [0,5,10]
--
-- startsWithH "Haskell"
--
-- countElements [1,2,3,4,5]
--
-- sumElements [1,2,3,4,5]
--
-- :t describeNumber
--
-- :t firstElement
--
-- :t swapPair
--
-- :t countElements
