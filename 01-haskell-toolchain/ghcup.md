# GHCup (The Haskell Toolchain Installer)

## 1. Introduction
- What is GHCup? (The official installer and version manager for Haskell).
- Analogy: It's like `nvm` for Node.js, `pyenv` for Python, or `rustup` for Rust.

## 2. What is GHCup?
- Explanation of how it manages isolated installations of GHC, Cabal, HLS (Haskell Language Server), and Stack without messing up system paths.

## 3. Essential Commands
- `ghcup list`: Showing available and installed versions of tools.
- `ghcup install ghc <version>`: Installing a specific GHC version.
- `ghcup set ghc <version>`: Setting the active GHC version globally or locally.
- `ghcup install hls`: Installing the Haskell Language Server (vital for VS Code/Neovim integration).
- `ghcup upgrade`: Upgrading GHCup itself.

## 4. Environment & Configuration
- How GHCup modifies your `PATH` (or PowerShell profile on Windows).
- Using `.ghcup/env` to load the correct environment for a specific project.

## 5. Smart Contract Context (Cardano/Plutus)
- **The #1 Use Case:** Switching to the *exact* GHC and Cabal versions required by the Plutus repository (e.g., `ghcup set ghc 8.10.7` and `ghcup set cabal 3.6.2.0`).
- Ensuring HLS matches the GHC version to get proper IDE autocomplete and type hints in smart contract code.

## 6. Pro Tips & Best Practices
- Never install GHC via OS package managers (like `apt` or `choco`); always use GHCup for better control.
- Use `ghcup tui` for a friendly terminal-based user interface to manage versions.

## 7. Further Resources
- Link to the [Official GHCup Website](https://www.haskell.org/ghcup/).
- Link to the [GHCup Installation Guide for Windows](https://www.haskell.org/ghcup/install/).

## 8. 🛠️ Try it Yourself
- *Exercise:* Use `ghcup list` to see installed tools, then install a different minor version of GHC and switch to it using `ghcup set`. Verify with `ghc --version`.