# Quant CV: interview notes

Short explanations for the newest lines on the Quant CV, with the questions an interviewer is most likely to ask about each.

**Tell each line as a process, not a result.** Trading interviewers want to see how you think, so walk through each project in this order: the question, what you expected and why, how you checked your tools before trusting them, what you found, and what changed your mind. The CV bullets are written in that order, so you can follow them.

## Dissertation: Who Hedges the Barrel?

**In 30 seconds.** "I use OPEC-day oil surprises to measure how much each petro-currency moves on oil news, its oil beta. Then I test whether governments that take oil risk off their currency change the shape of that beta: Norway's rule-based krone conversions should shrink it, Russia's 2017–22 budget rule should kink it, and Mexico's put hedge should make it one-sided. Finally I test whether any beta that is left can be traded after costs."

**What an oil beta is.** The currency's same-day return per unit of oil news. The news is Känzig's oil supply surprise series: the move in oil futures in a tight window around each OPEC announcement. Little else happens in that window, so the move is mostly OPEC news.

**Why each hedge predicts a different shape.**
- *Norway, smaller.* Oil money goes into the oil fund abroad. Norges Bank only buys or sells the krone the budget needs, in amounts announced in advance each month. Higher oil revenue therefore brings little extra krone buying. Canada has no such rule, so CAD is the control.
- *Russia, kinked.* When oil was above a cut-off price ($40 a barrel in 2017 money, raised 2% a year), the Finance Ministry used the extra revenue to buy foreign currency. That buying pushes against rouble strength exactly where oil is high, so the beta should change at the cut-off.
- *Mexico, one-sided.* The government buys put options on its oil each year. A put pays out when oil falls, so bad oil news should hurt the peso less than good news helps it.

**"Why do you say the hedges reshape oil betas like options?"** Mexico's puts give the government a floor on its oil revenue, so the peso should fall less on bad oil news than it rises on good news: a one-sided beta, like holding oil with a protective put. Russia's rule sold the extra revenue above a cut-off price for foreign currency, which caps the rouble's upside like a covered call, so the beta should kink at the cut-off. Norway's conversions are the exception: they are linear, shrinking the beta everywhere, like hedging part of a position rather than buying an option.

**"Isn't your beta just the dollar?"** Partly, because the dollar itself moves on OPEC days. I remove a dollar factor built from non-commodity currencies and repeat the main results against the euro.

**"How do you know the rule caused the change?"** Difference-in-differences. I compare how the rouble's beta changed when the rule started (February 2017) and during the March–December 2020 sales window against the same change for CAD and NOK. If all three shifted, the rule is not the cause. Data after February 2022 are dropped because sanctions swamp everything else.

**"What is a White reality check?"** If you try several trading rules, the best one looks good by luck. White's test bootstraps the best result across every rule tried and asks how often luck alone would do as well. I fix the main rule before testing it, and the check covers every variant I then try, such as holding for one to five days.

**Kelly sizing.** Bet the fraction of capital that maximises long-run growth: roughly the edge divided by the variance, scaled down because the edge is estimated. Same logic as the poker bankroll below.

**Honest limits, say them before you are asked.** There are few OPEC days inside each regime: perhaps 40–60 under Russia's rule and about 10 in the 2020 sales window. Oil only crossed Russia's cut-off in 2020, together with COVID. Mexico exports little net oil, so the peso's beta may be near zero. A null result still counts: it says markets see through these hedges.

**If asked for results:** "It's in progress. I wrote the three predictions down before running the tests, so whatever comes out is a real test, not something I went looking for."

## Delta-Hedging Simulator

**In 30 seconds.** "I simulated selling a three-month call option and hedging it with shares, rebalancing at different frequencies, over 50,000 random stock paths. I measured three things: how the hedging error changes with how often you rebalance, what happens if you sell the option at the wrong volatility, and how trading costs change the best rebalancing frequency."

**What delta hedging is.** Selling a call loses money if the stock rises. Delta is how much the option's value moves for a £1 move in the stock. Holding delta shares per option sold cancels small moves, so the position no longer depends on the stock's direction.

**Why hedging isn't perfect.** Delta changes as the stock moves (that's gamma), but the hedge is only updated at set times. Between updates, a big move costs the option seller money and a quiet period earns them a little. On average these cancel, because the premium pays for them, but they leave noise in the P&L.

**"Why does hedging four times as often halve the error?"**
- Each interval leaves a random error whose size is proportional to the interval's length, T/N.
- There are N of these errors, and independent errors add up like the square root of their number. The total is √N × T/N = T/√N.
- Quadrupling N therefore halves the error. The simulation shows exactly that: 0.43 per option with daily hedging, 0.22 with hedging four times a day.
- That is the check on the CV: regress log(error) on log(N). Theory says the slope is −0.5 and the simulation gives −0.484, so the simulator behaved as it should before I used it for anything new.

**"What happens if you sell at the wrong volatility?"** The option was sold at a price based on 20% volatility. Hedging it costs whatever the option is worth at the volatility the stock actually delivers. If the stock only moves at 15%, hedging costs about 3.37 against the 4.36 received, so the seller keeps about 0.99. That is the difference between the two Black-Scholes prices, and the simulation's average matches it.

**"Why is the profit steadier with the realised-volatility delta?"**
- Hedging with the delta at the true volatility replicates the option almost exactly, so the profit is fixed from the start.
- Hedging with the delta at the implied volatility earns the profit gradually through gamma. It earns more when the stock stays near the strike, so the result depends on the path.
- Desks still hedge at implied volatility, because nobody knows realised volatility in advance.

**"Why does a higher trading cost mean hedging less often?"** Hedging more often cuts the error, but each rebalance costs money, and the total traded grows with √N. The best frequency balances the two. It is daily to twice daily at 0.1% costs and weekly at 0.5%.

**"What are the model's limits?"** Volatility is constant, prices move smoothly with no jumps, costs are a fixed percentage of the value traded, and there is one option. Real markets have jumps and changing volatility, so real hedging errors are larger.

**"What would you do next?"** Name an extension you have done yourself. Two quick ones: hedge a put instead of a call, or set the drift equal to the risk-free rate (`p.mu = p.r`) and show the gap in the wrong-volatility table disappears.

## Poker Society: teaching Kelly bankrolls

**What Kelly is.** It sizes each bet to maximise the long-run growth of your bankroll. For a small edge, the best fraction to bet is roughly your edge divided by the variance.

**How it sets buy-in levels.** For a given stake, the Kelly bankroll in big blinds is about (standard deviation per 100 hands)² ÷ (win rate per 100 hands).
- Example only: with a win rate of 5 big blinds per 100 hands and a standard deviation of 90, that is 90² ÷ 5 = 1,620 big blinds, about 16 buy-ins of 100 big blinds.
- Play the highest stake your bankroll covers, and move down if the bankroll falls below it.
- **Use your own numbers.** Have your actual win rate and standard deviation ready, because an interviewer who plays will ask.

**What you taught new members.** If asked, walk through it in four steps, each for the member's own risk level:
1. Estimate your win rate and standard deviation per 100 hands from your own results.
2. Kelly bankroll in big blinds ≈ standard deviation² ÷ win rate. Divide by 100 to get buy-ins.
3. Pick a fraction for your risk level: full Kelly is the most aggressive, half Kelly doubles the bankroll, a third of Kelly triples it.
4. Add a buffer if your win rate rests on few hands, and move down a stake whenever the bankroll falls below what that stake needs.
- Why the buffer matters for new players: after 20,000 hands, a standard deviation of 90 leaves a standard error on the win rate of 90 ÷ √200 ≈ 6.4 big blinds per 100, more than the win rate itself. Most new players cannot yet tell a winning record from luck.
- The same formula works for tournaments if the win rate is your average profit per tournament and the standard deviation is per tournament, both in buy-ins. Tournament swings are much larger, so the bankroll comes out bigger.

**"Why keep more than the Kelly bankroll?" (I kept at least 50 buy-ins myself.)**
- Your win rate is an estimate from a limited number of hands. Betting more than Kelly is far worse than betting less: at twice the Kelly amount, long-run growth falls to zero.
- Half Kelly keeps about three-quarters of the growth with half the swings.
- So you play a fraction of Kelly. In the example above, 50 buy-ins is about a third of Kelly.

**"Do you use Kelly to size your bets?"** "No. Within a hand I size bets from the range of hands my opponent is likely to hold, to get the most value from it. Kelly decides which stakes I play and how big a bankroll I need for them."

**"What did 12 tables at once teach you?"** A possible answer, to adapt to what you actually did: each decision gets a few seconds, so you rely on rules worked out in advance and review the hard spots afterwards. Over thousands of hands, results only show up as averages, which is why I judge decisions by expected value rather than by single outcomes.

## Other lines to be ready on

**"Variance fell 1,276-fold (ρ = 0.9996)."** Monte Carlo error falls with the square root of the number of paths. In the repo the control variate cuts the standard error from 0.02697 to 0.00076, about 2.8% of plain Monte Carlo, which would otherwise take about 1,300 times as many paths (the script prints 1276). The quick way to see it: the arithmetic and geometric payoffs have correlation ρ = 0.9996, and the control variate leaves a fraction 1 − ρ² of the variance, so the ratio is 1/(1 − ρ²) ≈ 1,300.

**"About 35 would pass by luck alone."** At the 5% level, 5% of tests reject by chance even when the CAPM is right, and 0.05 × 694 ≈ 35. Finding 215 says most alphas are real, but not which ones; that is why the next bullet applies stricter rules.

## The new twist in each project, in plain English

**Plains heat and the KC-Chicago wheat spread.** Kansas City wheat grows on the Plains and Chicago wheat grows further east, so a Kansas heatwave during grain fill should push KC up against Chicago. News that moves all wheat cancels out in the spread. I counted days reaching 34°C at six NOAA stations and regressed the weekly spread change on heat the week before, the same week and the week after, with July–August as a placebo. Heat explained 0.3% of the moves, with no lead or lag. A rule fixed in advance lost 3.2 cents a bushel a week out of sample, and it lost money before costs too. The big moves came from crop news such as the 2023 Kansas drought. I also found that the KC price file ran a day behind Chicago in 2009–2020, which would have produced a fake lead-lag signal.

**Where the control variate stops working.** A control variate subtracts the part of the arithmetic payoff that moves with the geometric payoff. The geometric payoff's price is known exactly, so only the leftover noise has to be simulated. In my base case that cuts the variance 1,276 times, so I mapped where it stops working that well. The leftover comes from the gap between the two averages, which depends on how much the price wanders during the year. That gap grows with volatility squared, while the payoff's spread grows only with volatility, so the gain falls roughly as 1/σ². Out of the money the payoff shrinks but the gap does not, so the gain falls again, to 52 at worst.

**How many anomalies survive multiple testing.** I tested whether the CAPM explains 694 anomaly portfolios: 13 themes in 54 countries. At 5%, 215 alphas were significant, but with 694 tests about 35 would pass by luck alone. So most are real, but which ones? I applied stricter rules. Benjamini-Hochberg allows about 5% of its picks to be false and keeps 123. The |t| > 3 hurdle from Harvey, Liu and Zhu keeps 84. Bonferroni allows only a 5% chance of even one false pick and keeps 22. Almost all survivors are positive, while flukes would split evenly by sign. Momentum holds up best. Size disappears, because its few hits are about what luck predicts.

**Band hedging instead of a timetable.** Textbook delta hedging rebalances on a timetable, say daily. I tested rebalancing only when the hedge has drifted a set amount from delta. A timetable wastes money: if the stock rises one day and falls back the next, it buys and then sells to end where it started. The band rule skips that and spends its trades where delta moves fastest, near the strike close to expiry. At low costs it gives less P&L spread for the same cost. The catch is that its number of trades depends on the path, so the cost bill itself becomes uncertain. On fresh paths the best band beats the best timetable by 6% at 0.1% costs, falling to 2% at 0.5%.

**If asked why you show a strategy that doesn't make money:** "I fixed the rule before testing it, so a null result is a real finding: the market prices Plains heat too quickly to trade on weekly data. Checking the data properly mattered more. The KC price file ran a day behind Chicago for twelve years, which would have given me a fake signal if I hadn't caught it."
