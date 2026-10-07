% Maps how much the geometric control variate gains over plain Monte Carlo for the arithmetic Asian
% call as volatility and strike change, using the same paths in every cell.

rng(1);

S0 = 100;
r = 0.05;
T = 1;
n = 12;
nPaths = 100000;
sigmas = 0.1:0.1:0.8;
strikes = 80:10:130;

% The same draws as run_pricing, so the sigma = 20%, K = 100 cell repeats its variance ratio.
Z = randn(nPaths, n);
sdArith = NaN(numel(sigmas), numel(strikes));
sdRes = NaN(size(sdArith));
kink = NaN(size(sdArith));
gap = zeros(numel(sigmas), 1);
for i = 1:numel(sigmas)
    % With a zero strike the payoffs are the discounted averages A and G themselves.
    [~, A, G] = simulate_payoffs(Z, S0, 0, r, sigmas(i), T);
    gap(i) = mean(A ./ G) - 1;
    for j = 1:numel(strikes)
        [~, arith, geo] = simulate_payoffs(Z, S0, strikes(j), r, sigmas(i), T);
        pays = arith > 0;
        % A variance estimated from fewer than 100 paying paths is too noisy to report.
        if sum(pays) >= 100
            b = (geo - mean(geo)) \ (arith - mean(arith));
            % The residual is what the control variate leaves: the arithmetic payoff minus its
            % least-squares fit on the geometric payoff.
            res = (arith - mean(arith)) - b * (geo - mean(geo));
            sdArith(i, j) = std(arith);
            sdRes(i, j) = std(res);
            % Share of the residual variance on paths where only the arithmetic call pays (A > K >= G).
            kink(i, j) = sum(res(pays & geo == 0) .^ 2) / sum(res .^ 2);
        end
    end
end
% The control-variate estimator has variance var(res) per path, so this is the variance ratio.
ratio = (sdArith ./ sdRes) .^ 2;

fprintf('S0 = %g, r = %g, T = %g, %d averaging dates, %d paths per cell\n\n', S0, r, T, n, nPaths);
fprintf('Variance ratio of the control variate (rows: sigma, columns: strike)\n');
fprintf('%5s %s %14s\n', 'sigma', sprintf('%7d', strikes), 'mean A/G - 1');
for i = 1:numel(sigmas)
    fprintf('%4.0f%% %s %13.2f%%\n', 100 * sigmas(i), sprintf('%7.0f', ratio(i, :)), 100 * gap(i));
end

fprintf('\nStandard deviation of the arithmetic payoff\n');
fprintf('%5s %s\n', 'sigma', sprintf('%7d', strikes));
for i = 1:numel(sigmas)
    fprintf('%4.0f%% %s\n', 100 * sigmas(i), sprintf('%7.2f', sdArith(i, :)));
end

fprintf('\nStandard deviation of the residual\n');
fprintf('%5s %s\n', 'sigma', sprintf('%7d', strikes));
for i = 1:numel(sigmas)
    fprintf('%4.0f%% %s\n', 100 * sigmas(i), sprintf('%7.3f', sdRes(i, :)));
end

fprintf('\nLargest share of residual variance from paths where only the arithmetic call pays: %.1f%%\n', ...
        100 * max(kink(:)));
