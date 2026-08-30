# Identification audit: what the event study cannot distinguish

## Bottom line

The paper documents a large and carefully measured change in public GitHub
production at first detectable Claude Code use. Its outcome-side checks reject
several mechanical stories. They do not reject the strongest alternative: an
unfamiliar-language project can cause both adoption and diversification.

## 1. The theoretical prediction is not agent-specific

The paper's Proposition 2 compares a pre-agent threshold $T^1=T^S$ with a
delegation threshold $T^D<T^S$. For an unfamiliar language,

$$
Z^2-Z^1=\mathbf 1\{T^D\le \omega<T^S\}.
$$

Now introduce any generic intervention that lowers the entry threshold by
$\tau>0$:

$$
T^G=T^1-\tau.
$$

It follows immediately that

$$
Z^G-Z^1=\mathbf 1\{T^1-\tau\le\omega<T^1\}.
$$

This is observationally the same activation band. The threshold algebra shows
that menu expansion can activate marginal projects; it does not show that only
an agent can do so. The agent-specific content comes from Assumption 1, which
rules out an entry effect from conversational tools, and from the particular
delegation payoff imposed in $V^D$.

An empirical test distinctive to delegation would need variation tied to the
agent's proposed mechanism—for example, task-level verification requirements,
repository-execution intensity, or a comparison against non-agent tools that
generate similar total productivity gains.

## 2. Selection counterexample with zero Claude effect

Let $P_{it}$ denote a new-project shock for developer $i$ in month $t$.
Suppose it both triggers Claude adoption and independently expands the number
of languages used:

$$
A_{it}=\mathbf 1\{P_{it}\ge c_i\},
$$

$$
Y_{it}(a)=\mu_i+\lambda_t+\beta P_{it}+\tau a+\varepsilon_{it}.
$$

The causal effect of adoption is $\tau$. Around the first adoption month,
however, a treated-versus-not-yet-treated contrast has the schematic form

$$
\widehat{\operatorname{ATT}}(g,t)
=\tau+
\beta\left[
  \mathbb E(P_{it}\mid G_i=g)
  -\mathbb E(P_{it}\mid G_i>t)
\right].
$$

Because adoption selects developers experiencing large $P_{it}$, the bracket
is positive at $t=g$. Therefore $\widehat{\operatorname{ATT}}(g,g)>0$ even
when $\tau=0$.

This counterexample can also produce flat coefficients at $e\le-2$: the
project shock need not arrive gradually. It can arrive at adoption. Allowing
one month of anticipation absorbs a ramp-up but does not turn the shock into
exogenous treatment variation.

## 3. Why the reported robustness checks do not close the gap

| Check | What it rules out | What remains |
|---|---|---|
| Remove the first-Claude language | The defining commit mechanically contributes its language | The project can still create several languages and trigger adoption |
| Remove all Claude-coauthored commits | The estimate is merely the agent's recorded output | The developer's own commits can respond to the same new project |
| Condition on baseline activity | Selection on observed pre-adoption volume | Selection on a new, time-varying opportunity |
| Restrict to active developers | A near-zero pre-period baseline | Project-driven adoption among active developers |
| Placebo adoption dates | Generic spurious seasonality | A shock located at the true adoption date |
| Specialist heterogeneity | A uniform activity shock | Specialists may adopt precisely when unfamiliar projects arrive |

These checks are valuable. The objection is not that the result is mechanical
or badly estimated. It is that the treatment date is an outcome of the same
decision process that produces the measured frontier change.

## 4. Conditions under which the paper's causal reading would hold

A causal interpretation needs conditional parallel trends: after conditioning
on the included covariates, no time-varying unobservable may jointly change
Claude adoption and language outcomes. In the counterexample, this requires
either $\beta=0$ or

$$
\mathbb E(P_{it}\mid G_i=g)
=\mathbb E(P_{it}\mid G_i>t),
$$

which contradicts adoption being triggered by the project shock.

Promising designs would use:

1. randomized Claude access or encouragement;
2. plausibly exogenous free-tier or institutional-license eligibility;
3. a discontinuity at a subscription cutoff;
4. task-level assignment of agentic versus conversational assistance;
5. a matched productivity-shock benchmark that separates “agent” from “more
   productive.”

## Verdict

The robust claim is: **developers' public language portfolios broaden sharply
when Claude Code first becomes detectably used, in a pattern consistent with
delegation.** The stronger claim—**Claude Code causally expands the frontier
through delegation**—does not follow from the current design.
