-- ============================================================
-- 02 - Values and Types
-- ============================================================
--
-- In Haskell, every value has a type.
--
-- A VALUE is data that our program can work with.
--
-- Examples:
--
-- 42
-- "Hello"
-- True
-- 'A'
--
-- A TYPE describes what kind of value something is.
--
-- Examples:
--
-- Int
-- String
-- Bool
-- Char
--
-- Haskell is statically typed, which means that types are
-- checked before the program runs.
--
-- ============================================================


-- ------------------------------------------------------------
-- Int
-- ------------------------------------------------------------
--
-- Int represents integer numbers.
--
-- The :: symbol can be read as:
--
-- "has type"
--
-- So:
--
-- myNumber :: Int
--
-- means:
--
-- "myNumber has type Int"

myNumber :: Int
myNumber = 42


-- ------------------------------------------------------------
-- Integer
-- ------------------------------------------------------------
--
-- Integer also represents whole numbers.
--
-- Unlike Int, Integer can represent arbitrarily large numbers.

myBigNumber :: Integer
myBigNumber = 12345678901234567890


-- ------------------------------------------------------------
-- Float
-- ------------------------------------------------------------
--
-- Float represents decimal numbers with single precision.

myFloat :: Float
myFloat = 3.14


-- ------------------------------------------------------------
-- Double
-- ------------------------------------------------------------
--
-- Double represents decimal numbers with higher precision
-- than Float.

myDouble :: Double
myDouble = 3.141592653589793


-- ------------------------------------------------------------
-- Bool
-- ------------------------------------------------------------
--
-- Bool represents boolean values.
--
-- A Bool can only be:
--
-- True
-- False

isLearningHaskell :: Bool
isLearningHaskell = True


-- ------------------------------------------------------------
-- Char
-- ------------------------------------------------------------
--
-- Char represents a single character.
--
-- Characters use single quotes.

myCharacter :: Char
myCharacter = 'H'


-- ------------------------------------------------------------
-- String
-- ------------------------------------------------------------
--
-- String represents text.
--
-- Strings use double quotes.

myString :: String
myString = "Hello, Haskell!"


-- ------------------------------------------------------------
-- Type inference
-- ------------------------------------------------------------
--
-- Haskell can often figure out the type automatically.
--
-- This is called type inference.
--
-- For example:
--
-- language = "Haskell"
--
-- Haskell understands that language is a String.

language = "Haskell"


-- ------------------------------------------------------------
-- main
-- ------------------------------------------------------------
--
-- IO () represents an action that performs input/output.
--
-- We will study IO in more detail later.

main :: IO ()
main = do
    putStrLn "=== Values and Types ==="

    putStrLn ("Int: " ++ show myNumber)

    putStrLn ("Integer: " ++ show myBigNumber)

    putStrLn ("Float: " ++ show myFloat)

    putStrLn ("Double: " ++ show myDouble)

    putStrLn ("Bool: " ++ show isLearningHaskell)

    putStrLn ("Char: " ++ show myCharacter)

    putStrLn ("String: " ++ myString)

    putStrLn ("Inferred String: " ++ language)