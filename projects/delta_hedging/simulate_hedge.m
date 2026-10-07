function [pnl, costPaid] = simulate_hedge(p, nSteps, sigmaReal, sigmaHedge, cost)
%SIMULATE_HEDGE Sell a call at p.sigmaImp and delta-hedge it nSteps times at sigmaHedge while the stock realises
% sigmaReal, paying cost per unit of value traded. Returns P&L and costs per path, in today's money.

dt = p.T / nSteps;
premium = bs_call(p.S0, p.K, p.T, p.r, p.sigmaImp);

S = p.S0 * ones(p.nPaths, 1);
[~, shares] = bs_call(S, p.K, p.T, p.r, sigmaHedge);
costPaid = cost * shares .* S;
cash = premium - shares .* S - costPaid;

for i = 1:nSteps
    z = randn(p.nPaths, 1);
    S = S .* exp((p.mu - 0.5 * sigmaReal^2) * dt + sigmaReal * sqrt(dt) * z);
    cash = cash * exp(p.r * dt);

    if i < nSteps
        [~, target] = bs_call(S, p.K, p.T - i * dt, p.r, sigmaHedge);
    else
        target = zeros(p.nPaths, 1);  % unwind the hedge at expiry
    end
    trade = target - shares;
    tradeCost = cost * abs(trade) .* S;
    cash = cash - trade .* S - tradeCost;
    costPaid = costPaid + exp(-p.r * i * dt) * tradeCost;
    shares = target;
end

payoff = max(S - p.K, 0);
pnl = exp(-p.r * p.T) * (cash - payoff);
end
