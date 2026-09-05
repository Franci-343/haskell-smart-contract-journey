-- ============================================================
-- 06 - Tuples
-- ============================================================
--
-- A tuple groups multiple values together.
--
-- Unlike lists:
--
-- 1. Tuples have a fixed size.
-- 2. Tuple elements can have different types.
--
-- Examples:
--
-- (10, 20)
--
-- ("Haskell", 1990)
--
-- ("Alice", 25, True)
--
-- ============================================================


-- ------------------------------------------------------------
-- Pair
-- ------------------------------------------------------------
--
-- A tuple with two values is often called a pair.
--
-- This pair contains two Int values.

coordinates :: (Int, Int)
coordinates = (10, 20)


-- ------------------------------------------------------------
-- Different types
-- ------------------------------------------------------------
--
-- Tuple elements do not need to have the same type.
--
-- Here we have:
--
-- String
-- Int

person :: (String, Int)
person = ("Alice", 25)


-- ------------------------------------------------------------
-- Three values
-- ------------------------------------------------------------
--
-- Tuples can contain more than two values.

user :: (String, Int, Bool)
user = ("Bob", 30, True)


-- ------------------------------------------------------------
-- Tuple type
-- ------------------------------------------------------------
--
-- The type:
--
-- (String, Int)
--
-- means:
--
-- a tuple containing:
--
-- 1. a String
-- 2. an Int

language :: (String, Int)
language = ("Haskell", 1990)


-- ------------------------------------------------------------
-- fst
-- ------------------------------------------------------------
--
-- fst returns the first value of a pair.
--
-- Example:
--
-- fst ("Haskell", 1990)
--
-- returns:
--
-- "Haskell"

languageName :: String
languageName = fst language


-- ------------------------------------------------------------
-- snd
-- ------------------------------------------------------------
--
-- snd returns the second value of a pair.
--
-- Example:
--
-- snd ("Haskell", 1990)
--
-- returns:
--
-- 1990

languageYear :: Int
languageYear = snd language


-- ------------------------------------------------------------
-- Tuple containing Bool
-- ------------------------------------------------------------

account :: (String, Bool)
account = ("alice@example.com", True)


accountEmail :: String
accountEmail = fst account


accountActive :: Bool
accountActive = snd account


-- ------------------------------------------------------------
-- Function returning a tuple
-- ------------------------------------------------------------
--
-- Functions can return tuples.
--
-- This function receives two Int values
-- and returns both values as a tuple.

makePair :: Int -> Int -> (Int, Int)
makePair x y = (x, y)


-- ------------------------------------------------------------
-- Function returning different types
-- ------------------------------------------------------------

createUser :: String -> Int -> (String, Int)
createUser name age = (name, age)


-- ------------------------------------------------------------
-- Function receiving a tuple
-- ------------------------------------------------------------
--
-- Functions can also receive tuples as arguments.

getName :: (String, Int) -> String
getName personData = fst personData


getAge :: (String, Int) -> Int
getAge personData = snd personData


-- ------------------------------------------------------------
-- Function modifying a pair
-- ------------------------------------------------------------
--
-- Tuples are immutable.
--
-- This means that we do not modify the original tuple.
--
-- Instead, we create and return a new tuple.

moveRight :: (Int, Int) -> (Int, Int)
moveRight point =
    (fst point + 1, snd point)


-- ------------------------------------------------------------
-- Swapping values
-- ------------------------------------------------------------

swapPair :: (Int, Int) -> (Int, Int)
swapPair pair =
    (snd pair, fst pair)


-- ------------------------------------------------------------
-- Returning multiple results
-- ------------------------------------------------------------
--
-- Tuples are useful when a function needs to return
-- more than one result.
--
-- This function returns:
--
-- sum
-- product

calculate :: Int -> Int -> (Int, Int)
calculate x y =
    (x + y, x * y)


-- ------------------------------------------------------------
-- Minimum and maximum
-- ------------------------------------------------------------

minAndMax :: Int -> Int -> (Int, Int)
minAndMax x y =
    if x < y
        then (x, y)
        else (y, x)


-- ------------------------------------------------------------
-- Nested tuples
-- ------------------------------------------------------------
--
-- Tuples can contain other tuples.

player :: (String, (Int, Int))
player = ("Player One", (100, 200))


playerName :: String
playerName = fst player


playerPosition :: (Int, Int)
playerPosition = snd player


-- ------------------------------------------------------------
-- Tuple with three different types
-- ------------------------------------------------------------

programmingLanguage :: (String, Int, Bool)
programmingLanguage = ("Haskell", 1990, True)


-- ------------------------------------------------------------
-- Lists vs Tuples
-- ------------------------------------------------------------
--
-- LIST:
--
-- [1, 2, 3]
--
-- All elements normally have the same type.
--
-- The list can contain any number of elements.
--
--
-- TUPLE:
--
-- ("Haskell", 1990, True)
--
-- Elements can have different types.
--
-- The number of elements is fixed by the tuple type.


-- ------------------------------------------------------------
-- Important: tuple sizes are different types
-- ------------------------------------------------------------
--
-- These are different types:
--
-- (Int, Int)
--
-- (Int, Int, Int)
--
-- (String, Int)
--
-- A pair and a triple are not the same type.


-- ------------------------------------------------------------
-- fst and snd only work with pairs
-- ------------------------------------------------------------
--
-- fst and snd work with tuples containing exactly
-- two elements.
--
-- For example:
--
-- fst ("Haskell", 1990)
--
-- works.
--
-- But:
--
-- fst ("Haskell", 1990, True)
--
-- does NOT work.
--
-- Later we will learn pattern matching, which gives us
-- a better way to extract values from tuples.


-- ------------------------------------------------------------
-- main
-- ------------------------------------------------------------

main :: IO ()
main = do
    putStrLn "=== Tuples ==="

    putStrLn ("coordinates = " ++ show coordinates)

    putStrLn ("person = " ++ show person)

    putStrLn ("user = " ++ show user)

    putStrLn ("language = " ++ show language)

    putStrLn ("languageName = " ++ languageName)

    putStrLn ("languageYear = " ++ show languageYear)

    putStrLn ("account = " ++ show account)

    putStrLn ("accountEmail = " ++ accountEmail)

    putStrLn ("accountActive = " ++ show accountActive)

    putStrLn ("makePair 10 20 = " ++ show (makePair 10 20))

    putStrLn ("createUser \"Alice\" 25 = " ++ show (createUser "Alice" 25))

    putStrLn ("getName (\"Bob\", 30) = " ++ getName ("Bob", 30))

    putStrLn ("getAge (\"Bob\", 30) = " ++ show (getAge ("Bob", 30)))

    putStrLn ("moveRight (10, 20) = " ++ show (moveRight (10, 20)))

    putStrLn ("swapPair (10, 20) = " ++ show (swapPair (10, 20)))

    putStrLn ("calculate 5 4 = " ++ show (calculate 5 4))

    putStrLn ("minAndMax 20 10 = " ++ show (minAndMax 20 10))

    putStrLn ("player = " ++ show player)

    putStrLn ("playerName = " ++ playerName)

    putStrLn ("playerPosition = " ++ show playerPosition)

    putStrLn ("programmingLanguage = " ++ show programmingLanguage)


-- ============================================================
-- Exercises
-- ============================================================

-- 1. Create a tuple called book.
--
-- It should contain:
--
-- title :: String
-- pages :: Int
--
-- Example:
--
-- book :: (String, Int)
-- book = ...


-- 2. Create a tuple called productInfo.
--
-- It should contain:
--
-- product name :: String
-- price        :: Double
-- available    :: Bool


-- 3. Create a function called createPoint.
--
-- It receives two Int values
-- and returns them as a tuple.
--
-- createPoint :: Int -> Int -> (Int, Int)


-- 4. Create a function called getFirst.
--
-- Use fst.
--
-- getFirst :: (Int, Int) -> Int


-- 5. Create a function called getSecond.
--
-- Use snd.
--
-- getSecond :: (Int, Int) -> Int


-- 6. Create a function called addCoordinates.
--
-- It receives a pair:
--
-- (x, y)
--
-- and returns:
--
-- x + y
--
-- addCoordinates :: (Int, Int) -> Int


-- 7. Create a function called doubleCoordinates.
--
-- Example:
--
-- doubleCoordinates (2, 5)
--
-- should return:
--
-- (4, 10)
--
-- doubleCoordinates :: (Int, Int) -> (Int, Int)


-- 8. Create a function called mathResults.
--
-- It receives two Int values and returns:
--
-- sum
-- subtraction
-- multiplication
--
-- Example:
--
-- mathResults 10 5
--
-- should return:
--
-- (15, 5, 50)
--
-- mathResults :: Int -> Int -> (Int, Int, Int)


-- 9. Create a tuple containing:
--
-- your favorite programming language
-- the year you started learning it
-- whether you like it
--
-- Example type:
--
-- (String, Int, Bool)


-- 10. Open GHCi and test:
--
-- :load 06-tuples.hs
--
-- coordinates
--
-- person
--
-- fst coordinates
--
-- snd coordinates
--
-- makePair 5 10
--
-- createUser "Ada" 36
--
-- moveRight (10,20)
--
-- calculate 10 5
--
-- minAndMax 100 20
--
-- :t coordinates
--
-- :t person
--
-- :t fst
--
-- :t snd