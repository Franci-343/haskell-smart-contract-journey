# Haskell Installation Guide

This guide explains how to install a complete Haskell development environment on:

* Windows
* Linux
* macOS

By the end of this guide, you will have the following tools available:

* **GHC** — Glasgow Haskell Compiler
* **GHCi** — Interactive Haskell environment
* **Cabal** — Haskell build system and package manager
* **GHCup** — Haskell toolchain installer and version manager

---

# 1. Understanding the Haskell Toolchain

Before installing Haskell, it is useful to understand the main tools involved.

## GHC

**GHC** stands for **Glasgow Haskell Compiler**.

It is the main compiler used by the Haskell ecosystem.

A Haskell source file:

```text
Main.hs
```

can be compiled with:

```bash
ghc Main.hs
```

GHC will generate a native executable for your operating system.

You can check your installed GHC version with:

```bash
ghc --version
```

---

## GHCi

**GHCi** stands for **Glasgow Haskell Compiler Interactive**.

It is the interactive environment that comes with GHC.

GHCi works as a REPL:

```text
Read
Evaluate
Print
Loop
```

It allows you to experiment with Haskell without creating or compiling an entire program.

Start GHCi with:

```bash
ghci
```

Example:

```haskell
ghci> 2 + 2
4

ghci> "Hello" ++ " Haskell!"
"Hello Haskell!"

ghci> :t True
True :: Bool
```

Exit GHCi with:

```text
:quit
```

or:

```text
:q
```

> GHCi does not need to be installed separately. It is included with GHC.

---

## Cabal

**Cabal** is one of the standard tools used to build Haskell projects and manage their dependencies.

It allows you to:

* Create Haskell projects
* Build applications
* Run applications
* Run tests
* Install dependencies
* Manage packages

Check the installed version with:

```bash
cabal --version
```

Later in this journey, we will use commands such as:

```bash
cabal init
cabal build
cabal run
cabal test
```

---

## GHCup

**GHCup** is a toolchain installer and version manager for Haskell.

Instead of manually installing GHC, Cabal and other Haskell development tools, GHCup manages them for us.

With GHCup we can install and manage tools such as:

```text
GHC
Cabal
Haskell Language Server
Stack
```

For example:

```bash
ghcup list
```

shows the available tool versions.

---

# 2. Recommended Installation Method

The recommended approach in this guide is:

```text
GHCup
  │
  ├── GHC
  │    └── GHCi
  │
  ├── Cabal
  │
  └── Haskell Language Server
```

We will therefore install **GHCup first** and let it install the Haskell development environment.

---

# 3. Installing Haskell on Windows

## Requirements

You should have:

* Windows 10 or Windows 11
* PowerShell
* Internet connection

Open **PowerShell**.

You do not normally need to run it as Administrator.

Run the official GHCup bootstrap command:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { & ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -Interactive -DisableCurl } catch { Write-Error $_ }
```

The installer will start an interactive installation process.

Follow the instructions shown by GHCup.

For a development environment, install at least:

```text
GHC
Cabal
```

Installing **Haskell Language Server (HLS)** is also recommended if you plan to use an editor such as Visual Studio Code.

After the installation finishes, close PowerShell and open a new terminal.

---

## Verify GHCup

Run:

```powershell
ghcup --version
```

You should see the installed GHCup version.

---

## Verify GHC

Run:

```powershell
ghc --version
```

You should see something similar to:

```text
The Glorious Glasgow Haskell Compilation System, version X.Y.Z
```

The exact version may be different.

---

## Verify GHCi

Run:

```powershell
ghci
```

You should enter the interactive Haskell environment.

Try:

```haskell
2 + 2
```

You should get:

```text
4
```

Then exit with:

```text
:q
```

---

## Verify Cabal

Run:

```powershell
cabal --version
```

Then update the local package index:

```powershell
cabal update
```

---

# 4. Installing Haskell on Linux

GHCup supports the major Linux distributions.

Before installing it, make sure that `curl` is available.

---

## Ubuntu / Debian

Update the package index:

```bash
sudo apt update
```

Install common development dependencies:

```bash
sudo apt install build-essential curl libffi-dev libffi8ubuntu1 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
```

> Package names can vary between Ubuntu and Debian versions. If one of these packages is unavailable, check the corresponding package provided by your distribution.

Then install GHCup:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Follow the interactive installation process.

At minimum, install:

```text
GHC
Cabal
```

Installing Haskell Language Server is also recommended.

---

## Other Linux distributions

The same GHCup installer can normally be used:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Depending on your distribution, additional system libraries or build tools may be required.

Consult your distribution documentation if GHCup reports a missing dependency.

---

## Reload your shell

After installation, restart the terminal.

Alternatively, reload your shell configuration.

For Bash:

```bash
source ~/.bashrc
```

For Zsh:

```bash
source ~/.zshrc
```

---

## Verify the installation

Check GHCup:

```bash
ghcup --version
```

Check GHC:

```bash
ghc --version
```

Check Cabal:

```bash
cabal --version
```

Start GHCi:

```bash
ghci
```

Inside GHCi:

```haskell
ghci> 10 * 10
100
```

Exit:

```text
:q
```

Finally:

```bash
cabal update
```

---

# 5. Installing Haskell on macOS

GHCup is also available for macOS.

Before installing Haskell, install the Apple command-line development tools.

Run:

```bash
xcode-select --install
```

Follow the macOS installation dialog.

After the command-line tools are available, install GHCup:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

Follow the interactive installation process.

Install at least:

```text
GHC
Cabal
```

Haskell Language Server is also recommended.

---

## Reload the shell

Close and reopen the terminal.

Or, if you use Zsh:

```bash
source ~/.zshrc
```

---

## Verify the installation

Check GHCup:

```bash
ghcup --version
```

Check GHC:

```bash
ghc --version
```

Check Cabal:

```bash
cabal --version
```

Start GHCi:

```bash
ghci
```

Try:

```haskell
ghci> 42
42
```

Exit:

```text
:q
```

Update Cabal:

```bash
cabal update
```

---

# 6. Verify the Complete Environment

Regardless of your operating system, these commands should work:

```bash
ghcup --version
ghc --version
cabal --version
ghci
```

You can also inspect the installed Haskell toolchain using:

```bash
ghcup list
```

The output shows available and installed versions of tools managed by GHCup.

---

# 7. Your First Haskell Program

Create a file named:

```text
hello.hs
```

Add:

```haskell
main :: IO ()
main = putStrLn "Hello, Haskell!"
```

Compile it:

```bash
ghc hello.hs
```

Run the generated executable.

On Linux and macOS:

```bash
./hello
```

On Windows PowerShell:

```powershell
.\hello.exe
```

Expected output:

```text
Hello, Haskell!
```

---

# 8. Running Haskell Without Creating an Executable

GHC also includes `runghc`.

Instead of manually compiling:

```bash
ghc hello.hs
```

you can run the source file directly:

```bash
runghc hello.hs
```

Expected output:

```text
Hello, Haskell!
```

This is useful for small scripts and learning exercises.

---

# 9. Useful GHCi Commands

Start GHCi:

```bash
ghci
```

Some useful commands:

```text
:t expression
```

Shows the type of an expression.

Example:

```haskell
ghci> :t "hello"
"hello" :: String
```

Load a file:

```text
:l filename.hs
```

Example:

```text
:l hello.hs
```

Reload the current file:

```text
:r
```

Show loaded modules:

```text
:show modules
```

Display help:

```text
:?
```

Exit:

```text
:q
```

---

# 10. Useful GHCup Commands

Show installed and available tools:

```bash
ghcup list
```

Open the interactive GHCup interface:

```bash
ghcup tui
```

Install the recommended GHC:

```bash
ghcup install ghc
```

Install Cabal:

```bash
ghcup install cabal
```

Upgrade GHCup:

```bash
ghcup upgrade
```

GHCup also allows multiple GHC versions to coexist, which becomes useful when different Haskell or Cardano projects require different compiler versions.

---

# 11. Installation Checklist

After completing this guide, verify the following:

```text
[ ] ghcup --version works
[ ] ghc --version works
[ ] cabal --version works
[ ] ghci starts correctly
[ ] cabal update works
[ ] hello.hs compiles
[ ] hello.hs runs successfully
```

If every item works, your Haskell development environment is ready.

---

# 12. What Comes Next?

Now that the development environment is installed, the next step is understanding how the Haskell toolchain fits together.

Continue with:

```text
01-haskell-toolchain/
```

Recommended learning order:

```text
01. GHCup
02. GHC
03. GHCi
04. Cabal
05. Hackage
06. Haskell Language Server
07. Stack
```

After understanding the toolchain, we can start learning the Haskell language itself.

```text
Setup
  ↓
Haskell Toolchain
  ↓
Haskell Basics
  ↓
Intermediate Haskell
  ↓
Advanced Haskell
  ↓
Haskell Projects
  ↓
Cardano Fundamentals
  ↓
Smart Contracts
```

Welcome to Haskell.
