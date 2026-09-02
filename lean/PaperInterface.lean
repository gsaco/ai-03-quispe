import QX26AgenticDelegation.MainTheorems
import QX26AgenticDelegation.Assumptions

/-!
# Human-Facing Paper Interface: Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub

This is the compact Lean file a human should read after formalization to check
whether the paper's definitions and named theorem statements were represented
correctly. Keep the row-level dashboard and LLM audit statements in this file
for every paper. Move implementation details, proof aliases, and bulky helper
lemmas behind imported modules such as `AuditInterface.lean`, but expose the
audited paper-facing statements directly here; do not use
`paper_interface.audit_surface_path`.

Rules for completing this file:

- Keep the paper's definitions/formatted objects first, in source order.
- Expose the actual paper formulas here; do not only point to generic library
  definitions or implementation witnesses.
- A material reusable `EconCSLib` primitive may remain a reference here only
  after `audit/library_semantic_review.json` records its exact bounded library
  declaration and an explicit byte-pinned paper-source connection. The
  dashboard and human-review packet show and source-check that declaration
  before the dependent Spec; a library name, docstring, or glossary is not a
  semantic bridge. Do not add a duplicate paper claim merely to restate it.
- If a named theorem needs a hypothesis that is not derived from earlier Lean
  declarations, declare that hypothesis in `Assumptions.lean` and list it in
  `status.json` `review_surface.assumption_names`.
- Then state the named results directly, with assumptions visible in each
  theorem signature by referencing named paper assumptions imported from
  `Assumptions.lean`.
- In the statement-first phase, write every complete source-facing statement as
  a transparent `<name>Spec : Prop` here, exactly once. Put the paired
  theorem/lemma of that exact type in `ProofInterface.lean`; its temporary
  proof body may be `by sorry` only in a private draft. This separation keeps
  the human semantic surface free of thin wrapper declarations.
- Before drafting that Lean surface, independently inventory every material
  source atom from exact pinned source quote bytes. Do not infer source atoms
  from declaration, binder, field, function, or source-map names.
- Run raw-source-to-expanded-Spec statement matching plus recursive
  premise/conclusion provenance on the skeleton. The semantic comparison uses
  only byte-pinned source quotes (and separately pinned source context) against
  the expanded transparent Spec; map summaries and proof wrappers are not
  semantic inputs. Then freeze each canonical Lean declaration-manifest digest.
- In the proof phase, replace the `ProofInterface.lean` `sorry` with a short
  proof that calls into `MainTheorems.lean` or lower proof files without
  changing the specification or theorem type. Any specification/type change
  invalidates the freeze and requires a fresh statement audit.
- At formalized closeout, complete the v11 realization receipt: Lean Meta checks
  the theorem has exactly the transparent Spec type; each source atom is bound
  to the elaborated Spec surface; closure traversal includes proof and instance
  arguments; and every material terminal has a source, approved correction or
  additional assumption, checked derivation, or version-pinned foundation
  disposition. No data, container, or identifier-based exemption is allowed.
- The transparent `...Spec` is the sole semantic-review target for its source
  claim. The paired theorem/lemma is a proof endpoint whose exact Spec type is
  verified by Lean Meta, not a duplicate source-to-Lean comparison row.
- Keep proof endpoints, exhaustive endpoint aliases, and proof-seam checks in
  `ProofInterface.lean`, implementation modules, or `ProofLedger.lean`, not
  here. Do not create new `PostPaperAudit.lean` or `AuditLedger.lean` files;
  those names are legacy.

## Named Results

Each entry has one semantic-review target (`Spec`) and one proof endpoint (the
paired theorem/lemma). The human dashboard and review packet present that pair
once rather than treating the two declarations as duplicate paper claims.

- `frontierExpansionSpec` -> `frontierExpansion`: Proposition 1 (Frontier expansion), PDF p. 13, Section 4.2, Proposition 1.
- `activationBandForUnfamiliarLanguagesSpec` -> `activationBandForUnfamiliarLanguages`: Proposition 2 (Activation band for unfamiliar languages), PDF pp. 13-14, Section 4.2, Proposition 2, Equations (8)-(9).
- `dynamicCumulativeLanguageEffectCorrectedSpec` -> `dynamicCumulativeLanguageEffectCorrected`: Proposition 3 (Dynamic cumulative-language effect), PDF p. 15, Section 4.3, Proposition 3, Equation (10), with proof on PDF pp. 61-62.
- `specialistAndAbilityHeterogeneitySpec` -> `specialistAndAbilityHeterogeneity`: Proposition 4 (Specialist and ability heterogeneity), PDF pp. 60-61, Appendix A.5, Proposition 4, Equations (22)-(23).
- `repositoryExpansionSpec` -> `repositoryExpansion`: Proposition 5 (Repository expansion), PDF p. 63, Appendix A.8, Proposition 5.
-/

namespace QX26AgenticDelegation

/--
Proposition 1 (Frontier expansion)

Paper statement: For every developer, language, date, and opportunity realization, the Generation-2 activation indicator is weakly greater than the Generation-1 activation indicator; hence the Generation-2 language count is weakly greater path by path.

Source location: PDF p. 13, Section 4.2, Proposition 1
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def frontierExpansionSpec : Prop :=
  ∀ {Language : Type} [Fintype Language] (oldSurplus delegationSurplus : Language → ℝ),
      let oldActive := fun k => if 0 ≤ oldSurplus k then (1 : ℕ) else 0
      let newActive := fun k => if 0 ≤ max (oldSurplus k) (delegationSurplus k) then (1 : ℕ) else 0
      (∀ k, oldActive k ≤ newActive k) ∧
        (∑ k, oldActive k) ≤ ∑ k, newActive k

/--
Proposition 2 (Activation band for unfamiliar languages)

Paper statement: Consider an unfamiliar language satisfying Assumption 1. If B_i,k,t is strictly positive, then the Generation-2 indicator minus the Generation-1 indicator equals the indicator that the opportunity lies between the delegation threshold T_D (inclusive) and solo threshold T_S (exclusive). If the conditional opportunity CDF is continuous, the probability that delegation activates the language is F(T_S) minus F(T_D), and expected language-count expansion is the sum of these differences and is weakly nonnegative.

Source location: PDF pp. 13-14, Section 4.2, Proposition 2, Equations (8)-(9)
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def activationBandForUnfamiliarLanguagesSpec : Prop :=
  ∀ {Language : Type} [Fintype Language]
      (delegationThreshold soloThreshold opportunity : Language → ℝ)
      (cdf : Language → ℝ → ℝ),
      (∀ k, delegationThreshold k < soloThreshold k) →
      (∀ k, Continuous (cdf k)) →
      (∀ k, Monotone (cdf k)) →
      (∀ k,
        (if delegationThreshold k ≤ opportunity k then (1 : ℕ) else 0) -
            (if soloThreshold k ≤ opportunity k then (1 : ℕ) else 0) =
          if delegationThreshold k ≤ opportunity k ∧ opportunity k < soloThreshold k
            then 1 else 0) ∧
        0 ≤ ∑ k, (cdf k (soloThreshold k) - cdf k (delegationThreshold k))

/--
Proposition 3 (Dynamic cumulative-language effect)

Paper statement: For an initially unfamiliar language, let p^g_i,k be the per-period first-use hazard under generation g. If p^2_i,k is weakly greater than p^1_i,k, the expected cumulative-language effect at event-time horizon s is the sum over initially unfamiliar languages of (1-p^1_i,k)^(s+1) minus (1-p^2_i,k)^(s+1), which is weakly nonnegative. In the closed-frontier benchmark p^1_i,k=0<p^2_i,k it is strictly increasing and concave over the observed horizon.

Source location: PDF p. 15, Section 4.3, Proposition 3, Equation (10), with proof on PDF pp. 61-62
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def dynamicCumulativeLanguageEffectCorrectedSpec : Prop :=
  ∀ {Language : Type} [Fintype Language] (p1 p2 : Language → ℝ) (horizon : ℕ),
      (∀ k, 0 ≤ p1 k ∧ p1 k ≤ p2 k ∧ p2 k ≤ 1) →
      0 ≤ ∑ k, ((1 - p1 k) ^ (horizon + 1) - (1 - p2 k) ^ (horizon + 1)) ∧
      (∀ p : ℝ, 0 < p → p < 1 →
        let gap := fun h : ℕ => 1 - (1 - p) ^ (h + 1)
        gap horizon < gap (horizon + 1) ∧
          gap (horizon + 2) - gap (horizon + 1) <
            gap (horizon + 1) - gap horizon)

/--
Proposition 4 (Specialist and ability heterogeneity)

Paper statement: Under Assumption 3, expected expansion into initially unfamiliar languages equals the stock of unfamiliar-language candidates times the common activation increment. It is increasing in the stock of unfamiliar-language candidates and in general ability. The largest extensive-margin gains accrue to high-ability specialists.

Source location: PDF pp. 60-61, Appendix A.5, Proposition 4, Equations (22)-(23)
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def specialistAndAbilityHeterogeneitySpec : Prop :=
  ∀ {Candidate : Type} [Fintype Candidate] (activationIncrement : ℝ → ℝ)
      (ability : ℝ) (candidateCount1 candidateCount2 : ℕ) (ability2 : ℝ),
      (∑ _ : Candidate, activationIncrement ability) =
          (Fintype.card Candidate : ℝ) * activationIncrement ability ∧
      (0 ≤ activationIncrement ability →
        Monotone activationIncrement →
        candidateCount1 ≤ candidateCount2 → ability ≤ ability2 →
        (candidateCount1 : ℝ) * activationIncrement ability ≤
          (candidateCount2 : ℝ) * activationIncrement ability2)

/--
Proposition 5 (Repository expansion)

Paper statement: Suppose each repository requires at least one programming language and carries an entry cost that is weakly decreasing when the developer can activate that language. If agentic delegation weakly expands the active-language set, then the expected number of repositories the developer can contribute to weakly increases. It increases strictly when some repositories require languages in the delegation activation band.

Source location: PDF p. 63, Appendix A.8, Proposition 5
Source status: pinned statement-spec transcription; independent source audit pending

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def repositoryExpansionSpec : Prop :=
  ∀ {Repository : Type} [Fintype Repository]
      (opportunity oldCost newCost : Repository → ℝ),
      (∀ r, newCost r ≤ oldCost r) →
      let oldActive := fun r => if oldCost r ≤ opportunity r then (1 : ℕ) else 0
      let newActive := fun r => if newCost r ≤ opportunity r then (1 : ℕ) else 0
      (∑ r, oldActive r) ≤ ∑ r, newActive r ∧
        ((∃ r, newCost r ≤ opportunity r ∧ opportunity r < oldCost r) →
          (∑ r, oldActive r) < ∑ r, newActive r)

end QX26AgenticDelegation
