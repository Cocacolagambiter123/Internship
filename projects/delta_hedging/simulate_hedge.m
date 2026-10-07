function [pnl, costPaid, nHedges] = simulate_hedge(p, nSteps, sigmaReal, sigmaHedge, cost, band)
%SIMULATE_HEDGE Sell a call at p.sigmaImp and delta-hedge it at sigmaHedge over nSteps steps while the stock realises sigmaReal,
% paying cost per unit of value traded and trading only where the hedge is at least band (default 0) from delta. P&L and costs in today's money.

if nargin < 6, band = 0; end   % 0 rebalances at every step, as on a timetable
dt = p.T / nSteps;
premium = bs_call(p.S0, p.K, p.T, p.r, p.sigmaImp);

S = p.S0 * ones(p.nPaths, 1);
[~, shares] = bs_call(S, p.K, p.T, p.r, sigmaHedge);
costPaid = cost * shares .* S;
cash = premium - shares .* S - costPaid;
nHedges = ones(p.nPaths, 1);

for i = 1:nSteps
    z = randn(p.nPaths, 1);
    S = S .* exp((p.mu - 0.5 * sigmaReal^2) * dt + sigmaReal * sqrt(dt) * z);
    cash = cash * exp(p.r * dt);

    if i < nSteps
        [~, target] = bs_call(S, p.K, p.T - i * dt, p.r, sigmaHedge);
        inBand = abs(target - shares) < band;
        target(inBand) = shares(inBand);   % inside the band the hedge is left alone
        nHedges = nHedges + ~inBand;
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
