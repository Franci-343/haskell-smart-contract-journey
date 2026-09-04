# Cabal (Common Architecture for Building Applications and Libraries)

## 1. Introduction
Cabal serves a dual purpose in the Haskell ecosystem: it is both a system for defining packages and a command-line tool used to build those packages [[21]]. In the Cardano ecosystem, Cabal is the standard build tool for developing smart contracts and interacting with the blockchain. It provides a robust environment that aligns perfectly with the complex dependency trees required by Plutus, the native smart contract language for Cardano [[2]].

## 2. What is Cabal?
Cabal resolves dependencies by fetching required libraries from repositories and handles compiling multi-module projects into final artifacts [[20]]. While Stack is another popular Haskell build tool, Stack actually uses the Cabal library under the hood to perform the actual compilation of Haskell code [[21]]. The Cardano and Plutus ecosystems heavily favor using `cabal-install` directly alongside Nix. This preference exists because Cabal natively supports the `cabal.project` file, which allows developers to easily manage multiple local packages and fetch specific Git revisions of Plutus libraries.

## 3. Essential Commands
- `cabal init`: Scaffolds a new project. Using the `--minimal` flag provides a stripped-down starting point, which is excellent for learning [[20]].
- `cabal build`: Compiles the project and all of its resolved dependencies. Recent versions of Cabal have optimized this step, with releases like Cabal 3.16 introducing faster Git clones for dependencies [[17]].
- `cabal run <executable-name>`: A convenient command that builds the project and immediately runs the specified executable in one step.
- `cabal repl`: Opens an interactive GHCi session that is pre-loaded with your project's modules and dependencies.
- `cabal clean`: Removes all build artifacts and temporary directories to ensure your next build starts completely clean.

## 4. Understanding the Configuration Files
- **`.cabal` file:** This is the package definition file containing metadata like the `name` and `version` of your project. The `build-depends` section lists all required Haskell libraries, while `ghc-options` allows you to pass specific compiler flags.
- **`cabal.project` file:** This file dictates how the entire project workspace is built, which is crucial for monorepos. In the Cardano ecosystem, this file is indispensable for overriding default package versions and pointing to the Cardano Haskell package repository (CHaP) [[9]].

## 5. Smart Contract Context (Cardano/Plutus)
Managing Plutus dependencies is one of the most critical aspects of Cardano development. Plutus libraries often rely on specific, un-released Git commits or forks that are not yet available on the standard Hackage repository. To handle this, developers use the `source-repository-package` stanza inside the `cabal.project` file. This instructs Cabal to fetch exact versions of Plutus libraries or `cardano-api` directly from their Git repositories using a specific tag or commit hash [[8]].

## 6. Pro Tips & Best Practices
- Always specify upper and lower bounds for dependencies in your `.cabal` file to prevent sudden breakages when major versions of foundational libraries are released.
- Use `cabal freeze` to generate a `cabal.project.freeze` file to lock down exact versions and ensure 100% reproducible builds.
- Developers can also configure extra package repositories in their project files to pull in tested Cardano-specific libraries [[9]].

## 7. Further Resources
- [Cabal User's Guide](https://cabal.readthedocs.io/) - The official documentation covering the latest features, including the modern `cabal target` command [[17]].
- [Haskell Package Hackage](https://hackage.haskell.org/) - The central package archive for Haskell.
- [Cardano Developer Experience](https://devex.intersectmbo.org/) - Official documentation for Cardano and Plutus development [[16]].

## 8. Try it Yourself
- *Exercise:* 
  1. Run `cabal init --minimal` to scaffold a new, clean project.
  2. Open the generated `.cabal` file and add a dependency on the `text` package in the `build-depends` section.
  3. Edit the `Main.hs` file to write a simple program that imports `Data.Text` and prints a "Hello, Cardano!" message to the console.
  4. Execute your program using `cabal run`.