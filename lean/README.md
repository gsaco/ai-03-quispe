# Lean 4 machine-checked verification

This appendix verifies the algebraic core of the paper and the repository's two
pressure tests in Lean 4 with Mathlib. Every theorem is checked by the Lean
kernel. The source contains no `sorry`, `admit`, or project-specific axioms.

## Proof map

| Economic claim | Lean theorem |
|---|---|
| Adding delegation weakly raises the best available surplus | `Modes.menu_expansion` |
| An old feasible opportunity remains feasible | `Modes.old_feasible_remains_feasible` |
| Delegation creates a new feasible opportunity under the strict condition | `Modes.delegation_creates_new_feasible_opportunity` |
| The exact activation-band equivalence | `Threshold.activation_band_iff` |
| The band is nonempty exactly when the new threshold is lower | `Threshold.activation_band_nonempty_iff` |
| Positive threshold reduction and strict threshold lowering are equivalent | `Threshold.positive_reduction_iff` |
| A generic productivity improvement yields the same band | `Threshold.generic_improvement_activation_band` |
| Any lower agent threshold is reproducible by a positive generic shock | `Threshold.agent_threshold_representable_as_generic` |
| Event-time effect equals causal effect plus selected project shock | `Selection.contrast_decomposition` |
| The estimated effect can be positive when the causal effect is zero | `Selection.zero_effect_false_positive` |
| Balanced shocks recover the causal effect | `Selection.balanced_shocks_identify_effect` |
| Flat pre-trends can coexist with an adoption-month false positive | `Selection.flat_pretrend_does_not_rule_out_selection` |

## What the verification establishes

The mode module checks the paper's static menu-expansion logic. The threshold
module proves both directions of the activation-band statement and shows that
strict threshold reduction is the necessary and sufficient condition for a
nonempty band. It then formalizes the first objection: every strictly lower
agent threshold can be written as an ordinary positive threshold improvement.
The algebraic band therefore cannot establish agent specificity by itself.

The selection module separates an event-time contrast into a true effect and a
project-selection component. Under a positive relationship between project
shocks and language breadth, treated developers selected on larger shocks have
a positive estimated contrast even when the true Claude effect is exactly zero.
An exact witness also shows why flat pre-event differences do not eliminate a
shock arriving at adoption.

## Formalization boundary

Lean verifies logical and algebraic implications conditional on their stated
assumptions. It does not verify the paper's GitHub data, reconstruct commits,
estimate the Callaway–Sant'Anna model, or prove that real adoption is selected.
It also does not turn the no-foothold, parallel-trends, or exclusion assumptions
into facts. Those are empirical and economic claims that require evidence.

This boundary is deliberate: the formal appendix distinguishes results that
follow mechanically from definitions from assumptions that must carry the
economic interpretation.

## Build

From this folder:

```bash
lake build --wfail
```

The project pins Lean and Mathlib to version 4.32.1 for reproducibility.
