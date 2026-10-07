function [price, delta, vega] = bs_call(S, K, tau, r, sigma)
%BS_CALL Black-Scholes price, delta and vega of a European call, with tau the time to expiry in years.
% S or sigma may be vectors. vega is per 1.00 change in volatility, not per vol point.

d1 = (log(S ./ K) + (r + 0.5 * sigma.^2) .* tau) ./ (sigma .* sqrt(tau));
d2 = d1 - sigma .* sqrt(tau);

delta = norm_cdf(d1);
price = S .* delta - K .* exp(-r .* tau) .* norm_cdf(d2);
vega = S .* sqrt(tau) .* exp(-0.5 * d1.^2) / sqrt(2 * pi);
end

function p = norm_cdf(x)
% Standard normal CDF via erfc, so the Statistics Toolbox is not needed.
p = 0.5 * erfc(-x / sqrt(2));
end
