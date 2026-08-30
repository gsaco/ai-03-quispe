"""Zero-effect selection counterexample for Quispe and Xu (2026).

Adoption and language breadth respond to the same new-project shock. The true
causal effect of Claude is fixed at zero, but a not-yet-treated event study
still displays a large adoption-time jump.
"""

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


SEED = 260525438
N_DEVELOPERS = 12_000
N_MONTHS = 30
TRUE_CLAUDE_EFFECT = 0.0


def simulate():
    rng = np.random.default_rng(SEED)
    adoption_month = rng.integers(8, 23, size=N_DEVELOPERS)
    developer_effect = rng.normal(0.9, 0.25, size=N_DEVELOPERS)
    project_size = rng.lognormal(mean=0.55, sigma=0.32, size=N_DEVELOPERS)
    calendar = np.linspace(-0.04, 0.07, N_MONTHS)

    outcome = np.empty((N_DEVELOPERS, N_MONTHS))
    for t in range(N_MONTHS):
        event_time = t - adoption_month
        project_shock = np.where(
            event_time >= 0,
            project_size * np.exp(-0.23 * event_time),
            0.0,
        )
        adopted = (event_time >= 0).astype(float)
        noise = rng.normal(0.0, 0.18, size=N_DEVELOPERS)
        outcome[:, t] = (
            developer_effect
            + calendar[t]
            + project_shock
            + TRUE_CLAUDE_EFFECT * adopted
            + noise
        )
    return adoption_month, outcome


def not_yet_treated_event_study(adoption_month, outcome, event_grid):
    estimates = []
    standard_errors = []

    for event_time in event_grid:
        cohort_effects = []
        for cohort in np.unique(adoption_month):
            t = cohort + event_time
            baseline_t = cohort - 2
            if not (0 <= t < N_MONTHS and 0 <= baseline_t < N_MONTHS):
                continue

            treated = adoption_month == cohort
            controls = adoption_month > max(t, baseline_t)
            if treated.sum() < 10 or controls.sum() < 10:
                continue

            treated_change = (outcome[treated, t] - outcome[treated, baseline_t]).mean()
            control_change = (outcome[controls, t] - outcome[controls, baseline_t]).mean()
            cohort_effects.append(treated_change - control_change)

        estimates.append(np.mean(cohort_effects))
        standard_errors.append(np.std(cohort_effects, ddof=1) / np.sqrt(len(cohort_effects)))

    return np.asarray(estimates), np.asarray(standard_errors)


def main():
    adoption_month, outcome = simulate()
    event_grid = np.arange(-6, 9)
    estimates, standard_errors = not_yet_treated_event_study(
        adoption_month, outcome, event_grid
    )

    fig, ax = plt.subplots(figsize=(8.4, 4.8))
    ax.axhline(0, color="#5B6470", linewidth=1)
    ax.axvline(-0.5, color="#D9DEE4", linewidth=1)
    ax.errorbar(
        event_grid,
        estimates,
        yerr=1.96 * standard_errors,
        fmt="o-",
        color="#0C2852",
        markerfacecolor="#982A34",
        markeredgecolor="white",
        linewidth=2.2,
        markersize=6.5,
        capsize=3,
    )
    ax.set(
        xlabel="Event month relative to first adoption",
        ylabel="Not-yet-treated event-study estimate",
        title="A project shock creates an adoption-time jump when the true Claude effect is zero",
        xticks=event_grid,
    )
    ax.spines[["top", "right"]].set_visible(False)
    ax.grid(axis="y", color="#EBEEF1", linewidth=0.8)
    ax.text(
        0.02,
        0.96,
        r"Data-generating process: $\tau_{Claude}=0$",
        transform=ax.transAxes,
        ha="left",
        va="top",
        color="#982A34",
        fontweight="bold",
    )
    fig.tight_layout()

    output_dir = Path("figures")
    output_dir.mkdir(exist_ok=True)
    fig.savefig(output_dir / "selection-counterexample.pdf", bbox_inches="tight")
    fig.savefig(output_dir / "selection-counterexample.png", dpi=220, bbox_inches="tight")

    adoption_index = int(np.where(event_grid == 0)[0][0])
    print(f"True Claude effect: {TRUE_CLAUDE_EFFECT:.3f}")
    print(f"Estimated adoption-month jump: {estimates[adoption_index]:.3f}")
    print("Wrote figures/selection-counterexample.pdf and .png")


if __name__ == "__main__":
    main()
