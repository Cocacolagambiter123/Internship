# CAPM tests on international anomaly portfolios (MATLAB)

Tests whether the CAPM explains the returns of anomaly portfolios around the world. The data are the Jensen, Kelly and Pedersen (2023) global factor returns for 13 anomaly themes (momentum, value, quality and so on). In each country, a theme's return is the equal-weighted average of the long-short factors in that theme, each built with capped value weights. The number of factors in a theme grows over time as the data allow. Every country-theme return is regressed on its own country's market excess return. Its alpha is then tested against zero on its own and, with the Gibbons-Ross-Shanken (GRS) test, jointly with the other themes of the same country.

## Running it

From this folder, run `get_data` once to download the two data files (about 19 MB) into `data/`, then run `run_capm_tests`. It needs base MATLAB only (the t and F p-values come from `betainc`, so no toolboxes) and also runs in GNU Octave. It prints the output below in a few seconds and saves `alpha_tstats.png`.

| File | What it does |
|---|---|
| `get_data.m` | Downloads and unzips the theme returns and the market excess returns |
| `run_capm_tests.m` | Builds a month × theme × country panel, runs all regressions and GRS tests, prints the results and draws the figure |
| `capm_alpha.m` | One CAPM regression: alpha, beta and the t-statistic of alpha with Newey-West and OLS standard errors |
| `grs_test.m` | GRS statistic and its p-value |

## Method

- The benchmark is the country's value-weighted market excess return, the market portfolio of the CAPM. The capped weights of the anomaly portfolios keep a few very large stocks from dominating them in small markets. Using the capped market from the same data set instead changes the share of rejections by less than one percentage point.
- A country-theme portfolio is kept if it has at least 60 months with both its own return and the market excess return.
- Each portfolio is regressed as r = α + β·mkt + ε. The test of α = 0 is two-sided at 5% against a t distribution with T − 2 degrees of freedom. The main test uses Newey-West standard errors (Bartlett weights, lag ⌊4(T/100)^(2/9)⌋ from Newey and West, 1994); OLS standard errors are reported as a check. Months missing inside a portfolio's sample count as zeros in the Newey-West sums, so a lag is always measured in calendar months.
- GRS uses the months in which all of a country's kept themes and its market have returns, and needs at least 60 of them (Venezuela has fewer and is left out). A theme that starts late, usually accruals, therefore shortens the whole country's sample. The statistic is W = ((T − N − 1)/N) · α̂′Σ̂⁻¹α̂ / (1 + μ̂²/σ̂²), where Σ̂ and σ̂² are maximum-likelihood estimates, compared with F(N, T − N − 1).

## Results

Data as published in February 2025. The theme returns run to December 2024, but the market excess returns stop in December 2023, so the regressions end there (the US sample starts in 1926). The data are updated from time to time, so a later download can give slightly different numbers.

Output of `run_capm_tests`:

```
694 country-theme portfolios in 54 countries, at least 60 months each
Alpha = 0 rejected at 5%: Newey-West 31.0%, OLS 31.1% (6.2 and 6.2 times chance)
207 of the 215 significant alphas are positive; 52 of 54 countries have at least one
GRS rejects at 5% in 48 of the 53 countries with at least 60 common months, not in
  arg  13 themes  251 months  p = 0.07
  col  13 themes  199 months  p = 0.79
  irl  13 themes  321 months  p = 0.20
  qat  13 themes  188 months  p = 0.12
  vnm  13 themes   82 months  p = 0.22

Countries with a significant Newey-West alpha, by theme (medians across countries)
theme                tested signif mean p.a. alpha p.a.   beta
momentum                 54     35      5.2%       6.3%  -0.13
value                    54     28      4.0%       4.2%   0.01
profit growth            54     27      2.9%       3.0%  -0.02
low risk                 53     24      1.3%       3.2%  -0.25
quality                  54     24      2.9%       3.5%  -0.10
profitability            53     20      2.8%       3.0%  -0.06
debt issuance            53     16      1.6%       1.6%  -0.03
investment               53     11      1.3%       1.6%  -0.04
seasonality              53      8      0.8%       1.1%  -0.02
accruals                 51      6      1.1%       1.6%  -0.02
short term reversal      54      6      0.0%      -0.1%   0.00
low leverage             54      5     -2.0%      -1.9%  -0.05
size                     54      5      1.0%       1.2%  -0.04
```

![Alpha t-statistics by theme](alpha_tstats.png)

## Why the results come out this way

- **The rejections are not chance.** If the CAPM held, about 5% of alphas would be significant by luck, split evenly between positive and negative. Instead 31% are significant and 207 of the 215 are positive, the direction in which each factor is signed. Five of the eight negative ones are in low leverage, the only theme with a clearly negative median alpha.
- **For most themes alpha is close to the mean return.** Alpha is the mean minus β times the market's mean, and a long-short portfolio holds stocks on both sides, so its beta is close to zero. Low risk is the exception: it buys low-beta stocks and sells high-beta ones, so its median beta is -0.25 and the CAPM predicts a negative mean. It earns 1.3% a year instead, an alpha of 3.2% (the 'betting against beta' result of Frazzini and Pedersen, 2014).
- **Four themes are close to chance.** Accruals, short-term reversal, low leverage and size have a significant alpha in only 5 or 6 of 51 to 54 countries, against about 3 expected by luck. The evidence against the CAPM comes from the themes at the top of the table, not from all of them.
- **Newey-West hardly changes the count.** It allows for heteroskedastic and autocorrelated residuals and moves individual t-statistics, but the share of rejections is almost the same as with OLS (31.0% against 31.1%). The result does not depend on assuming independent, equal-variance errors.
- **GRS is the stricter test.** With 13 themes, at least one would look significant by luck in about half of countries (1 − 0.95¹³ ≈ 49%), so one significant theme says little about a country. GRS tests all themes at once, allowing for their correlations, and rejects in 48 of the 53 countries it can test. Of the five where it does not, Argentina, Colombia, Ireland and Qatar are small markets (21 to 65 stocks at the end of 2023), and Vietnam has only 82 common months. The test has little power there, so not rejecting is not evidence that the CAPM holds.

## References

- Frazzini, A. and Pedersen, L. H. (2014). Betting against beta. *Journal of Financial Economics*, 111(1), 1–25.
- Gibbons, M., Ross, S. and Shanken, J. (1989). A test of the efficiency of a given portfolio. *Econometrica*, 57(5), 1121–1152.
- Jensen, T. I., Kelly, B. and Pedersen, L. H. (2023). Is there a replication crisis in finance? *Journal of Finance*, 78(5), 2465–2518. Data from [jkpfactors.com](https://jkpfactors.com).
- Newey, W. and West, K. (1987). A simple, positive semi-definite, heteroskedasticity and autocorrelation consistent covariance matrix. *Econometrica*, 55(3), 703–708.
- Newey, W. and West, K. (1994). Automatic lag selection in covariance matrix estimation. *Review of Economic Studies*, 61(4), 631–653.
