-- ============================================================
-- 08 - Guards
-- ============================================================
--
-- Guards allow us to define different results depending
-- on one or more conditions.
--
-- They are especially useful when a function has
-- multiple conditions.
--
-- General structure:
--
-- functionName x
--     | condition1 = result1
--     | condition2 = result2
--     | otherwise  = defaultResult
--
-- The | symbol introduces a guard.
--
-- Haskell checks guards from top to bottom.
--
-- ============================================================


-- ------------------------------------------------------------
-- Simple guard
-- ------------------------------------------------------------

numberSign :: Int -> String
numberSign x
    | x > 0     = "Positive"
    | x < 0     = "Negative"
    | otherwise = "Zero"


-- ------------------------------------------------------------
-- otherwise
-- ------------------------------------------------------------
--
-- otherwise is used as the final fallback.
--
-- Conceptually:
--
-- otherwise = True
--
-- So it matches when none of the previous guards matched.


-- ------------------------------------------------------------
-- Age classification
-- ------------------------------------------------------------

ageCategory :: Int -> String
ageCategory age
    | age < 0     = "Invalid age"
    | age < 13    = "Child"
    | age < 18    = "Teenager"
    | age < 65    = "Adult"
    | otherwise   = "Senior"


-- ------------------------------------------------------------
-- Grade classification
-- ------------------------------------------------------------

gradeMessage :: Int -> String
gradeMessage score
    | score >= 90 = "Excellent"
    | score >= 70 = "Good"
    | score >= 50 = "Passed"
    | otherwise   = "Failed"


-- ------------------------------------------------------------
-- Maximum of two numbers
-- ------------------------------------------------------------

maximumNumber :: Int -> Int -> Int
maximumNumber x y
    | x > y     = x
    | otherwise = y


-- ------------------------------------------------------------
-- Minimum of two numbers
-- ------------------------------------------------------------

minimumNumber :: Int -> Int -> Int
minimumNumber x y
    | x < y     = x
    | otherwise = y


-- ------------------------------------------------------------
-- Absolute value
-- ------------------------------------------------------------

absoluteValue :: Int -> Int
absoluteValue x
    | x < 0     = -x
    | otherwise = x


-- ------------------------------------------------------------
-- Even or odd
-- ------------------------------------------------------------

evenOrOdd :: Int -> String
evenOrOdd x
    | mod x 2 == 0 = "Even"
    | otherwise    = "Odd"


-- ------------------------------------------------------------
-- Temperature classification
-- ------------------------------------------------------------

temperatureMessage :: Double -> String
temperatureMessage temperature
    | temperature >= 30 = "Hot"
    | temperature >= 20 = "Pleasant"
    | temperature >= 10 = "Cold"
    | otherwise         = "Very cold"


-- ------------------------------------------------------------
-- BMI-like classification example
-- ------------------------------------------------------------
--
-- This is only an example of guard syntax,
-- not a health recommendation.

numberCategory :: Double -> String
numberCategory value
    | value < 0     = "Negative"
    | value == 0    = "Zero"
    | value < 10    = "Small positive number"
    | value < 100   = "Medium positive number"
    | otherwise     = "Large positive number"


-- ------------------------------------------------------------
-- Multiple conditions
-- ------------------------------------------------------------
--
-- Guards can use &&.
--
-- && means AND.
--
-- Both conditions must be True.

isInsideRange :: Int -> String
isInsideRange x
    | x >= 1 && x <= 10 = "Inside range"
    | otherwise         = "Outside range"


-- ------------------------------------------------------------
-- OR conditions
-- ------------------------------------------------------------
--
-- || means OR.
--
-- At least one condition must be True.

rangeMessage :: Int -> String
rangeMessage x
    | x < 0 || x > 100 = "Outside valid range"
    | otherwise        = "Inside valid range"


-- ------------------------------------------------------------
-- Several function parameters
-- ------------------------------------------------------------

compareNumbers :: Int -> Int -> String
compareNumbers x y
    | x > y     = "First number is greater"
    | x < y     = "Second number is greater"
    | otherwise = "Both numbers are equal"


-- ------------------------------------------------------------
-- Checking login conditions
-- ------------------------------------------------------------

canLogin :: Bool -> Bool -> String
canLogin hasAccount isActive
    | not hasAccount = "Account does not exist"
    | not isActive   = "Account is disabled"
    | otherwise      = "Login allowed"


-- ------------------------------------------------------------
-- Discount example
-- ------------------------------------------------------------

calculateDiscount :: Double -> Double
calculateDiscount price
    | price >= 1000 = price * 0.80
    | price >= 500  = price * 0.90
    | price >= 100  = price * 0.95
    | otherwise     = price


-- ------------------------------------------------------------
-- Guards vs if / then / else
-- ------------------------------------------------------------
--
-- With nested if expressions:
--
-- describe x =
--     if x > 0
--         then "Positive"
--         else
--             if x < 0
--                 then "Negative"
--                 else "Zero"
--
--
-- With guards:
--
-- describe x
--     | x > 0     = "Positive"
--     | x < 0     = "Negative"
--     | otherwise = "Zero"
--
-- Guards are often easier to read when there are
-- several conditions.


-- ------------------------------------------------------------
-- Order matters
-- ------------------------------------------------------------
--
-- Guards are checked from top to bottom.
--
-- Consider:
--
-- category age
--     | age >= 18 = "Adult"
--     | age >= 65 = "Senior"
--     | otherwise = "Minor"
--
-- The second condition would never be used for age 70,
-- because:
--
-- age >= 18
--
-- already matches first.
--
-- A better order is:
--
-- category age
--     | age >= 65 = "Senior"
--     | age >= 18 = "Adult"
--     | otherwise = "Minor"


ageCategoryAlternative :: Int -> String
ageCategoryAlternative age
    | age >= 65   = "Senior"
    | age >= 18   = "Adult"
    | age >= 0    = "Minor"
    | otherwise   = "Invalid age"


-- ------------------------------------------------------------
-- Guard returning Bool
-- ------------------------------------------------------------

isPositive :: Int -> Bool
isPositive x
    | x > 0     = True
    | otherwise = False


-- ------------------------------------------------------------
-- Simplifying Bool functions
-- ------------------------------------------------------------
--
-- Just like with if expressions, sometimes guards are
-- unnecessary if the condition already returns Bool.
--
-- Instead of:
--
-- isPositive x
--     | x > 0     = True
--     | otherwise = False
--
-- We can simply write:

isPositiveSimple :: Int -> Bool
isPositiveSimple x = x > 0


-- ------------------------------------------------------------
-- Guard with pattern matching
-- ------------------------------------------------------------
--
-- Pattern matching and guards can be combined.

describeList :: [Int] -> String
describeList [] = "Empty list"
describeList xs
    | length xs == 1 = "One element"
    | length xs <= 5 = "Small list"
    | otherwise      = "Large list"


-- ------------------------------------------------------------
-- Pattern matching + guards
-- ------------------------------------------------------------

describeFirstNumber :: [Int] -> String
describeFirstNumber [] = "Empty list"
describeFirstNumber (x : xs)
    | x > 0     = "The first number is positive"
    | x < 0     = "The first number is negative"
    | otherwise = "The first number is zero"


-- ------------------------------------------------------------
-- Tuple + guards
-- ------------------------------------------------------------

coordinateQuadrant :: (Int, Int) -> String
coordinateQuadrant (x, y)
    | x > 0 && y > 0 = "Quadrant I"
    | x < 0 && y > 0 = "Quadrant II"
    | x < 0 && y < 0 = "Quadrant III"
    | x > 0 && y < 0 = "Quadrant IV"
    | x == 0 && y == 0 = "Origin"
    | x == 0 = "On Y axis"
    | otherwise = "On X axis"


-- ------------------------------------------------------------
-- main
-- ------------------------------------------------------------

main :: IO ()
main = do
    putStrLn "=== Guards ==="

    putStrLn ("numberSign 10 = " ++ numberSign 10)

    putStrLn ("numberSign (-5) = " ++ numberSign (-5))

    putStrLn ("numberSign 0 = " ++ numberSign 0)

    putStrLn ("ageCategory 10 = " ++ ageCategory 10)

    putStrLn ("ageCategory 16 = " ++ ageCategory 16)

    putStrLn ("ageCategory 30 = " ++ ageCategory 30)

    putStrLn ("ageCategory 70 = " ++ ageCategory 70)

    putStrLn ("gradeMessage 95 = " ++ gradeMessage 95)

    putStrLn ("gradeMessage 75 = " ++ gradeMessage 75)

    putStrLn ("gradeMessage 40 = " ++ gradeMessage 40)

    putStrLn ("maximumNumber 10 20 = " ++ show (maximumNumber 10 20))

    putStrLn ("minimumNumber 10 20 = " ++ show (minimumNumber 10 20))

    putStrLn ("absoluteValue (-42) = " ++ show (absoluteValue (-42)))

    putStrLn ("evenOrOdd 10 = " ++ evenOrOdd 10)

    putStrLn ("evenOrOdd 7 = " ++ evenOrOdd 7)

    putStrLn ("temperatureMessage 35 = " ++ temperatureMessage 35)

    putStrLn ("temperatureMessage 22 = " ++ temperatureMessage 22)

    putStrLn ("isInsideRange 5 = " ++ isInsideRange 5)

    putStrLn ("isInsideRange 20 = " ++ isInsideRange 20)

    putStrLn ("compareNumbers 10 20 = " ++ compareNumbers 10 20)

    putStrLn ("compareNumbers 20 10 = " ++ compareNumbers 20 10)

    putStrLn ("compareNumbers 10 10 = " ++ compareNumbers 10 10)

    putStrLn ("canLogin True True = " ++ canLogin True True)

    putStrLn ("canLogin True False = " ++ canLogin True False)

    putStrLn ("calculateDiscount 1200 = " ++ show (calculateDiscount 1200))

    putStrLn ("describeList [] = " ++ describeList [])

    putStrLn ("describeList [1,2,3] = " ++ describeList [1,2,3])

    putStrLn ("describeFirstNumber [-10,20,30] = " ++ describeFirstNumber [-10,20,30])

    putStrLn ("coordinateQuadrant (5,5) = " ++ coordinateQuadrant (5,5))

    putStrLn ("coordinateQuadrant (-5,5) = " ++ coordinateQuadrant (-5,5))


-- ============================================================
-- Exercises
-- ============================================================

-- 1. Create a function called classifyNumber.
--
-- If x > 100:
--
-- "Large"
--
-- If x > 0:
--
-- "Positive"
--
-- If x == 0:
--
-- "Zero"
--
-- Otherwise:
--
-- "Negative"
--
-- classifyNumber :: Int -> String


-- 2. Create a function called ticketPrice.
--
-- age < 5:
--
-- 0
--
-- age < 18:
--
-- 5
--
-- age < 65:
--
-- 10
--
-- otherwise:
--
-- 7
--
-- ticketPrice :: Int -> Double


-- 3. Create a function called scoreMessage.
--
-- score >= 90 -> "A"
--
-- score >= 80 -> "B"
--
-- score >= 70 -> "C"
--
-- score >= 60 -> "D"
--
-- otherwise   -> "F"
--
-- scoreMessage :: Int -> String


-- 4. Create a function called compareThree.
--
-- It receives three Int values.
--
-- Return:
--
-- "All equal"
--
-- if all three numbers are equal.
--
-- Otherwise return:
--
-- "Different values"
--
-- compareThree :: Int -> Int -> Int -> String


-- 5. Create a function called shippingCost.
--
-- weight <= 0:
--
-- 0
--
-- weight <= 1:
--
-- 5
--
-- weight <= 5:
--
-- 10
--
-- otherwise:
--
-- 20
--
-- shippingCost :: Double -> Double


-- 6. Create a function called passwordStrength.
--
-- length < 8:
--
-- "Weak"
--
-- length < 12:
--
-- "Medium"
--
-- otherwise:
--
-- "Strong"
--
-- passwordStrength :: Int -> String


-- 7. Create a function called coordinateMessage.
--
-- It receives:
--
-- (Int, Int)
--
-- If both values are zero:
--
-- "Origin"
--
-- If x == 0:
--
-- "Y axis"
--
-- If y == 0:
--
-- "X axis"
--
-- Otherwise:
--
-- "Somewhere in the plane"


-- 8. Rewrite this function using guards:
--
-- temperature x =
--     if x >= 30
--         then "Hot"
--         else
--             if x >= 20
--                 then "Warm"
--                 else
--                     if x >= 10
--                         then "Cold"
--                         else "Very cold"


-- 9. Create a function called listCategory.
--
-- Use pattern matching and guards.
--
-- []:
--
-- "Empty"
--
-- length <= 3:
--
-- "Short"
--
-- length <= 10:
--
-- "Medium"
--
-- otherwise:
--
-- "Long"


-- 10. Open GHCi and test:
--
-- :load 08-guards.hs
--
-- numberSign 10
--
-- numberSign (-10)
--
-- ageCategory 25
--
-- gradeMessage 85
--
-- maximumNumber 100 50
--
-- evenOrOdd 13
--
-- temperatureMessage 15
--
-- compareNumbers 20 20
--
-- calculateDiscount 750
--
-- coordinateQuadrant (10,10)
--
-- coordinateQuadrant (-10,10)
--
-- coordinateQuadrant (0,0)
--
-- :t numberSign
--
-- :t ageCategory
--
-- :t coordinateQuadrant