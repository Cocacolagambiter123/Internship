% Prices an arithmetic-average Asian call by Monte Carlo under risk-neutral GBM, comparing plain MC,
% antithetic variates and a geometric Asian control variate, with two closed forms as checks.

rng(1);

S0 = 100;
K = 100;
r = 0.05;
sigma = 0.2;
T = 1;
n = 12;            % monthly averaging dates t_i = i*dt, the last one at expiry
nPaths = 100000;   % per method; an antithetic pair counts as two paths
dt = T / n;
disc = exp(-r * T);

% S_T and the geometric average G are both lognormal, so Black's formula prices both calls.
bsPrice = black_call(S0 * exp(r * T), K, sigma^2 * T, disc);
% ln G = ln S0 + (r - sigma^2/2)*dt*(n+1)/2 + (sigma/n)*sum_i W(t_i), and
% Var(sum_i W(t_i)) = dt * sum_ij min(i,j) = dt * n(n+1)(2n+1)/6.
mG = log(S0) + (r - sigma^2 / 2) * dt * (n + 1) / 2;
vG = sigma^2 * dt * (n + 1) * (2 * n + 1) / (6 * n);
geoPrice = black_call(exp(mG + vG / 2), K, vG, disc);

[euro, arith, geo] = simulate_payoffs(randn(nPaths, n), S0, K, r, sigma, T);

nPairs = nPaths / 2;
Z = randn(nPairs, n);
[~, arithAV, geoAV] = simulate_payoffs([Z; -Z], S0, K, r, sigma, T);
arithAV = reshape(arithAV, nPairs, 2);   % row i: path i and its antithetic partner
geoAV = reshape(geoAV, nPairs, 2);
arithPair = mean(arithAV, 2);
geoPair = mean(geoAV, 2);

% b = cov(arith, geo) / var(geo), the least-squares slope of arith on geo; likewise for pair means.
b = (geo - mean(geo)) \ (arith - mean(arith));
bPair = (geoPair - mean(geoPair)) \ (arithPair - mean(arithPair));
% Control variate: subtract b times the error in the geometric payoff, whose mean geoPrice is known.
cv = arith - b * (geo - geoPrice);
cvPair = arithPair - bPair * (geoPair - geoPrice);

% The two paths in an antithetic pair are dependent, so the i.i.d. samples are the pair means.
stdErr = @(x) std(x) / sqrt(numel(x));
samples = {arith, arithPair, cv, cvPair};
names = {'plain', 'antithetic', 'control variate', 'control variate + antithetic'};
price = cellfun(@mean, samples);
se = cellfun(stdErr, samples);
varRatio = (se(1) ./ se).^2;

chkNames = {'European call', 'geometric Asian call'};
mc = [mean(euro), mean(geo)];
seChk = [stdErr(euro), stdErr(geo)];
exact = [bsPrice, geoPrice];
z = (mc - exact) ./ seChk;

R = corrcoef(arith, geo);
rho = R(1, 2);
% Pairing scales the variance per path by 1 + corr(partners), so it helps only when that corr < 0.
R = corrcoef(arithAV);
rhoPay = R(1, 2);
R = corrcoef(arithAV - bPair * geoAV);
rhoRes = R(1, 2);

fprintf('S0 = %g, K = %g, r = %g, sigma = %g, T = %g, %d averaging dates, %d paths\n\n', ...
        S0, K, r, sigma, T, n, nPaths);
fprintf('Closed-form checks\n');
fprintf('%-21s %8s %8s %12s %7s\n', 'option', 'MC', 'std err', 'closed form', 'z');
for i = 1:numel(chkNames)
    fprintf('%-21s %8.4f %8.4f %12.4f %7.2f\n', chkNames{i}, mc(i), seChk(i), exact(i), z(i));
end

fprintf('\nArithmetic Asian call\n');
fprintf('%-29s %8s %9s %15s\n', 'method', 'price', 'std err', 'variance ratio');
for i = 1:numel(names)
    fprintf('%-29s %8.4f %9.5f %15.0f\n', names{i}, price(i), se(i), varRatio(i));
end
fprintf('\nb = %.4f (single paths), %.4f (antithetic pairs)\n', b, bPair);
fprintf('corr(arithmetic payoff, geometric payoff) = %.6f\n', rho);
fprintf('corr between antithetic partners: payoff %.3f, control-variate residual %.3f\n', ...
        rhoPay, rhoRes);

idx = 1:2000;
xLine = [0, max(geo(idx))];
fig = figure;
plot(geo(idx), arith(idx), '.', xLine, mean(arith) + b * (xLine - mean(geo)), '-');
xlabel('Discounted geometric Asian payoff');
ylabel('Discounted arithmetic Asian payoff');
legend('simulated paths (first 2,000)', sprintf('least-squares line, slope b = %.3f', b), ...
       'Location', 'northwest');
title(sprintf('Payoffs on the same path: correlation %.4f', rho));
grid on;
print(fig, 'payoff_scatter.png', '-dpng', '-r150');
