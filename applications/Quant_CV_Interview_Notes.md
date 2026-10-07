# Quant CV: interview notes

Short explanations for the newest lines on the Quant CV, with the questions an interviewer is most likely to ask about each.

## Delta-Hedging Simulator

**In 30 seconds.** "I simulated selling a three-month call option and hedging it with shares, rebalancing at different frequencies, over 50,000 random stock paths. I measured three things: how the hedging error changes with how often you rebalance, what happens if you sell the option at the wrong volatility, and how trading costs change the best rebalancing frequency."

**What delta hedging is.** Selling a call loses money if the stock rises. Delta is how much the option's value moves for a £1 move in the stock. Holding delta shares per option sold cancels small moves, so the position no longer depends on the stock's direction.

**Why hedging isn't perfect.** Delta changes as the stock moves (that's gamma), but the hedge is only updated at set times. Between updates, a big move costs the option seller money and a quiet period earns them a little. On average these cancel, because the premium pays for them, but they leave noise in the P&L.

**"Why does hedging four times as often halve the error?"**
- Each interval leaves a random error whose size is proportional to the interval's length, T/N.
- There are N of these errors, and independent errors add up like the square root of their number. The total is √N × T/N = T/√N.
- Quadrupling N therefore halves the error. The simulation shows exactly that: 0.43 per option with daily hedging, 0.22 with hedging four times a day.

**"What happens if you sell at the wrong volatility?"** The option was sold at a price based on 20% volatility. Hedging it costs whatever the option is worth at the volatility the stock actually delivers. If the stock only moves at 15%, hedging costs about 3.37 against the 4.36 received, so the seller keeps about 0.99. That is the difference between the two Black-Scholes prices, and the simulation's average matches it.

**"Why is the profit steadier with the realised-volatility delta?"**
- Hedging with the delta at the true volatility replicates the option almost exactly, so the profit is fixed from the start.
- Hedging with the delta at the implied volatility earns the profit gradually through gamma. It earns more when the stock stays near the strike, so the result depends on the path.
- Desks still hedge at implied volatility, because nobody knows realised volatility in advance.

**"Why does a higher trading cost mean hedging less often?"** Hedging more often cuts the error, but each rebalance costs money, and the total traded grows with √N. The best frequency balances the two. It is daily to twice daily at 0.1% costs and weekly at 0.5%.

**"What are the model's limits?"** Volatility is constant, prices move smoothly with no jumps, costs are a fixed percentage of the value traded, and there is one option. Real markets have jumps and changing volatility, so real hedging errors are larger.

**"What would you do next?"** Name the extension you did yourself, for example hedging a put or changing the drift (see the project README).

## Kelly criterion for poker stakes

**What Kelly is.** It sizes each bet to maximise the long-run growth of your bankroll. For a small edge, the best fraction to bet is roughly your edge divided by the variance.

**How it sets buy-in levels.** For a given stake, the Kelly bankroll in big blinds is about (standard deviation per 100 hands)² ÷ (win rate per 100 hands).
- Example only: with a win rate of 5 big blinds per 100 hands and a standard deviation of 90, that is 90² ÷ 5 = 1,620 big blinds, about 16 buy-ins of 100 big blinds.
- Play the highest stake your bankroll covers, and move down if the bankroll falls below it.
- **Use your own numbers.** Have your actual win rate and standard deviation ready, because an interviewer who plays will ask.

**"Why 50 buy-ins and not full Kelly?"**
- Your win rate is an estimate from a limited number of hands. Betting more than Kelly is far worse than betting less: at twice the Kelly amount, long-run growth falls to zero.
- Half Kelly keeps about three-quarters of the growth with half the swings.
- So you play a fraction of Kelly. In the example above, 50 buy-ins is about a third of Kelly.

**"Do you use Kelly to size your bets?"** "No. Within a hand I size bets from the range of hands my opponent is likely to hold, to get the most value from it. Kelly decides which stakes I play and how big a bankroll I need for them."

## Other lines to be ready on

**"About 97% … equivalent to roughly 1,300 times as many plain Monte Carlo paths."** Monte Carlo error falls with the square root of the number of paths. Cutting the standard error to 2.76% of plain Monte Carlo would otherwise take (1/0.0276)² ≈ 1,300 times as many paths.

**"Over six times the rate expected by chance."** At the 5% significance level, 5% of tests reject by chance even when the CAPM is right. Rejecting for 32% of portfolios is about 6.4 times that.
