-- ============================================================
-- 04 - If / Then / Else
-- ============================================================
--
-- In Haskell, if / then / else is used to make decisions.
--
-- General structure:
--
-- if condition
--     then valueIfTrue
--     else valueIfFalse
--
-- Important:
--
-- In Haskell, an if expression MUST always have an else branch.
--
-- This is because if / then / else is an expression,
-- and every expression must produce a value.
--
-- ============================================================


-- ------------------------------------------------------------
-- Simple condition
-- ------------------------------------------------------------
--
-- isPositive receives an Int and returns a Bool.
--
-- If x is greater than 0:
--
--     True
--
-- Otherwise:
--
--     False

isPositive :: Int -> Bool
isPositive x =
    if x > 0
        then True
        else False


-- ------------------------------------------------------------
-- Checking if a number is negative
-- ------------------------------------------------------------

isNegative :: Int -> Bool
isNegative x =
    if x < 0
        then True
        else False


-- ------------------------------------------------------------
-- Checking if a number is zero
-- ------------------------------------------------------------

isZero :: Int -> Bool
isZero x =
    if x == 0
        then True
        else False


-- ------------------------------------------------------------
-- Returning numbers
-- ------------------------------------------------------------
--
-- if / then / else does not have to return Bool.
--
-- It can return any value, as long as both branches
-- return compatible types.

absoluteValue :: Int -> Int
absoluteValue x =
    if x < 0
        then -x
        else x


-- ------------------------------------------------------------
-- Returning Strings
-- ------------------------------------------------------------

numberSign :: Int -> String
numberSign x =
    if x >= 0
        then "Positive or zero"
        else "Negative"


-- ------------------------------------------------------------
-- Checking age
-- ------------------------------------------------------------

isAdult :: Int -> Bool
isAdult age =
    if age >= 18
        then True
        else False


-- ------------------------------------------------------------
-- Returning different messages
-- ------------------------------------------------------------

ageMessage :: Int -> String
ageMessage age =
    if age >= 18
        then "You are an adult."
        else "You are a minor."


-- ------------------------------------------------------------
-- Even or odd
-- ------------------------------------------------------------
--
-- mod returns the remainder of a division.
--
-- Examples:
--
-- mod 10 2 == 0
-- mod 7 2 == 1

isEven :: Int -> Bool
isEven x =
    if mod x 2 == 0
        then True
        else False


-- ------------------------------------------------------------
-- Maximum of two numbers
-- ------------------------------------------------------------

maximumNumber :: Int -> Int -> Int
maximumNumber x y =
    if x > y
        then x
        else y


-- ------------------------------------------------------------
-- Minimum of two numbers
-- ------------------------------------------------------------

minimumNumber :: Int -> Int -> Int
minimumNumber x y =
    if x < y
        then x
        else y


-- ------------------------------------------------------------
-- Nested if expressions
-- ------------------------------------------------------------
--
-- We can put an if inside another if.
--
-- This works, but later we will learn that guards
-- are often cleaner for multiple conditions.

compareWithZero :: Int -> String
compareWithZero x =
    if x > 0
        then "Positive"
        else
            if x < 0
                then "Negative"
                else "Zero"


-- ------------------------------------------------------------
-- Temperature example
-- ------------------------------------------------------------

temperatureMessage :: Double -> String
temperatureMessage temperature =
    if temperature >= 30
        then "It is hot."
        else
            if temperature >= 20
                then "The temperature is pleasant."
                else "It is cold."


-- ------------------------------------------------------------
-- Boolean expressions
-- ------------------------------------------------------------
--
-- Conditions themselves already produce Bool values.
--
-- For example:
--
-- x > 0
--
-- already returns True or False.
--
-- This means some functions can be simplified.


isPositiveSimple :: Int -> Bool
isPositiveSimple x = x > 0


isAdultSimple :: Int -> Bool
isAdultSimple age = age >= 18


isEvenSimple :: Int -> Bool
isEvenSimple x = mod x 2 == 0


-- ------------------------------------------------------------
-- Combining conditions
-- ------------------------------------------------------------
--
-- && means AND
--
-- Both conditions must be True.

isBetweenOneAndTen :: Int -> Bool
isBetweenOneAndTen x =
    if x >= 1 && x <= 10
        then True
        else False


-- ------------------------------------------------------------
-- OR
-- ------------------------------------------------------------
--
-- || means OR
--
-- At least one condition must be True.

isOutsideRange :: Int -> Bool
isOutsideRange x =
    if x < 1 || x > 10
        then True
        else False


-- ------------------------------------------------------------
-- NOT
-- ------------------------------------------------------------
--
-- not reverses a Bool value.
--
-- not True  = False
-- not False = True

isNotZero :: Int -> Bool
isNotZero x =
    not (x == 0)


-- ------------------------------------------------------------
-- main
-- ------------------------------------------------------------

main :: IO ()
main = do
    putStrLn "=== If / Then / Else ==="

    putStrLn ("isPositive 10 = " ++ show (isPositive 10))

    putStrLn ("isNegative (-5) = " ++ show (isNegative (-5)))

    putStrLn ("isZero 0 = " ++ show (isZero 0))

    putStrLn ("absoluteValue (-20) = " ++ show (absoluteValue (-20)))

    putStrLn ("numberSign (-3) = " ++ numberSign (-3))

    putStrLn ("isAdult 20 = " ++ show (isAdult 20))

    putStrLn ("ageMessage 15 = " ++ ageMessage 15)

    putStrLn ("isEven 10 = " ++ show (isEven 10))

    putStrLn ("maximumNumber 10 20 = " ++ show (maximumNumber 10 20))

    putStrLn ("minimumNumber 10 20 = " ++ show (minimumNumber 10 20))

    putStrLn ("compareWithZero 0 = " ++ compareWithZero 0)

    putStrLn ("temperatureMessage 25 = " ++ temperatureMessage 25)

    putStrLn ("isBetweenOneAndTen 5 = " ++ show (isBetweenOneAndTen 5))

    putStrLn ("isOutsideRange 20 = " ++ show (isOutsideRange 20))

    putStrLn ("isNotZero 5 = " ++ show (isNotZero 5))


-- ============================================================
-- Exercises
-- ============================================================

-- 1. Create a function called isGreaterThan100.
--
-- isGreaterThan100 :: Int -> Bool
--
-- Example:
--
-- isGreaterThan100 150
--
-- True


-- 2. Create a function called discount.
--
-- If the price is greater than 100,
-- return price - 10.
--
-- Otherwise return the original price.
--
-- discount :: Double -> Double


-- 3. Create a function called passwordLengthMessage.
--
-- It receives an Int representing the password length.
--
-- If the length is at least 8:
--
-- "Valid password length"
--
-- Otherwise:
--
-- "Password is too short"
--
-- passwordLengthMessage :: Int -> String


-- 4. Create a function called maxOfTwo.
--
-- It receives two Int values
-- and returns the largest one.
--
-- maxOfTwo :: Int -> Int -> Int


-- 5. Create a function called gradeMessage.
--
-- Use nested if expressions.
--
-- score >= 90
--     "Excellent"
--
-- score >= 70
--     "Good"
--
-- score >= 50
--     "Passed"
--
-- otherwise
--     "Failed"
--
-- gradeMessage :: Int -> String


-- 6. Create a function called canEnter.
--
-- The person can enter if:
--
-- age >= 18
--
-- AND
--
-- hasTicket == True
--
-- canEnter :: Int -> Bool -> Bool


-- 7. Test your functions in GHCi:
--
-- :load 04-if-then-else.hs
--
-- isPositive 10
--
-- isPositive (-10)
--
-- absoluteValue (-42)
--
-- isEven 7
--
-- maximumNumber 10 50
--
-- compareWithZero (-3)
--
-- :t isAdult
--
-- :t maximumNumber