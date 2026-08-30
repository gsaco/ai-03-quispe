<p align="center">
  <img src="assets/header.svg" alt="Agentic Delegation and the Language Frontier" width="100%">
</p>

<p align="center">
  <a href="https://arxiv.org/abs/2605.25438"><img alt="arXiv paper" src="https://img.shields.io/badge/Paper-arXiv%3A2605.25438-0C2852?style=for-the-badge"></a>
  <a href="presentation.pdf"><img alt="Five-minute deck" src="https://img.shields.io/badge/5--Minute%20Deck-PDF-982A34?style=for-the-badge&logo=adobeacrobatreader&logoColor=white"></a>
  <a href="extra/presentation-long.pdf"><img alt="Extended deck" src="https://img.shields.io/badge/Extended%20Deck-26%20Slides-0C2852?style=for-the-badge&logo=adobeacrobatreader&logoColor=white"></a>
  <a href="lean/README.md"><img alt="Lean verification" src="https://img.shields.io/badge/Lean-Machine%20Checked-3B5526?style=for-the-badge"></a>
</p>

<p align="center">
  <a href="audit/identification-audit.md"><img alt="Identification audit" src="https://img.shields.io/badge/Identification-Audit-3B5526?style=flat-square"></a>
  <a href="prompts.md"><img alt="Prompt record" src="https://img.shields.io/badge/Prompts-Raw-6B4FBB?style=flat-square"></a>
  <img alt="LaTeX" src="https://img.shields.io/badge/LaTeX-008080?style=flat-square&logo=latex&logoColor=white">
  <img alt="Lean 4" src="https://img.shields.io/badge/Lean%204-4B7F52?style=flat-square">
  <img alt="Python" src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white">
</p>

This repository studies Quispe and Xu's 2026 paper, *Agentic Delegation and
the Language Frontier of Software Developers*. An earlier draft circulated as
*Coding Beyond Your Training*.

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

The [identification audit](audit/identification-audit.md) develops the
counterexample and proposes stronger designs. The reproducible
[`sim.py`](sim.py) simulation creates a positive adoption-time jump while
setting Claude's true effect to zero. The [Lean appendix](lean/README.md)
machine-checks the threshold results and the selection decomposition.

## Presentations

| File | Purpose |
|---|---|
| [`presentation.pdf`](presentation.pdf) | Required five-minute, five-slide presentation |
| [`extra/presentation-long.pdf`](extra/presentation-long.pdf) | Extended 26-slide technical presentation |
| [`presentation.tex`](presentation.tex) | Short-deck Beamer source |
| [`extra/presentation-long.tex`](extra/presentation-long.tex) | Extended-deck Beamer source |

## Handwritten check

The required photograph belongs in `hand/selection-derivation.jpg`. The exact
four-line derivation to reproduce is in [`hand/README.md`](hand/README.md).
Until that original photograph is added, the short deck displays an explicit
placeholder rather than presenting a generated image as handwritten work.

## Repository structure

```text
.
├── README.md                         # Question, conditions, evidence, verdict
├── prompts.md                        # Raw relevant prompt-answer record
├── presentation.tex / .pdf          # Required five-slide deck
├── extra/presentation-long.tex / .pdf
├── lean/                             # Lean 4 machine-checked audit
├── assets/                           # Banner and shared Beamer style
├── hand/                             # Original derivation photo goes here
├── audit/identification-audit.md
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
cd ../lean && lake build --wfail
```

## Citation

> Quispe, A., and Xu, K. 2026. *Agentic Delegation and the Language Frontier
> of Software Developers: A Model and Evidence from Claude Code on GitHub*.
> arXiv:2605.25438.
