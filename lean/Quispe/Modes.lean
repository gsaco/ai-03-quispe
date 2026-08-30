import Mathlib

/-!
# Production-mode menu expansion

The paper's first static implication is a set-inclusion result: adding delegated
production to the solo/conversation menu cannot lower the best available
surplus.  These results verify that implication and isolate the condition for a
strictly new feasible opportunity.
-/

namespace Quispe.Modes

/-- Best certainty-equivalent surplus before delegated production is available. -/
def preAgentValue (solo conversation : ℝ) : ℝ := max solo conversation

/-- Best surplus after delegated production is added to the menu. -/
def postAgentValue (solo conversation delegation : ℝ) : ℝ :=
  max (preAgentValue solo conversation) delegation

/-- Adding delegation weakly raises the value of the best available mode. -/
theorem menu_expansion (solo conversation delegation : ℝ) :
    preAgentValue solo conversation ≤
      postAgentValue solo conversation delegation := by
  unfold postAgentValue
  exact le_max_left _ _

/-- Anything feasible under the old menu remains feasible under the new menu. -/
theorem old_feasible_remains_feasible
    {solo conversation delegation : ℝ}
    (hOld : 0 ≤ preAgentValue solo conversation) :
    0 ≤ postAgentValue solo conversation delegation := by
  exact le_trans hOld (menu_expansion solo conversation delegation)

/-- Delegation strictly expands feasibility when both old modes lose but the
delegated mode has nonnegative surplus. -/
theorem delegation_creates_new_feasible_opportunity
    {solo conversation delegation : ℝ}
    (hOld : preAgentValue solo conversation < 0)
    (hDelegation : 0 ≤ delegation) :
    (0 ≤ postAgentValue solo conversation delegation) ∧
      ¬ (0 ≤ preAgentValue solo conversation) := by
  constructor
  · unfold postAgentValue
    exact le_trans hDelegation (le_max_right _ _)
  · exact not_le.mpr hOld

/-- Without an opportunity on which delegation beats an infeasible old menu,
menu expansion need not be strict. -/
theorem delegation_below_old_best_changes_nothing
    {solo conversation delegation : ℝ}
    (hDelegation : delegation ≤ preAgentValue solo conversation) :
    postAgentValue solo conversation delegation =
      preAgentValue solo conversation := by
  unfold postAgentValue
  exact max_eq_left hDelegation

end Quispe.Modes
