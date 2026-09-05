-- ============================================================
-- 09 - Let and Where
-- ============================================================
--
-- Haskell allows us to create local values inside functions.
--
-- Two common ways are:
--
-- let
--
-- and
--
-- where
--
-- They help us:
--
-- 1. Avoid repeating calculations.
-- 2. Give meaningful names to intermediate values.
-- 3. Make functions easier to read.
--
-- ============================================================


-- ------------------------------------------------------------
-- Simple let
-- ------------------------------------------------------------
--
-- A let expression creates a local value.
--
-- General form:
--
-- let name = value
-- in expression
--
-- Example:
--
-- doubleNumber x =
--     let result = x * 2
--     in result

doubleNumber :: Int -> Int
doubleNumber x =
    let result = x * 2
    in result


-- ------------------------------------------------------------
-- Multiple values with let
-- ------------------------------------------------------------
--
-- We can define several local values.

rectangleInfo :: Double -> Double -> String
rectangleInfo width height =
    let area = width * height
        perimeter = 2 * (width + height)
    in "Area: " ++ show area
        ++ ", Perimeter: " ++ show perimeter


-- ------------------------------------------------------------
-- let with calculations
-- ------------------------------------------------------------

average :: Double -> Double -> Double
average x y =
    let total = x + y
        amount = 2
    in total / amount


-- ------------------------------------------------------------
-- let inside a function
-- ------------------------------------------------------------

circleArea :: Double -> Double
circleArea radius =
    let piValue = 3.141592653589793
    in piValue * radius * radius


-- ------------------------------------------------------------
-- Using let with conditions
-- ------------------------------------------------------------

priceWithDiscount :: Double -> Double
priceWithDiscount price =
    let discount = price * 0.10
    in
        if price >= 100
            then price - discount
            else price


-- ------------------------------------------------------------
-- let with guards
-- ------------------------------------------------------------

scoreMessage :: Int -> String
scoreMessage score =
    let passingScore = 50
        excellentScore = 90
    in
        if score >= excellentScore
            then "Excellent"
            else
                if score >= passingScore
                    then "Passed"
                    else "Failed"


-- ------------------------------------------------------------
-- Simple where
-- ------------------------------------------------------------
--
-- where defines local values after the main expression.
--
-- Example:
--
-- doubleNumberWhere x = result
--     where
--         result = x * 2

doubleNumberWhere :: Int -> Int
doubleNumberWhere x = result
    where
        result = x * 2


-- ------------------------------------------------------------
-- Multiple values with where
-- ------------------------------------------------------------

rectangleInfoWhere :: Double -> Double -> String
rectangleInfoWhere width height =
    "Area: " ++ show area
        ++ ", Perimeter: " ++ show perimeter
    where
        area = width * height
        perimeter = 2 * (width + height)


-- ------------------------------------------------------------
-- Average with where
-- ------------------------------------------------------------

averageWhere :: Double -> Double -> Double
averageWhere x y = total / amount
    where
        total = x + y
        amount = 2


-- ------------------------------------------------------------
-- where with guards
-- ------------------------------------------------------------
--
-- where is very common together with guards.

temperatureMessage :: Double -> String
temperatureMessage temperature
    | temperature >= hotLimit = "Hot"
    | temperature >= warmLimit = "Warm"
    | otherwise = "Cold"
    where
        hotLimit = 30
        warmLimit = 20


-- ------------------------------------------------------------
-- Another guards + where example
-- ------------------------------------------------------------

gradeMessage :: Int -> String
gradeMessage score
    | score >= excellent = "Excellent"
    | score >= good = "Good"
    | score >= passing = "Passed"
    | otherwise = "Failed"
    where
        excellent = 90
        good = 70
        passing = 50


-- ------------------------------------------------------------
-- Local helper functions
-- ------------------------------------------------------------
--
-- where can also define local functions.

calculatePrice :: Double -> Int -> Double
calculatePrice unitPrice quantity =
    subtotal + tax
    where
        subtotal = unitPrice * fromIntegral quantity
        tax = subtotal * 0.15


-- ------------------------------------------------------------
-- fromIntegral
-- ------------------------------------------------------------
--
-- In the previous example:
--
-- unitPrice :: Double
--
-- quantity :: Int
--
-- We cannot directly multiply Double by Int.
--
-- fromIntegral converts an integral value such as Int
-- into a more general numeric type.
--
-- For example:
--
-- fromIntegral quantity
--
-- can be used as a Double in this context.


-- ------------------------------------------------------------
-- Local function with where
-- ------------------------------------------------------------

finalPrice :: Double -> Double
finalPrice price = applyTax discountedPrice
    where
        discountedPrice =
            if price >= 100
                then price * 0.90
                else price

        applyTax value = value * 1.15


-- ------------------------------------------------------------
-- Local function receiving parameters
-- ------------------------------------------------------------

distanceFromOrigin :: Double -> Double -> Double
distanceFromOrigin x y = squareRootOfSum x y
    where
        square value = value * value

        squareRootOfSum a b =
            sqrt (square a + square b)


-- ------------------------------------------------------------
-- let inside do
-- ------------------------------------------------------------
--
-- Inside a do block, let has slightly different syntax.
--
-- We do NOT write "in".
--
-- Example:
--
-- main = do
--     let x = 10
--     print x


-- ------------------------------------------------------------
-- let inside main
-- ------------------------------------------------------------

showLocalValues :: IO ()
showLocalValues = do
    let name = "Haskell"
        year = 1990

    putStrLn ("Language: " ++ name)
    putStrLn ("Year: " ++ show year)


-- ------------------------------------------------------------
-- let vs where
-- ------------------------------------------------------------
--
-- LET:
--
-- calculate x =
--     let result = x * 2
--     in result
--
--
-- WHERE:
--
-- calculate x = result
--     where
--         result = x * 2
--
--
-- Both allow us to create local definitions.
--
-- A common way to think about them:
--
-- let:
--
-- defines values before the expression that uses them.
--
-- where:
--
-- defines values after the main expression.


-- ------------------------------------------------------------
-- let is an expression
-- ------------------------------------------------------------
--
-- A let expression produces a value.
--
-- Example:
--
-- let x = 10
-- in x * 2
--
-- produces:
--
-- 20


-- ------------------------------------------------------------
-- Nested let
-- ------------------------------------------------------------

nestedLetExample :: Int -> Int
nestedLetExample x =
    let doubled = x * 2
        result =
            let extra = 10
            in doubled + extra
    in result


-- ------------------------------------------------------------
-- Values can depend on other local values
-- ------------------------------------------------------------

purchaseSummary :: Double -> Int -> String
purchaseSummary price quantity =
    let subtotal = price * fromIntegral quantity
        tax = subtotal * 0.15
        total = subtotal + tax
    in
        "Subtotal: " ++ show subtotal
        ++ ", Tax: " ++ show tax
        ++ ", Total: " ++ show total


-- ------------------------------------------------------------
-- Same example using where
-- ------------------------------------------------------------

purchaseSummaryWhere :: Double -> Int -> String
purchaseSummaryWhere price quantity =
    "Subtotal: " ++ show subtotal
        ++ ", Tax: " ++ show tax
        ++ ", Total: " ++ show total
    where
        subtotal = price * fromIntegral quantity
        tax = subtotal * 0.15
        total = subtotal + tax


-- ------------------------------------------------------------
-- Pattern matching + where
-- ------------------------------------------------------------

personMessage :: (String, Int) -> String
personMessage (name, age) =
    name ++ " is " ++ category
    where
        category
            | age < 18 = "a minor"
            | age < 65 = "an adult"
            | otherwise = "a senior"


-- ------------------------------------------------------------
-- Lists + local values
-- ------------------------------------------------------------

listSummary :: [Int] -> String
listSummary xs =
    "Length: " ++ show listLength
        ++ ", Sum: " ++ show listSum
    where
        listLength = length xs
        listSum = sum xs


-- ------------------------------------------------------------
-- Avoid repeated calculations
-- ------------------------------------------------------------
--
-- Instead of:
--
-- rectangleMessage width height =
--     "Area: "
--     ++ show (width * height)
--     ++ ", Double area: "
--     ++ show ((width * height) * 2)
--
-- We can calculate the area once.


rectangleMessage :: Double -> Double -> String
rectangleMessage width height =
    "Area: " ++ show area
        ++ ", Double area: " ++ show (area * 2)
    where
        area = width * height


-- ------------------------------------------------------------
-- Scope
-- ------------------------------------------------------------
--
-- Local values only exist inside the function where
-- they are defined.
--
-- For example:
--
-- rectangleMessage has a local value:
--
-- area
--
-- But we cannot use:
--
-- area
--
-- outside rectangleMessage.
--
-- This is called scope.


-- ------------------------------------------------------------
-- main
-- ------------------------------------------------------------

main :: IO ()
main = do
    putStrLn "=== Let and Where ==="

    putStrLn ("doubleNumber 5 = " ++ show (doubleNumber 5))

    putStrLn ("doubleNumberWhere 5 = " ++ show (doubleNumberWhere 5))

    putStrLn ("rectangleInfo 5 3 = " ++ rectangleInfo 5 3)

    putStrLn ("rectangleInfoWhere 5 3 = " ++ rectangleInfoWhere 5 3)

    putStrLn ("average 10 20 = " ++ show (average 10 20))

    putStrLn ("averageWhere 10 20 = " ++ show (averageWhere 10 20))

    putStrLn ("circleArea 5 = " ++ show (circleArea 5))

    putStrLn ("priceWithDiscount 150 = " ++ show (priceWithDiscount 150))

    putStrLn ("temperatureMessage 35 = " ++ temperatureMessage 35)

    putStrLn ("temperatureMessage 25 = " ++ temperatureMessage 25)

    putStrLn ("temperatureMessage 10 = " ++ temperatureMessage 10)

    putStrLn ("gradeMessage 95 = " ++ gradeMessage 95)

    putStrLn ("calculatePrice 10.0 5 = " ++ show (calculatePrice 10.0 5))

    putStrLn ("finalPrice 200 = " ++ show (finalPrice 200))

    putStrLn ("distanceFromOrigin 3 4 = " ++ show (distanceFromOrigin 3 4))

    showLocalValues

    putStrLn ("nestedLetExample 10 = " ++ show (nestedLetExample 10))

    putStrLn ("purchaseSummary 10 5 = " ++ purchaseSummary 10 5)

    putStrLn ("purchaseSummaryWhere 10 5 = " ++ purchaseSummaryWhere 10 5)

    putStrLn ("personMessage (\"Alice\", 25) = "
        ++ personMessage ("Alice", 25))

    putStrLn ("listSummary [1,2,3,4,5] = "
        ++ listSummary [1,2,3,4,5])

    putStrLn ("rectangleMessage 5 4 = "
        ++ rectangleMessage 5 4)


-- ============================================================
-- Exercises
-- ============================================================

-- 1. Create a function called squarePlusTen.
--
-- Use let.
--
-- First calculate:
--
-- square = x * x
--
-- Then return:
--
-- square + 10
--
-- squarePlusTen :: Int -> Int


-- 2. Create the same function using where.
--
-- squarePlusTenWhere :: Int -> Int


-- 3. Create a function called rectangleAreaAndPerimeter.
--
-- Use local values:
--
-- area
-- perimeter
--
-- Return:
--
-- (area, perimeter)
--
-- rectangleAreaAndPerimeter
--     :: Double -> Double -> (Double, Double)


-- 4. Create a function called finalSalary.
--
-- It receives a salary.
--
-- Use:
--
-- bonus = salary * 0.10
-- tax   = salary * 0.15
--
-- Return:
--
-- salary + bonus - tax
--
-- Use let.
--
-- finalSalary :: Double -> Double


-- 5. Rewrite finalSalary using where.


-- 6. Create a function called classifyTemperature.
--
-- Use guards + where.
--
-- Define local values:
--
-- hot = 30
-- warm = 20
--
-- temperature >= hot:
--
-- "Hot"
--
-- temperature >= warm:
--
-- "Warm"
--
-- otherwise:
--
-- "Cold"


-- 7. Create a function called orderTotal.
--
-- It receives:
--
-- price :: Double
-- quantity :: Int
--
-- Calculate:
--
-- subtotal
-- tax = 15%
-- total
--
-- Return the total.
--
-- Hint:
--
-- fromIntegral quantity


-- 8. Create a function called circleInfo.
--
-- It receives a radius.
--
-- Define local values:
--
-- piValue
-- area
-- circumference
--
-- Return:
--
-- (area, circumference)
--
-- Use where.


-- 9. Create a function called listInfo.
--
-- It receives:
--
-- [Int]
--
-- Calculate:
--
-- length
-- sum
-- maximum
--
-- Return:
--
-- (length, sum, maximum)
--
-- Assume the list is not empty.


-- 10. Rewrite this function using local values:
--
-- priceInfo price quantity =
--     "Subtotal: "
--     ++ show (price * fromIntegral quantity)
--     ++ ", Tax: "
--     ++ show ((price * fromIntegral quantity) * 0.15)
--     ++ ", Total: "
--     ++ show (
--         (price * fromIntegral quantity)
--         + ((price * fromIntegral quantity) * 0.15)
--     )
--
-- Avoid calculating the subtotal multiple times.


-- 11. Try let directly in GHCi:
--
-- let x = 10
--
-- x
--
-- let square = x * x
--
-- square


-- 12. Open GHCi and test:
--
-- :load 09-let-and-where.hs
--
-- doubleNumber 10
--
-- doubleNumberWhere 10
--
-- rectangleInfo 10 5
--
-- average 10 30
--
-- circleArea 5
--
-- temperatureMessage 35
--
-- gradeMessage 75
--
-- calculatePrice 25 4
--
-- distanceFromOrigin 3 4
--
-- purchaseSummary 10 5
--
-- listSummary [1,2,3,4,5]
--
-- :t doubleNumber
--
-- :t calculatePrice
--
-- :t distanceFromOrigin