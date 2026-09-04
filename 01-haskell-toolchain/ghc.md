# GHC (Glasgow Haskell Compiler)

## 1. Introduction
GHC (Glasgow Haskell Compiler) is the premier compiler and interactive development environment for the Haskell programming language. It is the de facto standard in the Haskell ecosystem due to its extensive feature set, robust performance optimizations, strict adherence to language standards, and active development backed by the global Haskell community.

## 2. What is GHC?
GHC handles the entire lifecycle of a Haskell program: parsing the source code, performing rigorous type-checking, applying sophisticated optimizations, and finally generating machine code. 

However, GHC does not compile directly to machine code. Instead, it translates Haskell into an intermediate language known as "GHC Core". This simplified, explicitly typed intermediate language is crucial for smart contract developers. Modern Plutus compilation relies on Plinth (formerly Plutus Tx), which operates as a GHC plugin that directly transforms this Core representation into Untyped Plutus Core (UPLC), the actual language executed by the Cardano ledger.

## 3. Essential Commands
- `ghc --version`: Checks the currently installed GHC version to ensure compatibility with your project's toolchain.
- `ghc -o Main Main.hs`: Compiles the `Main.hs` source file and links it into a standalone executable named `Main`.
- `ghc -c Main.hs`: Compiles the source file into an object file (`.o`) without performing the final linking step.
- `ghc -Wall -Wextra Main.hs`: Compiles the code while enabling strict, comprehensive warnings to catch potential bugs, anti-patterns, and missing pattern matches early in the development cycle.

## 4. Compilation Phases (Optional but useful)
Understanding GHC's internal pipeline is helpful when optimizing code for resource-constrained environments like blockchains. The general flow is:
1. **Haskell Source Code** (What the developer writes)
2. **GHC Core** (A simplified, explicitly typed intermediate language)
3. **STG** (Spineless Tagless G-machine)
4. **Cmm** (A low-level procedural intermediate language)
5. **Assembly Code**
6. **Machine Code** (Native Executable)

*Note: In smart contract compilation, the pipeline branches at the Core phase. The Plinth compiler plugin intercepts the Core representation and translates it into UPLC instead of continuing down the STG/Cmm path.*

## 5. Smart Contract Context (Cardano/Plutus)
- **Version Pinning:** The Cardano ecosystem demands strict version control over the compiler. Historically, Plutus V1 and V2 scripts required exact older versions like GHC 8.10.7. With the advent of Plutus V3 and Plinth, developers must use specific modern major versions (e.g., GHC 9.6.x or specific branches of 9.8/9.10) because the compiler plugin relies on exact internal GHC APIs to translate Haskell into Plutus Core. If the GHC version mismatches the Plinth plugin version, compilation will fail entirely.
- **Optimization Flags:** GHC flags heavily influence the size and execution budget of a compiled Plutus script. Using standard optimization flags like `-O2` enables GHC to aggressively simplify the Core representation before the Plinth plugin processes it. This can drastically reduce the resulting script size and the CPU/Memory units consumed during on-chain execution, directly impacting transaction fees.

## 6. Pro Tips & Best Practices
- Always compile with `-Wall` to catch subtle bugs, unused variables, and missing pattern matches early in the development process.
- Use the `-ddump-simpl` flag during compilation to inspect the optimized GHC Core output. This advanced technique allows smart contract developers to see exactly how the compiler translates high-level Haskell constructs into lower-level operations, which is invaluable for minimizing script size and execution costs.

## 7. Further Resources
- Link to the [Official GHC User's Guide](https://downloads.haskell.org/ghc/latest/docs/users_guide/).
- Link to the [Haskell Optimization Handbook](https://hs-opt-handbook.github.io/src/) for deep dives into GHC flags and performance tuning.

## 8. Try it Yourself
- *Exercise:* 
  1. Create a file named `Hello.hs` containing a simple `main` function that prints "Hello, Cardano!" to the console.
  2. Open your terminal and compile the file using the strict warning flags: `ghc -Wall -o Hello Hello.hs`.
  3. Execute the resulting binary by running `./Hello`. Observe the output and ensure no warnings were generated during the compilation step.