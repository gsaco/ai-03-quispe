# Formalization Notes

## How to read this folder

Start with `PaperInterface.lean`. It contains five transparent propositions in
paper order. Then open `ProofInterface.lean`: each theorem has exactly the type
of its corresponding `Spec`. The substantive arguments are in
`MainTheorems.lean`.

The build establishes that Lean accepts the formal statements and proof terms.
It does not establish that the formal statements are empirically true, nor that
they capture every sentence in the paper. The source and scope comparison is in
`FINAL_VALIDATION_REPORT.md` and `SOURCE_INVENTORY.md`.

## Most informative result

`dynamicCumulativeLanguageEffectCorrectedSpec` separates two claims:

1. Weak nonnegativity holds on the closed probability domain when the
   post-agent hazard is at least the pre-agent hazard.
2. Strict growth and strict concavity require the post-agent hazard to lie in
   the open interval between zero and one.

The source paper states only positivity for the strict clause. The theorem
`closedFrontierHazardOneNotStrict` shows why that is insufficient: at hazard
one, first use is immediate and the cumulative gap is flat afterward.

## Proposition-by-proposition interpretation

- **Proposition 1:** a menu expansion cannot remove a previously available
  action, so the finite active-language count cannot fall.
- **Proposition 2:** threshold separation produces the exact half-open
  activation band. CDF monotonicity makes its represented mass nonnegative.
- **Proposition 3:** natural powers preserve hazard ordering; strict geometric
  decay occurs only away from the endpoint.
- **Proposition 4:** equal increments add linearly, and the product is monotone
  when both factors are nonnegative and weakly increasing.
- **Proposition 5:** lower repository entry costs preserve every old feasible
  repository and add at least one when a strict activation-band witness exists.

## Boundaries

The formalization deliberately stops before conditional-measure construction,
the Bayesian-learning extension, and the empirical event-study design. The
administrative v11 semantic-audit sidecars also remain incomplete. Accordingly,
the folder is labelled **partially formalized**, not fully formalized.
