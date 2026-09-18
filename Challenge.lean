/-
  The Justin Sun Prize (孙宇晨奖) — JSP-000992

  **Challenge.lean: the statement of record.**

  This file declares the definitions the problem is phrased with, and the proposition
  `jsp000992Statement`. It proves nothing. `Submission.lean` imports this file, so the proof and the
  statement refer to the *same* constant and the statement cannot drift between them.
  `check.py` type-checks the bridge

      example : JSP_000992.jsp000992Statement := JSP_000992.jsp_000992

  and audits the axioms the submitted proof depends on. A reviewer has only to read this
  file in order to judge *what* has been claimed.
-/


namespace JSP_000992

/-- An integer p is prime if p ≥ 2 and its only divisors are 1 and p. -/
def Prime (p : Nat) : Prop :=
  2 ≤ p ∧ ∀ d : Nat, d ∣ p → d = 1 ∨ d = p

/-- A k-term arithmetic progression starting at a with step d is monochromatic under coloring `color`. -/
def MonochromaticAP {c : Nat} (color : Nat → Fin c) (a d k : Nat) : Prop :=
  ∀ i : Nat, i < k → color (a + i * d) = color a

/-- The statement of the prime common difference conjecture:
for every finite coloring (c colors) and every length k ≥ 3, there exists a monochromatic
arithmetic progression of length k whose common difference p is prime. -/
def PrimeStepProgressionConjecture : Prop :=
  ∀ (c k : Nat), 0 < c → 3 ≤ k → ∀ color : Nat → Fin c,
    ∃ a p : Nat, Prime p ∧ MonochromaticAP color a p k

/-- Canonical 4-coloring by residue modulo 4: color4(n) = n % 4. -/
def color4 (n : Nat) : Fin 4 :=
  ⟨n % 4, Nat.mod_lt n (by decide)⟩

/-- **Statement of record for JSP-000992.**

The proposition this development resolves, phrased with the definitions above and
nothing else. -/

def jsp000992Statement : Prop :=
  Not (∀ (c k : Nat), 0 < c → 3 ≤ k → ∀ color : Nat → Fin c,
        ∃ a p : Nat, Prime p ∧ MonochromaticAP color a p k)

end JSP_000992
