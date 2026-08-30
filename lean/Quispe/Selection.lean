import Mathlib

/-!
# Adoption timing and selection

The event-time contrast is represented as a causal treatment effect plus the
effect of a project shock that differs between adopters and not-yet adopters.
The theorems verify that a strictly positive contrast can arise when the true
treatment effect is exactly zero.
-/

namespace Quispe.Selection

/-- Algebraic event-time contrast: causal effect plus selected project shock. -/
def eventContrast
    (causalEffect projectLoading adopterShock controlShock : ℝ) : ℝ :=
  causalEffect + projectLoading * (adopterShock - controlShock)

/-- The contrast decomposes exactly into the causal and selection components. -/
theorem contrast_decomposition
    (causalEffect projectLoading adopterShock controlShock : ℝ) :
    eventContrast causalEffect projectLoading adopterShock controlShock =
      causalEffect + projectLoading * (adopterShock - controlShock) := by
  rfl

/-- With a positive outcome loading and positively selected adopters, the
event-time contrast is positive even when the causal effect is zero. -/
theorem zero_effect_false_positive
    {projectLoading adopterShock controlShock : ℝ}
    (hLoading : 0 < projectLoading)
    (hSelection : controlShock < adopterShock) :
    0 < eventContrast 0 projectLoading adopterShock controlShock := by
  unfold eventContrast
  simpa only [zero_add] using mul_pos hLoading (sub_pos.mpr hSelection)

/-- When project shocks are balanced, the contrast recovers the causal effect. -/
theorem balanced_shocks_identify_effect
    (causalEffect projectLoading commonShock : ℝ) :
    eventContrast causalEffect projectLoading commonShock commonShock =
      causalEffect := by
  unfold eventContrast
  ring

/-- When the project shock does not affect the outcome, selection on that shock
cannot contaminate the contrast. -/
theorem zero_project_loading_identifies_effect
    (causalEffect adopterShock controlShock : ℝ) :
    eventContrast causalEffect 0 adopterShock controlShock = causalEffect := by
  unfold eventContrast
  ring

/-- Exact witness: flat pre-event difference and a positive adoption-month
contrast coexist under a zero causal effect. -/
theorem flat_pretrend_does_not_rule_out_selection :
    let preEventDifference : ℝ := 0
    let adoptionDifference : ℝ := eventContrast 0 1 2 0
    preEventDifference = 0 ∧ 0 < adoptionDifference := by
  norm_num [eventContrast]

/-- Exact witness matching the sign logic of the repository simulation. -/
example : eventContrast 0 0.75 3 1 = 1.5 := by
  norm_num [eventContrast]

end Quispe.Selection
