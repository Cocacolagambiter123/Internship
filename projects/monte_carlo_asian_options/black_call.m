function price = black_call(F, K, v, disc)
% Black's formula: call on a lognormal underlying with forward F and log-variance v,
% discounted by the factor disc. Normal CDF via erfc, so no toolbox is needed.
d1 = (log(F / K) + v / 2) / sqrt(v);
d2 = d1 - sqrt(v);
Phi = @(x) 0.5 * erfc(-x / sqrt(2));
price = disc * (F * Phi(d1) - K * Phi(d2));
end
