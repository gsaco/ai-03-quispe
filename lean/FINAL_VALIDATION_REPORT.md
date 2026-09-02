# Final Validation Report

## Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub

Updated: 2026-09-01

## Verdict

This is an honest **partial formalization** of the five named propositions in
Quispe and Xu (2026), arXiv v2. All five Lean proof endpoints compile without
`sorry`, `admit`, local axioms, or `native_decide`. The formalization verifies
the finite, order-theoretic core of the model. It does not formalize the
empirical event-study design or identify the observed GitHub changes as causal
frontier expansion.

The main mathematical finding is a real boundary error in Proposition 3. The
paper states that, in the closed-frontier benchmark, the cumulative-language
effect is strictly increasing and concave when the post-agent hazard is merely
positive. A first-use hazard is allowed to equal one. At that endpoint the
effect jumps on impact and is flat afterward, so strict increase and strict
concavity fail. Lean proves the strict result after adding the necessary
interior condition `p < 1`, and separately proves the endpoint counterexample.

## Pinned source

- Paper: *Agentic Delegation and the Language Frontier of Software Developers:
  A Model and Evidence from Claude Code on GitHub*
- Authors: Alexander Quispe and Kevin Xu
- Version: arXiv v2, 2026-07-07
- URL: <https://arxiv.org/abs/2605.25438v2>
- Source SHA-256:
  `cddc048711c43022d5fd01b995bfb1114c728c8c879b809b5fdc354a391d3c35`
- Coverage mode: named theoretical statements
- Inventory: three named assumptions and five named propositions

The source PDF and extracted text are local audit inputs and are ignored by the
paper folder's `.gitignore`.

## Checked results

| Source result | Lean endpoint | What is checked | Status |
|---|---|---|---|
| Proposition 1 | `frontierExpansion` | Adding delegation to the menu weakly raises every activation indicator and the finite language count, path by path. | proved |
| Proposition 2 | `activationBandForUnfamiliarLanguages` | The indicator difference is exactly the half-open band from the delegation threshold to the solo threshold; a monotone CDF gives nonnegative summed band mass. | proved with probability abstraction |
| Proposition 3 | `dynamicCumulativeLanguageEffectCorrected` | Ordered hazards produce a nonnegative cumulative effect; strict growth and strict concavity hold for an interior post-agent hazard. | corrected theorem proved |
| Proposition 4 | `specialistAndAbilityHeterogeneity` | Equal per-language increments sum to candidate count times the common increment; the product rises with candidate count and ability under nonnegativity and monotonicity. | proved |
| Proposition 5 | `repositoryExpansion` | Weakly lower entry costs weakly raise the finite repository count, with strict increase when at least one repository lies in the activation band. | proved |

The paper-facing specifications are in `PaperInterface.lean`. Their exact-type
proof endpoints are in `ProofInterface.lean`. The reusable proof steps and the
boundary counterexample are in `MainTheorems.lean`.

## Proposition 3: source claim, correction, and proof

For one unfamiliar language in the closed-frontier benchmark, define

```text
gap(h) = 1 - (1 - p)^(h + 1).
```

The paper's first difference is

```text
gap(h + 1) - gap(h) = p * (1 - p)^(h + 1).
```

This is strictly positive only when `0 < p < 1`. At `p = 1`, the right-hand
side is zero for every observed transition after impact. Lean records both
facts:

- `closedFrontierStrictDynamics` proves strict increase and strict concavity
  from `0 < p` and `p < 1`.
- `closedFrontierHazardOneNotStrict` proves that the strict inequality is false
  at `p = 1`.

This is a source-statement domain repair, not a proof-engineering convenience.
Because the corrected endpoint is narrower than the printed proposition, the
paper folder remains partially formalized.

## Representation choices

- Languages and repositories are arbitrary finite types. Counts are finite
  sums of zero-one natural-number indicators.
- Surpluses, thresholds, hazards, and activation increments are real numbers.
- Paper assumptions enter as visible theorem premises. No claim is made that
  Lean proves the assumptions empirically.
- The conditional CDF in Proposition 2 is represented by a continuous,
  monotone real function. Lean proves the threshold ordering and nonnegative
  CDF difference. It does not construct a conditional probability measure or
  prove the measure-theoretic identity from first principles.
- Proposition 4 formalizes the equal-increment and monotonicity conclusions. It
  does not formalize the verbal ranking “largest” over a separately defined
  population of specialist types.
- Proposition 5 is a finite opportunity-by-opportunity count theorem. Taking
  expectations preserves the proved pointwise inequality, but an explicit
  probability space is not built here.

## What Lean does not verify

- The GitHub treatment-detection procedure, event-study estimator, controls,
  or standard errors.
- Whether Claude Code adoption is exogenous.
- Whether the observed language changes are true frontier expansion rather
  than selection into adoption, task composition, or measurement changes.
- The comparative-static derivative claims in Assumption 2 as empirical facts.
- The paper's Bayesian-learning extension and descriptive tables/figures.

These are scope boundaries, not failed Lean proofs.

## Build evidence

The paper target was built with the repository-pinned Lean toolchain using:

```text
LEAN_NUM_THREADS=1 lake build QX26AgenticDelegation
```

Result: success; all five exact-type endpoints compiled.

The required paper-scoped command is run from the EconCSLib root before this
folder is copied into the weekly repository:

```text
python3 scripts/paper_contribution.py check QX26AgenticDelegation --fast
```

Its final result is recorded outside this copied folder in the weekly
repository so that this directory remains an exact copy of the generated paper
folder.

## Remaining audit boundary

The Lean proofs are closed, but the repository's full v11 human/LLM semantic
closeout was not completed. The scaffolded semantic-audit sidecars therefore
remain fail-closed and the status is not upgraded to “formalized.” This is the
precise administrative blocker beyond the mathematical scope limitations
listed above.
