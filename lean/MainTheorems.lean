import Mathlib

/-!
# Paper-Facing Theorems: Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub

This file is the implementation theorem layer for the source paper. Keep
source-faithful definitions and theorem wrappers here, and expose only the
compact human-review subset in `PaperInterface.lean`.

During the statement-first phase, each exact paper-facing proposition lives in a
transparent `<name>Spec : Prop` declaration in `PaperInterface.lean`; the paired
theorem/lemma endpoint belongs in `ProofInterface.lean` and has exactly that
type. Add proof implementations here only after those specifications pass v11
raw-source-to-expanded-Spec review and recursive premise provenance audit. Before full closeout, the v11
realization audit independently binds pinned source atoms to the elaborated Spec
and accounts for the complete Lean closure; a proof hole or a declaration name
is never evidence for that correspondence.
-/

namespace QX26AgenticDelegation

/-! ## Proposition 1: menu expansion -/

theorem frontierExpansionProof
    {Language : Type} [Fintype Language]
    (oldSurplus delegationSurplus : Language → ℝ) :
    let oldActive := fun k => if 0 ≤ oldSurplus k then (1 : ℕ) else 0
    let newActive := fun k =>
      if 0 ≤ max (oldSurplus k) (delegationSurplus k) then (1 : ℕ) else 0
    (∀ k, oldActive k ≤ newActive k) ∧
      (∑ k, oldActive k) ≤ ∑ k, newActive k := by
  dsimp
  have hpoint : ∀ k,
      (if 0 ≤ oldSurplus k then (1 : ℕ) else 0) ≤
        if 0 ≤ max (oldSurplus k) (delegationSurplus k) then (1 : ℕ) else 0 := by
    intro k
    by_cases hold : 0 ≤ oldSurplus k
    · have hnew : 0 ≤ max (oldSurplus k) (delegationSurplus k) :=
        hold.trans (le_max_left _ _)
      simp [hold, hnew]
    · simp [hold]
  exact ⟨hpoint, Finset.sum_le_sum fun k _ => hpoint k⟩

/-! ## Proposition 2: the activation band -/

theorem activationBandIndicator
    (delegationThreshold soloThreshold opportunity : ℝ)
    (hthreshold : delegationThreshold < soloThreshold) :
    (if delegationThreshold ≤ opportunity then (1 : ℕ) else 0) -
        (if soloThreshold ≤ opportunity then (1 : ℕ) else 0) =
      if delegationThreshold ≤ opportunity ∧ opportunity < soloThreshold
        then 1 else 0 := by
  by_cases hdelegation : delegationThreshold ≤ opportunity
  · by_cases hsolo : soloThreshold ≤ opportunity
    · have hnotBand : ¬ opportunity < soloThreshold := not_lt_of_ge hsolo
      simp [hdelegation, hsolo, hnotBand]
    · have hband : opportunity < soloThreshold := lt_of_not_ge hsolo
      simp [hdelegation, hsolo, hband]
  · have hsolo : ¬ soloThreshold ≤ opportunity := by
      intro hs
      exact hdelegation ((le_of_lt hthreshold).trans hs)
    simp [hdelegation, hsolo]

theorem activationBandForUnfamiliarLanguagesProof
    {Language : Type} [Fintype Language]
    (delegationThreshold soloThreshold opportunity : Language → ℝ)
    (cdf : Language → ℝ → ℝ)
    (hthreshold : ∀ k, delegationThreshold k < soloThreshold k)
    (_hcontinuous : ∀ k, Continuous (cdf k))
    (hmonotone : ∀ k, Monotone (cdf k)) :
    (∀ k,
      (if delegationThreshold k ≤ opportunity k then (1 : ℕ) else 0) -
          (if soloThreshold k ≤ opportunity k then (1 : ℕ) else 0) =
        if delegationThreshold k ≤ opportunity k ∧ opportunity k < soloThreshold k
          then 1 else 0) ∧
      0 ≤ ∑ k, (cdf k (soloThreshold k) - cdf k (delegationThreshold k)) := by
  constructor
  · intro k
    exact activationBandIndicator _ _ _ (hthreshold k)
  · exact Finset.sum_nonneg fun k _ =>
      sub_nonneg.mpr (hmonotone k (le_of_lt (hthreshold k)))

/-! ## Proposition 3: cumulative effects and the boundary correction -/

theorem cumulativeLanguageEffectNonnegative
    {Language : Type} [Fintype Language]
    (p1 p2 : Language → ℝ) (horizon : ℕ)
    (hhazard : ∀ k, 0 ≤ p1 k ∧ p1 k ≤ p2 k ∧ p2 k ≤ 1) :
    0 ≤ ∑ k, ((1 - p1 k) ^ (horizon + 1) - (1 - p2 k) ^ (horizon + 1)) := by
  exact Finset.sum_nonneg fun k _ => by
    have hbaseNonnegative : 0 ≤ 1 - p2 k := sub_nonneg.mpr (hhazard k).2.2
    have hbaseOrder : 1 - p2 k ≤ 1 - p1 k :=
      sub_le_sub_left (hhazard k).2.1 1
    exact sub_nonneg.mpr (pow_le_pow_left₀ hbaseNonnegative hbaseOrder _)

theorem closedFrontierStrictDynamics
    (horizon : ℕ) (p : ℝ) (hpPositive : 0 < p) (hpBelowOne : p < 1) :
    let gap := fun h : ℕ => 1 - (1 - p) ^ (h + 1)
    gap horizon < gap (horizon + 1) ∧
      gap (horizon + 2) - gap (horizon + 1) <
        gap (horizon + 1) - gap horizon := by
  dsimp
  let q : ℝ := 1 - p
  have hqPositive : 0 < q := by
    dsimp [q]
    linarith
  have hqBelowOne : q < 1 := by
    dsimp [q]
    linarith
  have hpowPositive : 0 < q ^ (horizon + 1) := pow_pos hqPositive _
  have hpowDecrease : q ^ (horizon + 2) < q ^ (horizon + 1) := by
    rw [show horizon + 2 = (horizon + 1) + 1 by omega, pow_succ]
    exact mul_lt_of_lt_one_right hpowPositive hqBelowOne
  constructor
  · change 1 - q ^ (horizon + 1) < 1 - q ^ (horizon + 2)
    linarith
  · have hnextPositive : 0 < q ^ (horizon + 2) := pow_pos hqPositive _
    change
      (1 - q ^ (horizon + 3)) - (1 - q ^ (horizon + 2)) <
        (1 - q ^ (horizon + 2)) - (1 - q ^ (horizon + 1))
    have hleft :
        (1 - q ^ (horizon + 3)) - (1 - q ^ (horizon + 2)) =
          p * q ^ (horizon + 2) := by
      rw [show q ^ (horizon + 3) = q ^ (horizon + 2) * q by
        rw [show horizon + 3 = (horizon + 2) + 1 by omega, pow_succ]]
      dsimp [q]
      ring
    have hright :
        (1 - q ^ (horizon + 2)) - (1 - q ^ (horizon + 1)) =
          p * q ^ (horizon + 1) := by
      rw [show q ^ (horizon + 2) = q ^ (horizon + 1) * q by
        rw [show horizon + 2 = (horizon + 1) + 1 by omega, pow_succ]]
      dsimp [q]
      ring
    rw [hleft, hright]
    exact mul_lt_mul_of_pos_left hpowDecrease hpPositive

/-- At the source paper's allowed boundary `p = 1`, the cumulative gap is flat
after impact, so the printed strict-growth clause cannot hold. -/
theorem closedFrontierHazardOneNotStrict (horizon : ℕ) :
    ¬ (1 - (1 - (1 : ℝ)) ^ (horizon + 1) <
      1 - (1 - (1 : ℝ)) ^ (horizon + 2)) := by
  norm_num

theorem dynamicCumulativeLanguageEffectCorrectedProof
    {Language : Type} [Fintype Language]
    (p1 p2 : Language → ℝ) (horizon : ℕ)
    (hhazard : ∀ k, 0 ≤ p1 k ∧ p1 k ≤ p2 k ∧ p2 k ≤ 1) :
    0 ≤ ∑ k, ((1 - p1 k) ^ (horizon + 1) - (1 - p2 k) ^ (horizon + 1)) ∧
    (∀ p : ℝ, 0 < p → p < 1 →
      let gap := fun h : ℕ => 1 - (1 - p) ^ (h + 1)
      gap horizon < gap (horizon + 1) ∧
        gap (horizon + 2) - gap (horizon + 1) <
          gap (horizon + 1) - gap horizon) := by
  refine ⟨cumulativeLanguageEffectNonnegative p1 p2 horizon hhazard, ?_⟩
  intro p hpPositive hpBelowOne
  exact closedFrontierStrictDynamics horizon p hpPositive hpBelowOne

/-! ## Proposition 4: common increments and heterogeneity -/

theorem specialistAndAbilityHeterogeneityProof
    {Candidate : Type} [Fintype Candidate]
    (activationIncrement : ℝ → ℝ)
    (ability : ℝ) (candidateCount1 candidateCount2 : ℕ) (ability2 : ℝ) :
    (∑ _ : Candidate, activationIncrement ability) =
        (Fintype.card Candidate : ℝ) * activationIncrement ability ∧
    (0 ≤ activationIncrement ability →
      Monotone activationIncrement →
      candidateCount1 ≤ candidateCount2 → ability ≤ ability2 →
      (candidateCount1 : ℝ) * activationIncrement ability ≤
        (candidateCount2 : ℝ) * activationIncrement ability2) := by
  constructor
  · simp
  · intro hnonnegative hmonotone hcount hability
    have hcountReal : (candidateCount1 : ℝ) ≤ candidateCount2 := by
      exact_mod_cast hcount
    exact mul_le_mul hcountReal (hmonotone hability)
      hnonnegative (Nat.cast_nonneg candidateCount2)

/-! ## Proposition 5: repository expansion -/

theorem repositoryExpansionProof
    {Repository : Type} [Fintype Repository]
    (opportunity oldCost newCost : Repository → ℝ)
    (hcost : ∀ r, newCost r ≤ oldCost r) :
    let oldActive := fun r => if oldCost r ≤ opportunity r then (1 : ℕ) else 0
    let newActive := fun r => if newCost r ≤ opportunity r then (1 : ℕ) else 0
    (∑ r, oldActive r) ≤ ∑ r, newActive r ∧
      ((∃ r, newCost r ≤ opportunity r ∧ opportunity r < oldCost r) →
        (∑ r, oldActive r) < ∑ r, newActive r) := by
  dsimp
  have hpoint : ∀ r,
      (if oldCost r ≤ opportunity r then (1 : ℕ) else 0) ≤
        if newCost r ≤ opportunity r then (1 : ℕ) else 0 := by
    intro r
    by_cases hold : oldCost r ≤ opportunity r
    · have hnew : newCost r ≤ opportunity r := (hcost r).trans hold
      simp [hold, hnew]
    · simp [hold]
  constructor
  · exact Finset.sum_le_sum fun r _ => hpoint r
  · rintro ⟨r, hnew, holdStrict⟩
    have hold : ¬ oldCost r ≤ opportunity r := not_le_of_gt holdStrict
    apply Finset.sum_lt_sum (fun i _ => hpoint i)
    exact ⟨r, Finset.mem_univ r, by simp [hnew, hold]⟩

end QX26AgenticDelegation
