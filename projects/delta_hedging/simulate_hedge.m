function [pnl, costPaid] = simulate_hedge(p, nSteps, sigmaReal, sigmaHedge, cost, nPaths)
%SIMULATE_HEDGE Sell one call at implied volatility and delta-hedge it until expiry.
%   p           struct with S0, K, T, r, mu (real-world drift) and sigmaImp
%   nSteps      number of equal hedging intervals until expiry
%   sigmaReal   volatility the stock actually realises (GBM)
%   sigmaHedge  volatility used to compute the hedge delta
%   cost        proportional trading cost, as a fraction of the value traded
%   nPaths      number of simulated paths
%
%   pnl         hedged profit and loss per path, in today's money
%   costPaid    trading costs paid per path, in today's money
%
%   The call is sold for its Black-Scholes price at p.sigmaImp. The hedge is set
%   at the start, rebalanced at the end of every interval and unwound at expiry,
%   when the call's payoff is paid. Cash earns the risk-free rate throughout.

dt = p.T / nSteps;
premium = bs_call(p.S0, p.K, p.T, p.r, p.sigmaImp);

S = p.S0 * ones(nPaths, 1);
[~, shares] = bs_call(S, p.K, p.T, p.r, sigmaHedge);
costPaid = cost * shares .* S;
cash = premium - shares .* S - costPaid;

for i = 1:nSteps
    z = randn(nPaths, 1);
    S = S .* exp((p.mu - 0.5 * sigmaReal^2) * dt + sigmaReal * sqrt(dt) * z);
    cash = cash * exp(p.r * dt);
    costPaid = costPaid * exp(p.r * dt);

    if i < nSteps
        [~, target] = bs_call(S, p.K, p.T - i * dt, p.r, sigmaHedge);
    else
        target = zeros(nPaths, 1);  % unwind the hedge at expiry
    end
    trade = target - shares;
    tradeCost = cost * abs(trade) .* S;
    cash = cash - trade .* S - tradeCost;
    costPaid = costPaid + tradeCost;
    shares = target;
end

payoff = max(S - p.K, 0);
pnl = exp(-p.r * p.T) * (cash - payoff);
costPaid = exp(-p.r * p.T) * costPaid;
end
