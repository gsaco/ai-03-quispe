import Mathlib

/-!
# Threshold activation and the non-uniqueness audit

This module verifies the paper's activation-band algebra over the real numbers.
It also proves the central objection: every lower threshold can be represented
as an ordinary positive threshold reduction, so the band alone is not unique to
agentic delegation.
-/

namespace Quispe.Threshold

/-- An opportunity is active when its value reaches the relevant threshold. -/
def Active (threshold opportunity : ℝ) : Prop := threshold ≤ opportunity

/-- Lowering an entry threshold preserves every previously active opportunity. -/
theorem lower_threshold_preserves_activation
    {newThreshold oldThreshold opportunity : ℝ}
    (hLower : newThreshold ≤ oldThreshold)
    (hOld : Active oldThreshold opportunity) :
    Active newThreshold opportunity := by
  exact le_trans hLower hOld

/-- The exact activation-band equivalence used in Proposition 2. -/
theorem activation_band_iff
    {newThreshold oldThreshold opportunity : ℝ} :
    Active newThreshold opportunity ∧ ¬ Active oldThreshold opportunity ↔
      newThreshold ≤ opportunity ∧ opportunity < oldThreshold := by
  simp only [Active, not_le]

/-- A threshold band contains an opportunity exactly when the new threshold is
strictly below the old one. -/
theorem activation_band_nonempty_iff
    {newThreshold oldThreshold : ℝ} :
    (∃ opportunity,
      Active newThreshold opportunity ∧ ¬ Active oldThreshold opportunity) ↔
      newThreshold < oldThreshold := by
  constructor
  · rintro ⟨opportunity, hNew, hOld⟩
    exact lt_of_le_of_lt hNew (lt_of_not_ge hOld)
  · intro hLower
    exact ⟨newThreshold, le_rfl, not_le.mpr hLower⟩

/-- The threshold reduction called `B` in the paper. -/
def reduction (oldThreshold newThreshold : ℝ) : ℝ :=
  oldThreshold - newThreshold

/-- A positive reduction is exactly a strict lowering of the threshold. -/
theorem positive_reduction_iff
    {oldThreshold newThreshold : ℝ} :
    0 < reduction oldThreshold newThreshold ↔
      newThreshold < oldThreshold := by
  unfold reduction
  constructor <;> intro h <;> linarith

/-- A generic productivity improvement represented as a threshold reduction. -/
def genericThreshold (oldThreshold gain : ℝ) : ℝ := oldThreshold - gain

/-- A positive generic improvement strictly lowers the threshold. -/
theorem generic_improvement_lowers_threshold
    {oldThreshold gain : ℝ} (hGain : 0 < gain) :
    genericThreshold oldThreshold gain < oldThreshold := by
  unfold genericThreshold
  linarith

/-- A generic threshold improvement generates the same activation-band form. -/
theorem generic_improvement_activation_band
    {oldThreshold gain opportunity : ℝ} :
    Active (genericThreshold oldThreshold gain) opportunity ∧
        ¬ Active oldThreshold opportunity ↔
      oldThreshold - gain ≤ opportunity ∧ opportunity < oldThreshold := by
  exact activation_band_iff

/-- Every agent threshold below the old threshold is exactly reproducible by a
positive generic threshold reduction.  This formalizes the non-uniqueness
objection to interpreting the activation band itself as agent-specific. -/
theorem agent_threshold_representable_as_generic
    {agentThreshold oldThreshold : ℝ}
    (hAgent : agentThreshold < oldThreshold) :
    ∃ gain : ℝ,
      0 < gain ∧ genericThreshold oldThreshold gain = agentThreshold := by
  refine ⟨oldThreshold - agentThreshold, ?_, ?_⟩
  · linarith
  · unfold genericThreshold
    ring

end Quispe.Threshold
