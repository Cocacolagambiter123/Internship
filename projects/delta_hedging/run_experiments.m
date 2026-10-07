%RUN_EXPERIMENTS Delta-hedging a short call: how rebalancing frequency, a wrong volatility and trading
% costs change the profit and loss. Prints three tables and saves one figure in the figures folder.

p = struct();
p.S0 = 100;
p.K = 100;
p.T = 0.25;          % three months to expiry
p.r = 0.03;
p.mu = 0.08;         % real-world drift: hedging at the realised vol cancels it, hedging at another vol does not
p.sigmaImp = 0.20;   % implied volatility the call is sold at
p.nPaths = 50000;

steps = [6 13 26 63 126 252];   % hedges over three months, fortnightly to four times a day
labels = {'fortnightly', 'weekly', 'twice weekly', 'daily', 'twice daily', '4x daily'};

[premium, ~, vega] = bs_call(p.S0, p.K, p.T, p.r, p.sigmaImp);
fprintf('Premium %.3f, vega %.2f, %d paths\n\n', premium, vega, p.nPaths);

%% 1. Hedging error against rebalancing frequency (realised vol = implied vol, no costs)
% Every simulation restarts the generator from the same seed, so strategies with the same number of
% hedges are compared on the same stock paths and their differences are not simulation noise.
skew = @(x) mean(((x - mean(x)) / std(x)).^3);
avg = zeros(size(steps));
sd = avg;
sk = avg;
for j = 1:numel(steps)
    rng(1);
    pnl = simulate_hedge(p, steps(j), p.sigmaImp, p.sigmaImp, 0);
    avg(j) = mean(pnl);
    sd(j) = std(pnl);
    sk(j) = skew(pnl);
end
approx = sqrt(pi / 4) * p.sigmaImp * vega ./ sqrt(steps);   % Derman-Kamal approximation
logFit = polyfit(log(steps), log(sd), 1);

fprintf('1. Hedging error against rebalancing frequency (no trading costs)\n');
fprintf('%14s %7s %10s %10s %15s %10s\n', 'frequency', 'hedges', 'mean P&L', 'std P&L', 'Derman-Kamal', 'skewness');
for j = 1:numel(steps)
    fprintf('%14s %7d %10.3f %10.3f %15.3f %10.2f\n', labels{j}, steps(j), avg(j), sd(j), approx(j), sk(j));
end
fprintf('Slope of log(std) on log(hedges): %.3f (theory: -0.5)\n\n', logFit(1));

%% 2. Selling at the wrong volatility (daily hedging, no costs)
realVols = 0.10:0.05:0.30;
nDaily = 63;
priceGap = premium - bs_call(p.S0, p.K, p.T, p.r, realVols);
meanImp = zeros(size(realVols));
sdImp = meanImp;
meanReal = meanImp;
sdReal = meanImp;
for j = 1:numel(realVols)
    rng(1);
    pnl = simulate_hedge(p, nDaily, realVols(j), p.sigmaImp, 0);
    meanImp(j) = mean(pnl);
    sdImp(j) = std(pnl);
    rng(1);
    pnl = simulate_hedge(p, nDaily, realVols(j), realVols(j), 0);
    meanReal(j) = mean(pnl);
    sdReal(j) = std(pnl);
end

fprintf('2. Call sold at %g%% implied vol, stock realises a different vol (daily hedging)\n', 100 * p.sigmaImp);
fprintf('%9s %20s %22s %22s\n', '', 'price gap', 'delta at implied vol', 'delta at realised vol');
fprintf('%9s %20s %11s %10s %11s %10s\n', 'realised', 'C(implied)-C(real)', 'mean', 'std', 'mean', 'std');
for j = 1:numel(realVols)
    fprintf('%8.0f%% %20.3f %11.3f %10.3f %11.3f %10.3f\n', ...
            100 * realVols(j), priceGap(j), meanImp(j), sdImp(j), meanReal(j), sdReal(j));
end
fprintf('\n');

%% 3. Trading costs against hedging error (realised vol = implied vol)
costs = [0 0.001 0.002 0.005];    % proportional cost per trade, as a fraction of value traded
rmsPnl = zeros(numel(costs), numel(steps));
avgCost = rmsPnl;
for i = 1:numel(costs)
    for j = 1:numel(steps)
        rng(1);
        [pnl, paid] = simulate_hedge(p, steps(j), p.sigmaImp, p.sigmaImp, costs(i));
        rmsPnl(i, j) = sqrt(mean(pnl.^2));   % combines the average cost and the spread
        avgCost(i, j) = mean(paid);
    end
end

fprintf('3. Root-mean-square P&L by hedging frequency and trading cost (lower is better)\n');
fprintf('%14s', 'frequency');
fprintf('%11.1f%%', 100 * costs);
fprintf('\n');
for j = 1:numel(steps)
    fprintf('%14s', labels{j});
    fprintf('%12.3f', rmsPnl(:, j));
    fprintf('\n');
end
for i = 2:numel(costs)
    [~, best] = min(rmsPnl(i, :));
    fprintf('Cost %.1f%%: best to hedge %s (%d hedges), average cost paid %.3f\n', ...
            100 * costs(i), labels{best}, steps(best), avgCost(i, best));
end

if ~exist('figures', 'dir'), mkdir('figures'); end
fig = figure;
semilogx(steps, rmsPnl', 'o-', 'LineWidth', 1.5);
set(gca, 'XTick', steps, 'XTickLabel', arrayfun(@num2str, steps, 'UniformOutput', false));
xlabel('Hedges until expiry');
ylabel('Root-mean-square P&L per option', 'Interpreter', 'none');   % Octave's gnuplot output drops the & otherwise
legend(arrayfun(@(c) sprintf('cost %.1f%%', 100 * c), costs, 'UniformOutput', false), 'Location', 'north');
title('Hedging more often cuts risk but costs more');
grid on;
print(fig, fullfile('figures', 'costs_vs_frequency.png'), '-dpng', '-r150');
