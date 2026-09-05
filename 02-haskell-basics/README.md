<p align="center">
  <br />
  <img src="https://img.shields.io/badge/Haskell-5e5086?style=for-the-badge&logo=haskell&logoColor=white" alt="Haskell Badge" />
  <br />
  <span style="font-size:1.2em; font-weight:300; color:#5e5086;">
    Haskell Basics
  </span>
  <br />
</p>

# Haskell Basics

This section covers the fundamental concepts of Haskell.

The goal is to build a strong foundation before moving into intermediate topics such as higher-order functions, algebraic data types, typeclasses, modules, and IO.

The lessons are organized in a progressive order, where each topic builds on concepts introduced previously.

---

## Contents

```text
02-haskell-basics/
│
├── README.md
├── 01-hello-haskell/
├── 02-values-and-types/
├── 03-functions/
├── 04-if-then-else/
├── 05-lists/
├── 06-tuples/
├── 07-pattern-matching/
├── 08-guards/
├── 09-let-and-where/
├── 10-recursion/
└── exercises/
```

---

## 01 - Hello Haskell

Introduction to a basic Haskell program.

Topics:

* `main`
* `IO ()`
* `do`
* `putStrLn`
* Compiling and running a Haskell program
* Loading files in GHCi

Example:

```haskell
main :: IO ()
main = do
    putStrLn "Hello, Haskell!"
```

---

## 02 - Values and Types

Introduction to Haskell's type system.

Topics:

* Values
* Types
* Type signatures
* `::`
* `Int`
* `Integer`
* `Float`
* `Double`
* `Bool`
* `Char`
* `String`
* Type inference
* `show`

Example:

```haskell
age :: Int
age = 25
```

The `::` symbol can be read as:

> has type

So:

```haskell
age :: Int
```

means:

> `age` has type `Int`.

---

## 03 - Functions

Introduction to functions and function application.

Topics:

* Defining functions
* Parameters
* Return values
* Function type signatures
* Functions with multiple parameters
* Calling functions
* Functions calling other functions

Example:

```haskell
double :: Int -> Int
double x = x * 2
```

This type:

```haskell
Int -> Int
```

can be read as:

> Takes an `Int` and returns an `Int`.

---

## 04 - If / Then / Else

Introduction to conditional expressions.

Topics:

* `if`
* `then`
* `else`
* Boolean conditions
* Comparison operators
* `&&`
* `||`
* `not`
* Nested conditions

Example:

```haskell
absoluteValue :: Int -> Int
absoluteValue x =
    if x < 0
        then -x
        else x
```

Unlike some other programming languages, an `if` expression in Haskell always requires an `else` branch.

---

## 05 - Lists

Introduction to one of Haskell's most important data structures.

Topics:

* Creating lists
* List types
* Empty lists
* `head`
* `tail`
* `last`
* `init`
* `length`
* `null`
* `:`
* `++`
* `elem`
* `notElem`
* Ranges
* `take`
* `drop`
* `reverse`
* `sum`
* `product`
* `minimum`
* `maximum`

Example:

```haskell
numbers :: [Int]
numbers = [1, 2, 3, 4, 5]
```

A list normally contains values of the same type.

---

## 06 - Tuples

Introduction to tuples.

Topics:

* Pairs
* Tuples with multiple values
* Tuples with different types
* `fst`
* `snd`
* Functions returning tuples
* Functions receiving tuples
* Nested tuples

Example:

```haskell
person :: (String, Int)
person = ("Alice", 25)
```

Unlike lists, tuples can contain values of different types.

---

## 07 - Pattern Matching

Introduction to one of Haskell's most characteristic features.

Topics:

* Matching exact values
* Wildcard `_`
* Pattern matching with tuples
* Pattern matching with lists
* `[]`
* `x : xs`
* Pattern matching with strings
* Nested patterns
* Pattern order
* Combining pattern matching with functions

Example:

```haskell
describeNumber :: Int -> String
describeNumber 0 = "Zero"
describeNumber 1 = "One"
describeNumber _ = "Another number"
```

Pattern matching allows functions to behave differently depending on the structure of their input.

---

## 08 - Guards

Introduction to guards as a clean way to express multiple conditions.

Topics:

* Guard syntax
* `otherwise`
* Guard order
* Multiple conditions
* Guards with tuples
* Guards with pattern matching
* Replacing nested `if` expressions

Example:

```haskell
numberSign :: Int -> String
numberSign x
    | x > 0     = "Positive"
    | x < 0     = "Negative"
    | otherwise = "Zero"
```

Guards are especially useful when a function needs several conditional branches.

---

## 09 - Let and Where

Introduction to local definitions.

Topics:

* `let`
* `in`
* `where`
* Local values
* Local helper functions
* Scope
* `let` inside `do`
* Guards with `where`
* Avoiding repeated calculations
* `fromIntegral`

Example using `let`:

```haskell
doubleNumber :: Int -> Int
doubleNumber x =
    let result = x * 2
    in result
```

Example using `where`:

```haskell
doubleNumberWhere :: Int -> Int
doubleNumberWhere x = result
    where
        result = x * 2
```

---

## 10 - Recursion

Introduction to recursive functions.

Topics:

* Recursive functions
* Base cases
* Recursive cases
* Recursion with numbers
* Recursion with lists
* Recursion with strings
* Combining recursion and pattern matching
* Building lists recursively
* Fibonacci
* Recursive implementations of common list operations

Example:

```haskell
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
```

A recursive function normally needs:

1. A base case
2. A recursive case

The base case stops the recursion.

---

## Core Concepts

After completing this section, you should understand the basic relationship between:

```text
Values
  ↓
Types
  ↓
Functions
  ↓
Conditions
  ↓
Lists and Tuples
  ↓
Pattern Matching
  ↓
Guards
  ↓
Local Definitions
  ↓
Recursion
```

These concepts form the foundation for functional programming in Haskell.

---

## Important Haskell Syntax

Some syntax introduced in this section:

| Syntax          | Meaning                               |
| --------------- | ------------------------------------- |
| `::`            | Has type                              |
| `->`            | Function input/output                 |
| `=`             | Definition                            |
| `[]`            | Empty list                            |
| `[Int]`         | List of `Int`                         |
| `(Int, String)` | Tuple                                 |
| `:`             | Add an element to the front of a list |
| `++`            | Concatenate lists                     |
| `_`             | Ignore a value in pattern matching    |
| `\|`            | Guard                                 |
| `&&`            | Boolean AND                           |
| `\|\|`          | Boolean OR                            |
| `not`           | Boolean NOT                           |

---

## Working with GHCi

You can load a lesson directly in GHCi.

Example:

```powershell
ghci .\10-recursion.hs
```

Or from inside GHCi:

```text
:l 10-recursion.hs
```

You can inspect the type of any value or function using:

```text
:t factorial
```

Example output:

```text
factorial :: Int -> Int
```

You can reload the current file after making changes with:

```text
:r
```

---

## Recommended Study Method

For each lesson:

1. Read the comments and examples.
2. Run the file.
3. Load it in GHCi.
4. Test each function manually.
5. Change some values.
6. Try to predict the result before executing it.
7. Break the code intentionally and read the compiler error.
8. Recreate some functions without looking at the original implementation.

Compiler errors are an important part of learning Haskell.

---

## Exercises

The `exercises/` directory will contain additional challenges for practicing the concepts introduced in this section.

```text
exercises/
```

These exercises can be completed after finishing the basic lessons.

---

## What's Next?

After completing Haskell Basics, the next step is:

```text
03-haskell-intermediate/
```

Topics will include concepts such as:

```text
Higher-order functions
Lambda functions
map / filter / fold
Algebraic data types
Record syntax
Maybe and Either
Typeclasses
Custom typeclasses
Modules
IO
```

These topics will build on the foundations learned here and move toward more idiomatic functional programming in Haskell.

---

<p align="center">
  <strong>Next:</strong> Haskell Intermediate
</p>
