function [price, delta, gamma, vega] = bs_call(S, K, tau, r, sigma)
%BS_CALL Black-Scholes price and Greeks of a European call. Needs no toolboxes.
%   S may be a vector of spot prices; tau is the time to expiry in years.
%   vega is per 1.00 change in volatility (divide by 100 for per vol point).

d1 = (log(S ./ K) + (r + 0.5 * sigma.^2) .* tau) ./ (sigma .* sqrt(tau));
d2 = d1 - sigma .* sqrt(tau);
pdf1 = exp(-0.5 * d1.^2) / sqrt(2 * pi);

price = S .* norm_cdf(d1) - K .* exp(-r .* tau) .* norm_cdf(d2);
delta = norm_cdf(d1);
gamma = pdf1 ./ (S .* sigma .* sqrt(tau));
vega = S .* pdf1 .* sqrt(tau);
end

function p = norm_cdf(x)
% Standard normal CDF via erfc, so the Statistics Toolbox is not needed.
p = 0.5 * erfc(-x / sqrt(2));
end
