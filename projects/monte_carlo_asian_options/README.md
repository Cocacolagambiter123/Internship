# Monte Carlo pricing of Asian options (MATLAB)

Prices a discretely monitored arithmetic-average Asian call by Monte Carlo under risk-neutral geometric Brownian motion. The option has no closed form, so the project compares four estimators of its price at the same number of paths: plain Monte Carlo, antithetic variates, a geometric Asian control variate, and the control variate combined with antithetic variates. A European call and a geometric-average Asian call, both of which have closed forms, check the simulated paths and the known mean that the control variate relies on. The control variate is by far the best method in the base case, so a second script maps how its advantage shrinks across volatility and strike, and explains why.

## Running it

Open MATLAB in this folder and run `run_pricing`, then `run_cv_grid`. Both need base MATLAB only (no toolboxes) and also run in GNU Octave:

```
octave-cli --no-gui -q --eval "graphics_toolkit('gnuplot'); set(0,'defaultfigurevisible','off'); run_pricing"
octave-cli --no-gui -q --eval "run_cv_grid"
```

`run_pricing` prints the two tables under Results and saves `payoff_scatter.png`; `run_cv_grid` prints the three tables and the final line in the last section and takes a few seconds.

| File | What it does |
|---|---|
| `run_pricing.m` | Sets the parameters, computes the closed forms, runs the estimators, prints the tables and saves the figure |
| `run_cv_grid.m` | Computes the control variate's variance ratio over a grid of volatilities and strikes, on the same paths in every cell, split into the spread of the payoff and the spread of what the control variate leaves |
| `simulate_payoffs.m` | Simulates price paths at the averaging dates and returns the discounted European, arithmetic Asian and geometric Asian payoffs |
| `black_call.m` | Black's formula, used for both closed forms |

## Set-up

S0 = 100, K = 100, r = 5%, σ = 20%, T = 1 year, with 12 monthly averaging dates t_i = iΔt (the last at expiry). Each method uses 100,000 paths; the antithetic methods use 50,000 pairs, so every row of the second table costs the same number of paths. The variance ratio is (SE of plain Monte Carlo / SE of the method)², the number of times as many plain paths needed for the same standard error.

The closed forms both use Black's formula, because S_T and the geometric average G are both lognormal:

- **European call:** forward S0·e^(rT), log-variance σ²T.
- **Geometric Asian call** (discrete version of Kemna and Vorst, 1990): ln G is normal with mean m = ln S0 + (r − σ²/2)Δt(n+1)/2 and variance v = σ²Δt(n+1)(2n+1)/(6n), so the forward is e^(m + v/2). The variance follows from Var(Σ W(t_i)) = Δt Σ_i Σ_j min(i, j) = Δt n(n+1)(2n+1)/6.

The numbers below come from one run in GNU Octave 8.4 with seed 1. MATLAB's random number stream differs from Octave's, so it gives slightly different numbers.

## Results

Closed-form checks, plain Monte Carlo with 100,000 paths (z = (Monte Carlo − closed form) / std error):

| Option | Monte Carlo | Std error | Closed form | z |
|---|---:|---:|---:|---:|
| European call | 10.5101 | 0.0468 | 10.4506 | 1.27 |
| Geometric Asian call | 5.9796 | 0.0261 | 5.9402 | 1.51 |

Arithmetic Asian call, 100,000 paths per method:

| Method | Price | Std error | Variance ratio |
|---|---:|---:|---:|
| Plain | 6.1972 | 0.02697 | 1 |
| Antithetic | 6.1380 | 0.01855 | 2 |
| Control variate | 6.1566 | 0.00076 | 1276 |
| Control variate + antithetic | 6.1548 | 0.00079 | 1170 |

Control-variate coefficient b = 1.0317 (single paths) and 1.0275 (antithetic pairs). Correlation between the arithmetic and geometric payoffs: 0.999608. Correlation between antithetic partners: −0.521 for the arithmetic payoff, +0.070 for the control-variate residual.

![Arithmetic against geometric payoff on the same paths](payoff_scatter.png)

- **The closed-form checks pass.** Both simulated prices are within 1.6 standard errors of the exact value. The two errors are not independent: both prices come from the same paths, and a path that pays well on the European call tends to pay well on the geometric Asian too.
- **The control variate removes almost all the noise.** On every path the arithmetic average A is at least the geometric average G, and with monthly averaging and 20% volatility the gap is small, so the two payoffs lie almost on a line (figure). The estimator averages Y − b(X − E[X]), where Y is the arithmetic payoff and X the geometric one. With the optimal b = cov(Y, X)/var(X), its variance is (1 − ρ²) var(Y), so the variance ratio is 1/(1 − ρ²). With ρ = 0.999608 that is 1276, as in the table, and the standard error falls by 97%. Only the part of the arithmetic payoff that the geometric payoff does not explain is left to simulate.
- **Antithetic variates help less.** Pairing each path with its mirror image (Z and −Z) helps only as far as the two payoffs move in opposite directions: the variance per path is multiplied by 1 + ρ_pair, where ρ_pair is the correlation between partners. A call pays nothing on over 40% of paths, so ρ_pair is only −0.521 and the variance ratio is about 2.
- **Adding antithetic variates to the control variate does not help.** The control variate has already removed the part of the payoff that depends on the direction of the path, which is the part antithetic pairs cancel. What is left depends mostly on how far prices spread out along the path, which is about the same for a path and its mirror image, so the partners' residuals are slightly positively correlated (+0.070). The variance ratio falls from 1276 to 1170.
- **The only bias comes from estimating b.** The log-price is simulated exactly at the averaging dates, so 12 steps per path give no discretisation bias. Estimating b from the same paths adds a bias of order 1/N, far below the standard error.

## Where the control variate weakens

A variance ratio of 1276 is a property of the base case, not of the method. `run_cv_grid` recomputes it for volatilities from 10% to 80% and strikes from 80 to 130, with S0 = 100, r = 5%, T = 1 and 12 averaging dates as before, and 100,000 paths per cell. Every cell uses the same random draws, the ones behind the main table, so the σ = 20%, K = 100 cell repeats the 1276 and neighbouring cells differ because of the parameters, not because of different draws. A cell with fewer than 100 paying paths is left as NaN; this happens only at σ = 10%, K = 130, where 4 of the 100,000 paths pay.

The residual is what the control variate leaves on each path: the arithmetic payoff minus its least-squares fit on the geometric payoff. The variance ratio is (std of the arithmetic payoff / std of the residual)², so the second and third tables show which of the two moves when the ratio changes.

Variance ratio of the control variate, with the mean gap between the arithmetic and geometric averages:

| σ | K = 80 | 90 | 100 | 110 | 120 | 130 | mean A/G − 1 |
|---|---:|---:|---:|---:|---:|---:|---:|
| 10% | 5474 | 5833 | 4569 | 816 | 105 | NaN | 0.09% |
| 20% | 1637 | 1698 | 1276 | 614 | 237 | 84 | 0.34% |
| 30% | 761 | 730 | 578 | 376 | 216 | 121 | 0.75% |
| 40% | 417 | 389 | 323 | 242 | 169 | 114 | 1.34% |
| 50% | 253 | 235 | 202 | 165 | 128 | 97 | 2.12% |
| 60% | 165 | 154 | 137 | 117 | 97 | 80 | 3.10% |
| 70% | 114 | 107 | 97 | 86 | 75 | 64 | 4.32% |
| 80% | 81 | 77 | 71 | 65 | 58 | 52 | 5.79% |

Standard deviation of the arithmetic payoff (the noise plain Monte Carlo has to average out):

| σ | K = 80 | 90 | 100 | 110 | 120 | 130 |
|---|---:|---:|---:|---:|---:|---:|
| 10% | 6.05 | 5.98 | 4.52 | 1.55 | 0.25 | NaN |
| 20% | 12.00 | 11.00 | 8.53 | 5.42 | 2.91 | 1.38 |
| 30% | 17.44 | 15.63 | 12.87 | 9.79 | 6.98 | 4.75 |
| 40% | 22.67 | 20.44 | 17.59 | 14.57 | 11.70 | 9.19 |
| 50% | 28.04 | 25.59 | 22.74 | 19.78 | 16.93 | 14.32 |
| 60% | 33.73 | 31.18 | 28.37 | 25.48 | 22.68 | 20.05 |
| 70% | 39.87 | 37.29 | 34.53 | 31.72 | 28.98 | 26.38 |
| 80% | 46.55 | 43.99 | 41.29 | 38.57 | 35.91 | 33.35 |

Standard deviation of the residual (the noise left with the control variate):

| σ | K = 80 | 90 | 100 | 110 | 120 | 130 |
|---|---:|---:|---:|---:|---:|---:|
| 10% | 0.082 | 0.078 | 0.067 | 0.054 | 0.024 | NaN |
| 20% | 0.297 | 0.267 | 0.239 | 0.219 | 0.189 | 0.151 |
| 30% | 0.632 | 0.579 | 0.535 | 0.505 | 0.475 | 0.432 |
| 40% | 1.110 | 1.036 | 0.979 | 0.936 | 0.901 | 0.861 |
| 50% | 1.762 | 1.670 | 1.598 | 1.541 | 1.497 | 1.453 |
| 60% | 2.623 | 2.515 | 2.427 | 2.354 | 2.298 | 2.246 |
| 70% | 3.737 | 3.613 | 3.508 | 3.418 | 3.348 | 3.288 |
| 80% | 5.160 | 5.015 | 4.893 | 4.786 | 4.700 | 4.628 |

Paths where only the arithmetic call pays (A > K ≥ G) account for at most 9.4% of the residual variance in any cell.

- **Every ratio is 1/(1 − ρ²), and near ρ = 1 that is very sensitive to ρ.** Because b is the least-squares slope, the control variate's variance is exactly (1 − ρ²) times the plain variance, where ρ is the correlation between the two payoffs in that cell. The best cell, 5833, corresponds to ρ = 0.99991 and the worst, 52, to ρ = 0.990. Both correlations look close to 1, yet one gives more than a hundred times the gain of the other.
- **Volatility: at and in the money the gain falls roughly as 1/σ².** At the money the ratio falls from 4569 at σ = 10% to 71 at σ = 80%, a factor of 64 for an eightfold rise in volatility, and at K = 80 the fall is similar (5474 to 81). The payoff's standard deviation grows roughly in proportion to σ (4.52 to 41.29 at the money, 9 times). The residual comes from the gap between the two averages, and that gap is a second-order effect: A/G − 1 is roughly half the variance of the 12 log prices along a path, so it grows with σ². The last column of the first table rises from 0.09% to 5.79%, close to the 8² = 64 that σ² predicts, and the residual's standard deviation at the money rises about 73 times, from 0.067 to 4.893. Noise of order σ² set against a payoff spread of order σ leaves 1 − ρ² of order σ². The scaling is rough: at the money the ratio falls 3.6 times from σ = 10% to 20% and 4.5 times from 40% to 80%, against 4 for an exact 1/σ².
- **Strike: out of the money the payoff shrinks but the residual does not.** The gap A − G depends mainly on how much the price wandered between averaging dates, which the geometric average only partly reflects, so every paying path carries noise the control cannot remove, whatever the strike. The payoff's spread, by contrast, collapses out of the money, because most paths pay nothing and those that pay only just clear the strike. At σ = 20%, raising K from 100 to 130 cuts the payoff's standard deviation from 8.53 to 1.38 but the residual's only from 0.239 to 0.151, so the ratio falls from 1276 to 84. The kink in the payoff plays only a small part: when A > K ≥ G the geometric call pays nothing and so says nothing about the arithmetic payoff, but those paths never carry more than 9.4% of the residual variance. The small rise from K = 80 to K = 90 at 10% and 20% volatility has a simple cause: paths that stop paying no longer add gap noise, so the residual's spread falls slightly faster than the payoff's.
- **At high volatility the strike matters less.** At σ = 80% the ratio only falls from 81 to 52 across the strikes. Prices spread so widely that every strike from 80 to 130 is fairly close to the money: the payoff's standard deviation only falls from 46.55 to 33.35, and the residual's from 5.160 to 4.628.
- **On this grid it never stops working.** The weakest reported cell still needs 52 times fewer paths than plain Monte Carlo for the same standard error, a standard error about 7 times smaller at the same cost. The base case is a favourable one, though: ratios above 1000 occur only at σ ≤ 20% with K ≤ 100.

Limitations of the grid:

- The ratios are themselves estimates, and the noisiest are the cells where few paths pay. Rerunning with seeds 2 and 3 moves the σ = 20%, K = 130 cell to 89 and 95 and the σ = 10%, K = 120 cell to 116 and 95, but leaves the pattern unchanged, including the small rise from K = 80 to K = 90.
- b is fitted on the same paths it is applied to, so each ratio is very slightly optimistic, by an amount of order 1/N.
- Only one maturity and one averaging schedule are tested, under constant volatility. The gap between the averages depends on σ²T, so a longer maturity should act like a higher volatility, but that is not checked here.

## References

- Kemna, A. G. Z. and Vorst, A. C. F. (1990). A pricing method for options based on average asset values. *Journal of Banking and Finance*, 14(1), 113–129.
- Glasserman, P. (2004). *Monte Carlo Methods in Financial Engineering*. Springer.
