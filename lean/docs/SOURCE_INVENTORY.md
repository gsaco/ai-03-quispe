# Source Inventory

Pinned source: Quispe and Xu (2026), arXiv v2, 2026-07-07, SHA-256
`cddc048711c43022d5fd01b995bfb1114c728c8c879b809b5fdc354a391d3c35`.

## Named assumptions

1. **Assumption 1 — Augmentation requires a foothold** (PDF p. 12, Section
   4.1): augmentation has weakly nonpositive net value for unfamiliar-language
   skill and strictly positive net value for familiar-language skill.
2. **Assumption 2 — Verification technology** (PDF p. 12, Section 4.1):
   verification cost falls with ability and weakly with skill, while residual
   error weakly falls with ability, skill, and agent capability.
3. **Assumption 3 — Comparable unfamiliar-language candidates** (PDF p. 60,
   Appendix A.5): unfamiliar candidates share a nonnegative per-language
   activation increment that rises with ability under Assumption 2.

The assumptions are restrictions on the paper's model, not propositions Lean
can establish from pure logic. Their operative content appears as explicit
premises in the corresponding paper-facing specifications.

## Named propositions

1. **Proposition 1 — Frontier expansion** (PDF p. 13, Section 4.2).
   Formal target: `frontierExpansionSpec`.
2. **Proposition 2 — Activation band for unfamiliar languages** (PDF pp.
   13–14, Section 4.2, Equations 8–9).
   Formal target: `activationBandForUnfamiliarLanguagesSpec`.
3. **Proposition 3 — Dynamic cumulative-language effect** (PDF p. 15,
   Section 4.3, Equation 10; proof on pp. 61–62).
   Formal target: `dynamicCumulativeLanguageEffectCorrectedSpec`.
4. **Proposition 4 — Specialist and ability heterogeneity** (PDF pp. 60–61,
   Appendix A.5, Equations 22–23).
   Formal target: `specialistAndAbilityHeterogeneitySpec`.
5. **Proposition 5 — Repository expansion** (PDF p. 63, Appendix A.8).
   Formal target: `repositoryExpansionSpec`.

## Defect found

Proposition 3's strict clause is false at the admissible boundary `p2 = 1`.
The formal target adds `p2 < 1` for strict growth and strict concavity while
retaining the paper's closed-domain conditions for weak nonnegativity. The
counterexample is theorem `closedFrontierHazardOneNotStrict`.

## Scope disposition

Numbered surplus/threshold equations are represented only as dependencies of
the selected named propositions. The Bayesian-learning extension, empirical
claims, figures, tables, simulations, and ordinary prose are not independent
targets under the selected `named_theoretical_statements` scope.
