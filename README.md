# JSP-000992 Formalization (Erdős Problem #1187)

This repository contains a standalone, fully verified Lean 4 formalization of **Justin Sun Prize Problem JSP-000992** (corresponding to Erdős Problem #1187).

## Problem Statement

> **Catalog Title**: Does every finite coloring of the positive integers contain the specified monochromatic progression of primes or a monochromatic progression with prime common difference?
>
> **Erdős's Question (Part 2)**: Does every finite coloring of the positive integers contain a monochromatic arithmetic progression of length at least 3 whose common difference is prime?

## Mathematical Resolution

The answer is **negative**:
The canonical 4-coloring given by residue modulo 4 (`color4(n) = n % 4`) contains no monochromatic arithmetic progression of length $k \ge 3$ whose common difference is a prime number $p$.

Specifically, if $a$ and $a+p$ have the same residue modulo 4, then $(a+p) \equiv a \pmod 4 \implies p \equiv 0 \pmod 4$, which contradicts the fact that $p$ is prime. Hence, no two adjacent terms in the progression can have the same color, disproving the conjecture.

## Formalization Details

- **Formalizer**: 赵钦 (Qin Zhao, [@Drag0ndddd1118](https://github.com/Drag0ndddd1118))
- **File**: `JSP_000992.lean`
- **Main Theorems**:
  - `JSP_000992.prime_step_four_color_counterexample`: The explicit 4-coloring counterexample.
  - `JSP_000992.jsp_000992_solution`: Disproof of `PrimeStepProgressionConjecture`.
  - `JSP_000992.jsp_000992`: Direct negation of the general conjecture.
- **Dependencies**: Pure Lean 4 core (`leanprover/lean4:v4.34.0`). Zero external dependencies.
- **Soundness**:
  - 0 `sorry`
  - 0 `admit`
  - Kernel axioms: only `[propext]`

## Building and Verification

```bash
lake build
```
