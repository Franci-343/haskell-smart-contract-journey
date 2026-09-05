-- ============================================================
-- 03 - Functions
-- ============================================================
--
-- Functions are one of the most important concepts in Haskell.
--
-- A function:
--
-- 1. Receives one or more values.
-- 2. Performs some operation.
-- 3. Produces a new value.
--
-- Example:
--
-- double :: Int -> Int
-- double x = x * 2
--
-- The function receives an Int
-- and returns another Int.
--
-- ============================================================


-- ------------------------------------------------------------
-- A simple function
-- ------------------------------------------------------------
--
-- double takes an Int and returns an Int.
--
-- Int -> Int
--
-- can be read as:
--
-- "takes an Int and returns an Int"

double :: Int -> Int
double x = x * 2


-- ------------------------------------------------------------
-- Another simple function
-- ------------------------------------------------------------

square :: Int -> Int
square x = x * x


-- ------------------------------------------------------------
-- Function with two parameters
-- ------------------------------------------------------------
--
-- add receives two Int values and returns an Int.
--
-- Int -> Int -> Int
--
-- For now, we can read this as:
--
-- "takes two Int values and returns an Int"
--
-- We will learn later why Haskell writes the type this way.

add :: Int -> Int -> Int
add x y = x + y


-- ------------------------------------------------------------
-- Subtraction
-- ------------------------------------------------------------

subtractNumbers :: Int -> Int -> Int
subtractNumbers x y = x - y


-- ------------------------------------------------------------
-- Multiplication
-- ------------------------------------------------------------

multiply :: Int -> Int -> Int
multiply x y = x * y


-- ------------------------------------------------------------
-- Function using Double
-- ------------------------------------------------------------
--
-- Functions are not limited to Int.

calculateArea :: Double -> Double -> Double
calculateArea width height = width * height


-- ------------------------------------------------------------
-- Function returning a Bool
-- ------------------------------------------------------------
--
-- A function can return a different type.

isPositive :: Int -> Bool
isPositive x = x > 0


-- ------------------------------------------------------------
-- Function receiving a String
-- ------------------------------------------------------------

greet :: String -> String
greet name = "Hello, " ++ name ++ "!"


-- ------------------------------------------------------------
-- Function calling another function
-- ------------------------------------------------------------
--
-- Functions can use other functions.

quadruple :: Int -> Int
quadruple x = double (double x)


-- ------------------------------------------------------------
-- Function composition
-- ------------------------------------------------------------
--
-- We can combine functions.
--
-- First:
--
-- double x
--
-- Then:
--
-- square (double x)

doubleThenSquare :: Int -> Int
doubleThenSquare x = square (double x)


-- ------------------------------------------------------------
-- Type inference
-- ------------------------------------------------------------
--
-- Haskell can often infer the type of a function.
--
-- We could write:
--
-- increment x = x + 1
--
-- without an explicit type signature.
--
-- However, writing type signatures is usually a good habit,
-- especially while learning.

increment :: Int -> Int
increment x = x + 1


-- ------------------------------------------------------------
-- main
-- ------------------------------------------------------------

main :: IO ()
main = do
    putStrLn "=== Functions ==="

    putStrLn ("double 5 = " ++ show (double 5))

    putStrLn ("square 4 = " ++ show (square 4))

    putStrLn ("add 10 20 = " ++ show (add 10 20))

    putStrLn ("subtractNumbers 10 3 = " ++ show (subtractNumbers 10 3))

    putStrLn ("multiply 6 7 = " ++ show (multiply 6 7))

    putStrLn ("calculateArea 5.5 3.0 = " ++ show (calculateArea 5.5 3.0))

    putStrLn ("isPositive 10 = " ++ show (isPositive 10))

    putStrLn (greet "Haskell Developer")

    putStrLn ("quadruple 3 = " ++ show (quadruple 3))

    putStrLn ("doubleThenSquare 5 = " ++ show (doubleThenSquare 5))

    putStrLn ("increment 9 = " ++ show (increment 9))


-- ============================================================
-- Exercises
-- ============================================================

-- 1. Create a function called triple.
--
-- It should receive an Int and multiply it by 3.
--
-- triple :: Int -> Int
-- triple x = ...


-- 2. Create a function called cube.
--
-- Example:
--
-- cube 3
--
-- should return:
--
-- 27


-- 3. Create a function called divide.
--
-- Use Double instead of Int.
--
-- divide :: Double -> Double -> Double


-- 4. Create a function called isEven.
--
-- Hint:
--
-- Use the mod function.
--
-- Example:
--
-- mod 10 2
--
-- returns:
--
-- 0
--
-- The final function should have this type:
--
-- isEven :: Int -> Bool


-- 5. Create a function called fullName.
--
-- It should receive two Strings:
--
-- firstName
-- lastName
--
-- and return them joined together.
--
-- Example:
--
-- fullName "Ada" "Lovelace"
--
-- should return:
--
-- "Ada Lovelace"


-- 6. Open GHCi and test these functions:
--
-- :load 03-functions.hs
--
-- double 10
--
-- square 5
--
-- add 20 30
--
-- greet "Cardano"
--
-- :t double
--
-- :t add
--
-- :t greet