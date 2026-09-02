import QX26AgenticDelegation.PaperInterface

/-!
# Proof Interface: Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub

This file contains exact-type proof endpoints for the transparent propositions
in `PaperInterface.lean`. It is not a human semantic-review surface: one source
claim is reviewed once, against its expanded `...Spec : Prop` declaration.
-/

namespace QX26AgenticDelegation

/--
Lean proof endpoint for `frontierExpansionSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem frontierExpansion :
  frontierExpansionSpec := by
  simpa only [frontierExpansionSpec] using
    (fun {Language : Type} [Fintype Language] =>
      frontierExpansionProof (Language := Language))

/--
Lean proof endpoint for `activationBandForUnfamiliarLanguagesSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem activationBandForUnfamiliarLanguages :
  activationBandForUnfamiliarLanguagesSpec := by
  simpa only [activationBandForUnfamiliarLanguagesSpec] using
    (fun {Language : Type} [Fintype Language] =>
      activationBandForUnfamiliarLanguagesProof (Language := Language))

/--
Lean proof endpoint for `dynamicCumulativeLanguageEffectCorrectedSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem dynamicCumulativeLanguageEffectCorrected :
  dynamicCumulativeLanguageEffectCorrectedSpec := by
  simpa only [dynamicCumulativeLanguageEffectCorrectedSpec] using
    (fun {Language : Type} [Fintype Language] =>
      dynamicCumulativeLanguageEffectCorrectedProof (Language := Language))

/--
Lean proof endpoint for `specialistAndAbilityHeterogeneitySpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem specialistAndAbilityHeterogeneity :
  specialistAndAbilityHeterogeneitySpec := by
  simpa only [specialistAndAbilityHeterogeneitySpec] using
    (fun {Candidate : Type} [Fintype Candidate] =>
      specialistAndAbilityHeterogeneityProof (Candidate := Candidate))

/--
Lean proof endpoint for `repositoryExpansionSpec`.

This theorem is intentionally outside `PaperInterface.lean`: Lean Meta checks
that it has exactly the transparent Spec type, while source-to-Lean semantic
review compares the raw source bundle only to that Spec.
-/
theorem repositoryExpansion :
  repositoryExpansionSpec := by
  simpa only [repositoryExpansionSpec] using
    (fun {Repository : Type} [Fintype Repository] =>
      repositoryExpansionProof (Repository := Repository))

end QX26AgenticDelegation
