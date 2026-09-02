# Formalization Plan

## Source and scope

- Source: arXiv v2, 2026-07-07
- SHA-256: `cddc048711c43022d5fd01b995bfb1114c728c8c879b809b5fdc354a391d3c35`
- Normal scope: all named theoretical statements
- Named assumptions: 3
- Named propositions: 5
- Empirical results, figures, tables, and unnumbered prose: outside the selected
  theorem scope

## Dependency order

1. Threshold and menu order facts support Proposition 1.
2. Threshold separation plus CDF monotonicity support Proposition 2.
3. Hazard ordering and powers on the unit interval support Proposition 3.
4. Finite constant sums and product monotonicity support Proposition 4.
5. Indicator monotonicity and a strict witness support Proposition 5.

The five propositions do not form a single theorem chain. They share finite
sum and order arguments but can be checked independently.

## Proof strategy

- Use natural-number indicators for pathwise counts.
- Use finite sums over arbitrary `Fintype` carriers.
- Prove indicator monotonicity pointwise, then sum it.
- Prove the hazard result by monotonicity of natural powers on nonnegative
  bases.
- Expose strict dynamics by rewriting first differences as
  `p * (1 - p)^(h + 1)`.
- Quarantine the `p = 1` endpoint as a source-statement defect and prove the
  corrected interior theorem.

## Completed proof obligations

| Order | Source item | Lean endpoint | Result |
|---:|---|---|---|
| 1 | Proposition 1 | `frontierExpansion` | closed |
| 2 | Proposition 2 | `activationBandForUnfamiliarLanguages` | closed under explicit CDF abstraction |
| 3 | Proposition 3 | `dynamicCumulativeLanguageEffectCorrected` | corrected interior theorem closed |
| 4 | Proposition 4 | `specialistAndAbilityHeterogeneity` | closed |
| 5 | Proposition 5 | `repositoryExpansion` | closed |

## Deliberate boundaries

- No probability-space construction for the conditional CDF or expectations.
- No formalization of the empirical design or causal identification.
- No full v11 source-to-Spec semantic closeout.

These boundaries require a partial-formalization status even though the Lean
target builds without proof holes.
