# GHCi (The Interactive Haskell Environment)

## 1. Introduction
- **What is a REPL (Read-Eval-Print Loop)?**
A REPL is an interactive programming environment that takes single user inputs (expressions), evaluates them immediately, and prints the result back to the user.
- **Why GHCi is the Haskell developer's best friend.**
GHCi provides immediate feedback, drastically speeding up the learning curve and the development process by allowing developers to test snippets of code without the overhead of writing, compiling, and linking a full executable.

## 2. What is GHCi?
- Explanation of how it allows evaluating expressions, loading modules, and inspecting types without full compilation.
GHCi acts as an interactive shell for Haskell. It compiles code in memory on the fly, allowing you to load existing project modules, evaluate arbitrary Haskell expressions, and inspect the types and kinds of data structures dynamically [[56]]. This rapid feedback loop is essential for understanding how complex functional abstractions behave in real time.

## 3. Essential Commands (The ":commands")
- `:load` (`:l`) and `:reload` (`:r`): Loading and refreshing files.
- `:type` (`:t`): Inspecting the type of an expression.
- `:info` (`:i`): Getting details about a type, typeclass, or function.
- `:kind` (`:k`): Inspecting the kind of a type (crucial for advanced Haskell/Plutus).
- `:quit` (`:q`): Exiting GHCi.

## 4. Debugging in GHCi
- Setting breakpoints: `:break`
- Stepping through code: `:step`, `:continue`
- Inspecting local variables: `:show locals`

GHCi contains a built-in imperative-style debugger that allows you to halt execution at specific lines or functions to inspect the state of variables [[23]]. By using `:break` followed by a module name and line number, or a function name, you can pause your code, step through evaluation with `:step`, and use `:show locals` to examine the values of variables currently in scope [[20]].

## 5. Smart Contract Context (Cardano/Plutus)
- **Testing Plutus Datums and Redeemers interactively before deploying.**
In the Cardano ecosystem, developers heavily rely on GHCi to instantiate and test complex Plutus Datums and Redeemers. By loading smart contract modules into GHCi, developers can serialize Haskell data types into their underlying binary format to ensure they match the exact specifications expected by the Cardano ledger [[43]].
- **Using `:t` to understand complex Plutus type signatures.**
Plutus type signatures are notoriously complex. Using `:t` or `:i` on types like `ScriptContext` or `Validator` helps developers deconstruct nested records and understand exactly what information the Cardano ledger provides to a validator script during execution [[58]].

## 6. Pro Tips & Best Practices
- **Create a `~/.ghci` file to customize your prompt.**
You can permanently change your GHCi prompt and enable helpful default settings by creating a `.ghci` configuration file in your home directory [[41]]. Adding commands like `:set prompt "\x03BB> "` (which displays a lambda symbol) or `:set prompt-cont "| "` makes the REPL much easier to read [[36]].
- **Use `:set -Wall` inside GHCi to enable warnings during interactive sessions.**
This ensures that even when you are quickly prototyping functions in the REPL, the compiler will still alert you to missing pattern matches or unused imports.

## 7. Further Resources
- Link to the [Official GHCi User's Guide](https://downloads.haskell.org/ghc/latest/docs/users_guide/ghci.html).
- Link to the [Haskell Debugging Wiki](https://wiki.haskell.org/Debugging) for advanced debugging techniques.

## 8. Try it Yourself
- *Exercise:* 
  1. Open your terminal and type `ghci` to launch the interactive environment.
  2. Load the standard `Data.Char` module by typing `:m + Data.Char`.
  3. Use the `:t` command on the `isUpper` function to inspect its type signature (`:t isUpper`).
  4. Intentionally trigger a type error by attempting to add a string to an integer (e.g., `"Cardano" + 5`) and observe how GHCi formats the error message to help you understand the type mismatch.