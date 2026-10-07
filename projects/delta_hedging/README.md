# Delta-hedging simulator (MATLAB)

Sells a European call option and delta-hedges it until expiry over 50,000 simulated stock paths. It measures how three things drive the hedged profit and loss (P&L):

1. how often the hedge is rebalanced,
2. selling the option at a volatility different from the one the stock then realises, and
3. trading costs.

## Running it

Open MATLAB in this folder and run `run_experiments`. With GNU Octave, run this from the folder (the two settings save the figure without opening a plot window):

```
octave-cli --no-gui -q --eval "graphics_toolkit('gnuplot'); set(0,'defaultfigurevisible','off'); run_experiments"
```

It needs base MATLAB only (no toolboxes), prints three tables and saves one figure to `figures/` in about 20 seconds.

| File | What it does |
|---|---|
| `run_experiments.m` | Sets the parameters, runs the three experiments, prints the tables and saves the figure |
| `simulate_hedge.m` | Simulates stock paths (geometric Brownian motion) and the hedge: sells the call at implied volatility, buys the delta in shares, rebalances at the end of every interval, unwinds at expiry and pays the payoff. Returns P&L and trading costs per path |
| `bs_call.m` | Black-Scholes call price, delta and vega |

## Set-up

A three-month at-the-money call (S0 = K = 100) is sold at 20% implied volatility with a 3% risk-free rate, for a premium of 4.358 (vega 19.79 per unit of volatility, so 0.198 per volatility point). The stock follows geometric Brownian motion with an 8% drift, and cash earns the risk-free rate. P&L is per option, in today's money.

Every simulation restarts the random number generator from the same seed, so strategies with the same number of hedges are compared on the same stock paths. The numbers below come from GNU Octave 8.4; MATLAB's generator gives slightly different values.

## 1. How often to hedge

Realised volatility equals implied volatility and there are no trading costs, so the only source of P&L is hedging at discrete times instead of continuously.

| Hedging | Hedges | Mean P&L | Std of P&L | Derman-Kamal approximation | Skewness |
|---|---:|---:|---:|---:|---:|
| fortnightly | 6 | -0.011 | 1.332 | 1.432 | -0.55 |
| weekly | 13 | -0.002 | 0.928 | 0.973 | -0.41 |
| twice weekly | 26 | 0.002 | 0.656 | 0.688 | -0.29 |
| daily | 63 | 0.000 | 0.429 | 0.442 | -0.19 |
| twice daily | 126 | -0.001 | 0.307 | 0.313 | -0.16 |
| 4x daily | 252 | 0.001 | 0.219 | 0.221 | -0.11 |

- **Mean P&L is zero.** The premium pays for the hedge.
- **The spread falls like 1/√N.** Hedging four times as often halves the standard deviation, and the fitted slope of log(std) on log(N) is -0.484, against -0.5 in theory.
  - Over one interval the short hedged call earns about ½ Γ S² [σ²Δt − (ΔS/S)²]. This is zero on average, with a variance proportional to Δt².
  - Adding up N = T/Δt of these gives a variance proportional to Δt, so the standard deviation scales with √(T/N).
- **The Derman-Kamal approximation fits once hedging is frequent.** √(π/4) σ × vega / √N is 1–3% above the simulation from daily hedging upwards and 5–7.5% above for less frequent hedging. It assumes each interval is short; over a long interval the stock can move away from the strike, where gamma is smaller, so the approximation overstates the error.
- **The P&L is skewed to the left.** Each interval's P&L is at most ½ Γ S² σ² Δt but can be large and negative after a big move, because a short option is short gamma. The skew fades from -0.55 to -0.11 as hedging becomes more frequent, because the P&L is then the sum of more, smaller errors.

## 2. Selling at the wrong volatility

The call is still sold at 20%, but the stock realises between 10% and 30%. The hedge is rebalanced daily, using the delta at either the implied or the realised volatility, on the same stock paths.

| Realised vol | C(implied) − C(realised) | Implied-vol delta: mean | std | Realised-vol delta: mean | std |
|---:|---:|---:|---:|---:|---:|
| 10% | 1.975 | 1.938 | 0.546 | 1.973 | 0.210 |
| 15% | 0.989 | 0.980 | 0.453 | 0.988 | 0.320 |
| 20% | 0.000 | 0.000 | 0.429 | 0.000 | 0.429 |
| 25% | -0.990 | -0.987 | 0.679 | -0.989 | 0.538 |
| 30% | -1.980 | -1.976 | 1.107 | -1.979 | 0.647 |

- **The realised-volatility delta locks in the price difference.** It replicates a call priced at the realised volatility, so the P&L is C(20%) − C(σ_real) whatever the drift, apart from discrete-hedging noise (std 0.21 at 10% realised volatility). Selling at 20% when the stock realises 15% makes 0.99 per option.
- **The implied-volatility delta makes the profit path-dependent.** The profit builds up as ½ Γ S² (σ_imp² − σ_real²) dt, so it depends on how long the stock spends near the strike, where gamma is largest (std 0.55 at 10% realised volatility).
- **Its mean also picks up the stock's drift.** The implied-volatility delta is not the exact replicating hedge, so part of the stock's 8% drift leaks into the P&L: at 10% realised volatility the mean is 1.938 against 1.975. Setting `p.mu = p.r` removes the gap.
- **Hedging at implied volatility still has a use.** Realised volatility is unknown in advance, and the implied-volatility delta keeps the mark-to-market P&L smooth, at the cost of path dependence (Ahmad and Wilmott, 2005).

## 3. Trading costs

Each trade, including the first hedge and the final unwind, costs a fixed fraction of the value traded. Root-mean-square P&L, √(mean² + variance), counts a predictable average cost and an unpredictable spread on the same scale, so lower is better.

| Hedging | Hedges | No costs | 0.1% | 0.2% | 0.5% |
|---|---:|---:|---:|---:|---:|
| fortnightly | 6 | 1.332 | 1.359 | 1.411 | 1.689 |
| weekly | 13 | 0.928 | 0.968 | 1.058 | 1.519 |
| twice weekly | 26 | 0.656 | 0.724 | 0.880 | 1.574 |
| daily | 63 | 0.429 | 0.579 | 0.877 | 1.942 |
| twice daily | 126 | 0.307 | 0.582 | 1.027 | 2.458 |
| 4x daily | 252 | 0.219 | 0.682 | 1.307 | 3.224 |

![Root-mean-square P&L against number of hedges for four cost levels](figures/costs_vs_frequency.png)

- **Costs rise as hedging error falls.** Hedging error falls like 1/√N. Each rebalance trades roughly Γ S σ √Δt shares, so the cost of rebalancing grows like √N, on top of the fixed cost of setting up and unwinding the hedge.
- **The best frequency falls as costs rise.** At 0.1%, daily and twice daily are about 0.5% apart, which is within simulation noise (other seeds favour either); at 0.2%, daily, narrowly ahead of twice weekly; at 0.5%, weekly. Leland (1985) builds the expected cost into the price by raising the volatility used in Black-Scholes.

## References

- Derman, E. and Kamal, M. (1999). When you cannot hedge continuously: the corrections of Black-Scholes. *Risk*.
- Ahmad, R. and Wilmott, P. (2005). Which free lunch would you like today, Sir? Delta hedging, volatility arbitrage and optimal portfolios. *Wilmott Magazine*.
- Leland, H. E. (1985). Option pricing and replication with transactions costs. *Journal of Finance*, 40(5), 1283–1301.
