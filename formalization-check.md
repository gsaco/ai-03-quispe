# EconCSLib paper check

Paper: *Agentic Delegation and the Language Frontier of Software Developers: A
Model and Evidence from Claude Code on GitHub*

- Paper folder: `QX26AgenticDelegation`
- Source version: arXiv v2, 2026-07-07
- Source SHA-256:
  `cddc048711c43022d5fd01b995bfb1114c728c8c879b809b5fdc354a391d3c35`
- Check date: 2026-09-01
- Working directory: EconCSLib repository root

Command:

```text
python3 scripts/paper_contribution.py check QX26AgenticDelegation --fast
```

Result:

```text
+ lake build QX26AgenticDelegation.PaperInterface
Build completed successfully (8315 jobs).
+ git diff --check -- papers/QX26AgenticDelegation papers/QX26AgenticDelegation.lean lakefile.toml ':(exclude)papers/QX26AgenticDelegation/source/'
FINAL_FAST_CHECK_EXIT_CODE=0
```

The paper-facing interface built successfully and the scoped whitespace check
passed. The copied folder is still labelled **partially formalized** because
Proposition 3 needs the additional condition `p2 < 1` for its strict clause,
Proposition 2 uses an order-theoretic CDF abstraction, the empirical design is
outside Lean scope, and the full v11 semantic-audit closeout was not completed.
