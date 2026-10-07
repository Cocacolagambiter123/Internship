function [euro, arith, geo] = simulate_payoffs(Z, S0, K, r, sigma, T)
% Discounted payoffs of a European, an arithmetic Asian and a geometric Asian call on the
% risk-neutral GBM paths driven by Z (one row per path, one column per averaging date).
dt = T / size(Z, 2);
% Exact GBM log-price at the dates, so there is no discretisation bias.
logS = log(S0) + cumsum((r - sigma^2 / 2) * dt + sigma * sqrt(dt) * Z, 2);
disc = exp(-r * T);
euro = disc * max(exp(logS(:, end)) - K, 0);
arith = disc * max(mean(exp(logS), 2) - K, 0);
geo = disc * max(exp(mean(logS, 2)) - K, 0);
end
