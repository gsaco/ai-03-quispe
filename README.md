<p align="center">
  <img src="assets/header.svg" alt="Agentic Delegation and the Language Frontier of Software Developers: A Model and Evidence from Claude Code on GitHub" width="100%">
</p>

<p align="center">
  <a href="https://arxiv.org/abs/2605.25438v2"><img alt="arXiv paper version 2" src="https://img.shields.io/badge/Paper-arXiv%3A2605.25438v2-0C2852?style=for-the-badge"></a>
  <a href="presentation.pdf"><img alt="Twenty-minute deck" src="https://img.shields.io/badge/20--Minute%20Deck-30%20Slides-982A34?style=for-the-badge&logo=adobeacrobatreader&logoColor=white"></a>
  <a href="extra/presentation-long.pdf"><img alt="Lean-focused companion deck" src="https://img.shields.io/badge/Lean%20Deck-15%20Slides-0C2852?style=for-the-badge&logo=adobeacrobatreader&logoColor=white"></a>
  <a href="lean/README.md"><img alt="Lean formalization" src="https://img.shields.io/badge/Lean-Partially%20Formalized-3B5526?style=for-the-badge"></a>
</p>

<p align="center">
  <a href="prompts.md"><img alt="Prompt record" src="https://img.shields.io/badge/Prompts-Raw-6B4FBB?style=flat-square"></a>
  <img alt="LaTeX" src="https://img.shields.io/badge/LaTeX-008080?style=flat-square&logo=latex&logoColor=white">
  <img alt="Lean 4" src="https://img.shields.io/badge/Lean%204-4B7F52?style=flat-square">
  <img alt="Python" src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white">
</p>

This repository studies Quispe and Xu's 2026 paper, *Agentic Delegation and the
Language Frontier of Software Developers: A Model and Evidence from Claude Code
on GitHub*.

## What question does the paper answer?

**Does agentic coding AI expand the set of programming languages in which a
developer can ship code?** The distinction between production and learning is
essential. Producing Rust with an agent expands a developer's production
frontier; it does not show that the developer has learned to write Rust alone.

The paper's proposed mechanism is delegation. Conversational AI offers advice
that is most useful when the developer already has a foothold in the language.
An agent adds a different production mode: the developer specifies and checks
the work while the tool executes it.

## The developer's problem

For every developer, language, and month, the developer compares the expected
surplus from the available production modes. Before adopting an agent, the menu
contains solo work and conversational assistance. After adoption, it also
contains delegation. A language becomes active only when the best available
mode covers the opportunity's execution, interaction, verification, computing,
and residual-error costs.

General programming ability matters under delegation because the developer
must describe the task, break it into pieces, inspect the output, and decide
whether the result is safe to ship. Language-specific skill matters most for
solo work and for making conversational suggestions useful.

## Main result, with all its conditions

For an unfamiliar language, the paper assumes that conversational assistance
cannot by itself make production worthwhile without a language-specific skill
foothold. Delegation expands the frontier only if it reduces the minimum-value
opportunity worth undertaking after accounting for verification, computing,
and residual-risk costs. Opportunities that were too marginal for solo work
but valuable enough under delegation then become newly feasible.

That conclusion needs all of the following conditions:

- conversational assistance does not overcome the unfamiliar-language entry barrier;
- delegated execution saves more than it costs to specify, verify, compute, and bear residual risk;
- relevant opportunities exist between the old and new entry thresholds;
- the developer has enough general ability to specify and verify the task;
- comparisons across specialists and generalists hold the pool of candidate unfamiliar languages fixed;
- the empirical comparison would have followed parallel trends without adoption;
- no contemporaneous project shock jointly triggers Claude adoption and language diversification.

The empirical application uses a public-GitHub panel of 5,346 sustained
adopters and later adopters. In the adoption month, Claude Code use is
associated with 2.53 additional active languages, 1.19 newly used languages,
and a 0.38 increase in language entropy. The strongest effects occur in the
adoption month and then shrink. “New” means unseen in the observed history
since January 2024, and adoption means the first public commit carrying
Claude's coauthor trailer.

These are event-time associations for public production. They are not direct
measures of learning, private work, code quality, or a settled causal effect.

## What does not hold up?

### The threshold mechanism is not uniquely agentic

The activation-band argument is a general threshold result. Any intervention
that lowers the entry threshold by the same amount can activate the same set of
marginal opportunities. Better libraries, a collaborator, a new job, or a
large ordinary productivity improvement could therefore produce the same
comparative static. The paper's distinctive agent mechanism comes from the
assumed differences among solo work, conversation, and delegation; it does not
follow from the threshold logic alone.

### The empirical design cannot separate expansion from selection

An unfamiliar-language project can both motivate a developer to adopt Claude
and directly increase the number of languages used. In that case, the adoption
month contains the true Claude effect plus the effect of selecting into
adoption when a new project arrives. A visible event-time jump can occur even
when Claude has no causal effect.

Flat earlier trends do not rule this out because the project can arrive in the
adoption month. Removing Claude-authored commits and deleting the first-Claude
language clean the measured outcome, but neither makes adoption timing
exogenous. The paper is appropriately cautious about this limitation. The
defensible verdict is therefore narrower: language-portfolio expansion
coincides with Claude Code adoption and is consistent with delegation, but the
design does not identify delegation as the cause.

The reproducible [`sim.py`](sim.py) simulation creates an estimated 1.83
adoption-month jump while setting Claude's true effect to zero.

## Relationship to the deskilling result

Aouad, Lykouris, and Zhong's *Human-AI Productivity Paradoxes: Modeling the
Interplay of Skill, Effort, and AI Assistance* also treats AI as a substitute
for human execution, but it allows lower human effort today to reduce future
skill. Quispe and Xu instead hold language skill fixed over the production
choice and ask whether delegation expands the feasible menu.

That single modeling choice explains the apparently opposite conclusions. A
fixed skill stock permits production-frontier expansion without learning;
effort-dependent skill creates a feedback from substitution to deskilling. The
comparison is developed on slide 4 of the presentation.

## Lean formalization

The complete generated EconCSLib paper folder is preserved in
[`lean/`](lean/README.md). It was produced as `QX26AgenticDelegation` from the
pinned arXiv version 2 source, not copied from the worked example. The folder
contains the source-facing specifications, exact-type proof endpoints, proof
implementations, audit records, dependency graph, status metadata, and final
validation report. Generated ignore rules keep the paper PDF, extracted source
text, build products, and private review traces out of Git.

### Result at a glance

| Item | Result |
|---|---|
| Paper version | arXiv version 2, dated July 7, 2026 |
| Source fingerprint | `cddc048711c43022d5fd01b995bfb1114c728c8c879b809b5fdc354a391d3c35` |
| Numbered assumptions inventoried | 3 of 3 |
| Numbered propositions represented | 5 of 5 |
| Lean proof endpoints completed | 5 of 5 |
| Proof holes or local axioms | None |
| Full build | Passed |
| Required paper-scoped fast check | Passed |
| Overall status | **Partially formalized** |

The last two rows are deliberately different. Lean accepts every proof endpoint
in the declared formal scope, but proof completion alone does not establish
that every formal statement is identical to the paper's prose, nor does it
validate the paper's empirical interpretation.

### What each Lean result establishes

| Paper result | Lean endpoint | Machine-checked content | Qualification |
|---|---|---|---|
| Proposition 1: frontier expansion | [`frontierExpansion`](lean/ProofInterface.lean#L20-L24) | Adding delegation to the available menu cannot remove an already feasible language and cannot reduce the finite language count. | A static menu result; it does not prove adoption or use of delegation. |
| Proposition 2: activation band | [`activationBandForUnfamiliarLanguages`](lean/ProofInterface.lean#L33-L37) | A lower delegation threshold activates precisely the opportunities between the new and old thresholds; an ordered cumulative distribution gives nonnegative total band mass. | The cumulative distribution is represented abstractly, without constructing a full conditional probability model. |
| Proposition 3: cumulative language effect | [`dynamicCumulativeLanguageEffectCorrected`](lean/ProofInterface.lean#L46-L50) | Higher first-use hazards weakly raise cumulative language exposure; strict growth and diminishing increments hold away from the upper endpoint. | The source domain needs a substantive correction, described below. |
| Proposition 4: specialist and ability heterogeneity | [`specialistAndAbilityHeterogeneity`](lean/ProofInterface.lean#L59-L63) | A common per-language gain aggregates with the number of candidate languages and rises under the stated monotonicity conditions. | The paper's verbal “largest gains” ranking is not modeled as a separate population theorem. |
| Proposition 5: repository expansion | [`repositoryExpansion`](lean/ProofInterface.lean#L72-L76) | Weakly lower entry costs cannot reduce the finite repository count, and a strict activation witness adds at least one repository. | The proof is pointwise; no explicit probability space for expectations is constructed. |

### The finding that changed the paper statement

The most informative result is not merely that Lean accepted a proof. Lean
exposed a boundary error in Proposition 3. The paper allows the post-agent
first-use hazard to reach one while claiming continued strict growth and strict
concavity. At that endpoint, every remaining language is activated immediately;
the cumulative gap then becomes flat, so the strict claim cannot continue to
hold.

The formalization records this rather than silently weakening the paper:

1. [`closedFrontierStrictDynamics`](lean/MainTheorems.lean#L96-L136) proves the strict
   result when the first-use hazard is positive and strictly below one.
2. [`closedFrontierHazardOneNotStrict`](lean/MainTheorems.lean#L140-L143) proves that
   strict growth fails at the upper endpoint.
3. The corrected source-facing target is explicitly named
   [`dynamicCumulativeLanguageEffectCorrectedSpec`](lean/PaperInterface.lean#L144-L152).

This is why the honest status remains **partially formalized** even though all
five proof endpoints compile.

### How the formalization is organized

| File or folder | Role |
|---|---|
| [`lean/PaperInterface.lean`](lean/PaperInterface.lean) | The compact human-review surface: five transparent specifications written for comparison with the source paper. |
| [`lean/ProofInterface.lean`](lean/ProofInterface.lean) | Exact-type endpoints showing that each paper-facing specification has a Lean proof. |
| [`lean/MainTheorems.lean`](lean/MainTheorems.lean) | The reusable lemmas, case splits, finite-sum arguments, monotonicity proofs, and Proposition 3 counterexample. |
| [`lean/Assumptions.lean`](lean/Assumptions.lean) | The only permitted location for paper-local postulates. It is empty: assumptions appear visibly as theorem premises rather than hidden axioms. |
| [`lean/audit/`](lean/audit/) | Source inventory, statement matching, proof-fidelity records, and the documented defect ledger. |
| [`lean/docs/DependencyDAG.pdf`](lean/docs/DependencyDAG.pdf) | Visual map from the paper's assumptions to the five propositions and their formal status. |
| [`lean/FINAL_VALIDATION_REPORT.md`](lean/FINAL_VALIDATION_REPORT.md) | The full verdict, representation choices, exclusions, build evidence, and remaining audit boundary. |

### How to interpret “verified”

- Lean verifies that each conclusion follows from the premises encoded in its
  theorem statement. It does not establish that those premises are true in the
  GitHub data.
- The menu, threshold, finite-count, and hazard arguments are machine checked.
  The event-study estimator, standard errors, treatment detection, and causal
  identification are not.
- Proposition 2 checks the order-theoretic cumulative-distribution argument,
  but it does not build the paper's conditional probability space from first
  principles.
- Proposition 3 is verified only on the corrected interior domain. The separate
  endpoint theorem demonstrates why this extra restriction is necessary.
- The semantic audit remains fail-closed pending full source-facing human
  sign-off. “Partially formalized” therefore reflects translation and scope
  boundaries, not unfinished Lean proof bodies.

### Validation and recommended reading order

The complete Lean target and the required paper-scoped check both passed. The
exact commands and outputs are recorded in
[`formalization-check.md`](formalization-check.md). For a quick but rigorous
review, read the artifacts in this order:

| Validation step | Recorded outcome |
|---|---|
| Full paper target | Build completed successfully with all five endpoints |
| Paper-facing interface target | Build completed successfully |
| Paper-scoped whitespace and structure check | Passed |
| Ignored source bytes and build caches in the Git index | None; generated ignore rules were respected |

1. [`lean/FINAL_VALIDATION_REPORT.md`](lean/FINAL_VALIDATION_REPORT.md) for the
   verdict and scope boundaries;
2. [`lean/PaperInterface.lean`](lean/PaperInterface.lean) for the five translated
   propositions;
3. [`lean/docs/DependencyDAG.pdf`](lean/docs/DependencyDAG.pdf) for the logical
   architecture;
4. [`lean/ProofInterface.lean`](lean/ProofInterface.lean) for the exact proof
   endpoints; and
5. [`lean/audit/source_proof_fidelity.json`](lean/audit/source_proof_fidelity.json)
   for the source-to-proof ledger and Proposition 3 defect record.

## Presentations

| File | Purpose |
|---|---|
| [`presentation.pdf`](presentation.pdf) | Required 20-minute, 30-slide presentation, including the paper, empirical audit, hand derivation, and three formalization slides |
| [`presentation.tex`](presentation.tex) | Main Beamer source |
| [`extra/presentation-long.pdf`](extra/presentation-long.pdf) | Fifteen-slide companion focused entirely on how Lean was used for this paper |
| [`extra/presentation-long.tex`](extra/presentation-long.tex) | Lean-focused companion source |

The companion deck is not a duplicate of the main presentation. It follows the
formalization from source pinning and theorem inventory through paper-facing
specifications, proof fragments, the Proposition 3 endpoint correction, build
evidence, and the limits of what the machine-checked result establishes.

## Handwritten check

The original photograph is stored in `hand/selection-derivation.png` and appears
on the final slide of the 20-minute deck. The repository preserves the
uncropped file; the Beamer source rotates it only for upright display.

## Repository structure

```text
.
├── README.md                         # Question, conditions, evidence, verdict
├── prompts.md                        # Raw relevant prompt-answer record
├── presentation.tex / .pdf          # Required 20-minute deck
├── extra/presentation-long.tex / .pdf # Lean-focused companion deck
├── lean/                             # Exact generated EconCSLib paper folder
├── formalization-check.md            # Required paper-scoped check result
├── assets/                           # Banner and shared Beamer style
├── hand/                             # Original derivation photo goes here
├── figures/selection-counterexample.pdf
├── sim.py                            # Zero-effect selection counterexample
└── requirements.txt
```

## Reproduce

```bash
python3 -m pip install -r requirements.txt
python3 sim.py
lualatex presentation.tex
cd extra && lualatex presentation-long.tex
```

To reproduce the Lean result, use an EconCSLib checkout, place this repository's
`lean/` folder at `papers/QX26AgenticDelegation/`, and run the paper build and
paper-scoped check documented in [`formalization-check.md`](formalization-check.md).

## Citation

> Quispe, A., and Xu, K. 2026. *Agentic Delegation and the Language Frontier
> of Software Developers: A Model and Evidence from Claude Code on GitHub*.
> arXiv:2605.25438.
