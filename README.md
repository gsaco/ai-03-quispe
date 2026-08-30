<p align="center">
  <img src="assets/header.svg" alt="Agentic Delegation and the Language Frontier" width="100%">
</p>

<p align="center">
  <a href="https://arxiv.org/abs/2605.25438"><img alt="arXiv paper" src="https://img.shields.io/badge/Paper-arXiv%3A2605.25438-0C2852?style=for-the-badge"></a>
  <a href="presentation.pdf"><img alt="Five-minute deck" src="https://img.shields.io/badge/5--Minute%20Deck-PDF-982A34?style=for-the-badge&logo=adobeacrobatreader&logoColor=white"></a>
  <a href="audit/identification-audit.md"><img alt="Identification audit" src="https://img.shields.io/badge/Identification-Audit-3B5526?style=for-the-badge"></a>
  <a href="prompts.md"><img alt="Prompt record" src="https://img.shields.io/badge/Prompts-Raw-6B4FBB?style=for-the-badge"></a>
</p>

<p align="center">
  <img alt="LaTeX" src="https://img.shields.io/badge/LaTeX-008080?style=flat-square&logo=latex&logoColor=white">
  <img alt="Beamer" src="https://img.shields.io/badge/Beamer-0C2852?style=flat-square">
  <img alt="Python" src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white">
  <img alt="GitHub" src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white">
</p>

This repository studies Quispe and Xu's (2026) *Agentic Delegation and the
Language Frontier of Software Developers*. An earlier draft circulated as
*Coding Beyond Your Training*.

## What question does the paper answer?

**Does agentic coding AI expand the set of programming languages in which a
developer can ship code?** The paper distinguishes a **production frontier**
from a skill frontier: producing Rust with an agent does not imply learning to
write Rust alone.

The proposed mechanism is delegation. Conversational AI augments a developer
where language-specific skill already makes suggestions useful. An agent adds
a new mode: the developer specifies and verifies while the tool executes.

## The agent's problem

For developer-language opportunity $(i,k,t)$, the developer chooses the best
available production mode $m$ and activates the language only if its
certainty-equivalent surplus is non-negative:

$$
m^*_{ikt}\in\arg\max_{m\in\{S,C,D\}}V^m_{ikt},
\qquad
Z_{ikt}=\mathbf 1\!\left\{\max_m V^m_{ikt}\ge 0\right\}.
$$

Before agentic adoption the menu is solo work $S$ plus conversational
augmentation $C$; afterward it also includes delegation $D$. Delegation trades
agent execution against compute cost, verification cost, and residual error
risk. General ability matters because the developer must specify, decompose,
and verify the delegated work.

## Main result—with its conditions

For an **unfamiliar** language, the paper assumes conversational help does not
pay without a skill foothold, so its effective pre-agent threshold remains
$T^S$. Delegation expands the frontier only when its threshold is lower,
$T^D<T^S$. Conditional on an opportunity value $\omega$, the language is then
activated by the agent exactly when

$$
T^D\le \omega<T^S.
$$

This activation-band prediction requires: the no-foothold assumption for
conversational AI; positive threshold reduction after verification, compute,
and residual-risk costs; opportunity mass inside the band; and a developer who
can specify and verify. The specialist result additionally assumes comparable
unfamiliar-language candidates. Empirically, its interpretation also requires
that, absent adoption, early and not-yet adopters would have followed parallel
trends.

In a 28-month public-GitHub panel of 5,346 sustained adopters, the adoption
month is associated with **2.53 additional active languages**, **1.19 newly
used languages**, and a **0.38 increase in language entropy**. These are
event-time associations for public production, not estimates of learning or a
settled causal effect. “New” means unseen since January 2024, and adoption is
the first public commit carrying Claude's coauthor trailer.

## What does not hold up?

The activation band is **not agent-specific**. Any intervention that lowers an
entry threshold by the same amount—better libraries, a collaborator, a new
job, or a sufficiently large productivity shock—produces the identical band.
Calling the lower threshold $T^D$ does not establish that delegation caused it;
the distinctive role of the agent comes from assumptions placed on the three
production modes.

The empirical design has the corresponding identification problem. Let
$P_{it}$ be an unfamiliar-language project shock, let Claude adoption occur
when that shock crosses a threshold, and let language breadth respond directly
to the project:

$$
A_{it}=\mathbf 1\{P_{it}\ge c_i\},
\qquad
Y_{it}=\mu_i+\lambda_t+\beta P_{it}+\tau A_{it}+\varepsilon_{it}.
$$

At first adoption, the event-study coefficient combines the causal effect
$\tau$ with the selected project shock $\beta P_{it}$. It can therefore jump
even when **$\tau=0$**. Flat earlier pre-trends, deleting Claude-authored
commits, and removing the first-Claude language do not solve this: none removes
the time-varying project shock that determines adoption. The paper recognizes
this limitation, so the defensible verdict is narrower than its mechanism:
portfolio expansion coincides with Claude Code adoption and is consistent
with delegation, but the design cannot distinguish delegation from selection
into adoption.

The [identification audit](audit/identification-audit.md) gives the algebra,
a zero-effect counterexample, and designs that would separate the mechanisms.
The reproducible simulation in [`sim.py`](sim.py) generates the same
adoption-time jump with no causal Claude effect.

## Handwritten check

The required photograph belongs in `hand/selection-derivation.jpg`. The exact
four-line derivation to reproduce is in [`hand/README.md`](hand/README.md).
Until that original photograph is added, the final slide displays an explicit
placeholder rather than pretending a generated image was handwritten.

## Repository structure

```text
.
├── README.md                   # Question, problem, result, and verdict
├── prompts.md                  # Raw relevant prompt-answer record
├── presentation.tex            # Five-frame Beamer source
├── presentation.pdf            # Compiled five-minute deck
├── assets/                     # Banner and shared Beamer style
├── hand/                       # Original derivation photo goes here
├── audit/identification-audit.md
├── figures/selection-counterexample.pdf
├── sim.py                      # Zero-causal-effect counterexample
└── requirements.txt
```

## Reproduce

```bash
python3 -m pip install -r requirements.txt
python3 sim.py
lualatex presentation.tex
```

## Citation

> Quispe, A., & Xu, K. (2026). *Agentic Delegation and the Language Frontier
> of Software Developers: A Model and Evidence from Claude Code on GitHub*.
> arXiv:2605.25438.
