%RUN_EXPERIMENTS Delta-hedging a short call: how rebalancing frequency, a wrong volatility, trading costs and rebalancing
% on a band instead of a timetable change the profit and loss. Prints the results and saves two figures in the figures folder.

p = struct();
p.S0 = 100;
p.K = 100;
p.T = 0.25;          % three months to expiry
p.r = 0.03;
p.mu = 0.08;         % real-world drift: hedging at the realised vol cancels it, hedging at another vol does not
p.sigmaImp = 0.20;   % implied volatility the call is sold at
p.nPaths = 50000;

steps = [6 13 26 39 63 126 252];   % hedges over three months, fortnightly to four times a day
labels = {'fortnightly', 'weekly', 'twice weekly', '3x weekly', 'daily', 'twice daily', '4x daily'};

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
sdPnl = rmsPnl;
for i = 1:numel(costs)
    for j = 1:numel(steps)
        rng(1);
        [pnl, paid] = simulate_hedge(p, steps(j), p.sigmaImp, p.sigmaImp, costs(i));
        rmsPnl(i, j) = sqrt(mean(pnl.^2));   % combines the average cost and the spread
        avgCost(i, j) = mean(paid);
        sdPnl(i, j) = std(pnl);
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

%% 4. Hedging when the position needs it instead of on a timetable (realised vol = implied vol)
% The hedge is checked four times a day but traded back to delta only when it is at least the band away from it.
% Same stock paths as 4x daily hedging, which is the case band = 0. The bands were fixed before any results.
bands = [0.01 0.02 0.04 0.08 0.16 0.32];   % in shares per option, i.e. units of delta
nChecks = 252;
bandCost = zeros(numel(costs), numel(bands));
bandSd = bandCost;
bandRms = bandCost;
bandHedges = zeros(size(bands));
for i = 1:numel(costs)
    for j = 1:numel(bands)
        rng(1);
        [pnl, paid, nHedges] = simulate_hedge(p, nChecks, p.sigmaImp, p.sigmaImp, costs(i), bands(j));
        bandCost(i, j) = mean(paid);
        bandSd(i, j) = std(pnl);
        bandRms(i, j) = sqrt(mean(pnl.^2));
        bandHedges(j) = mean(nHedges);   % the same at every cost level: costs do not change the trades
    end
end

fprintf('\n4. Average cost and std of P&L, hedging on a timetable or only when the hedge is a band away from delta\n');
fprintf('%32s', 'no cost');
fprintf('%14.1f%%', 100 * costs(2:end));
fprintf('\n%14s %7s %9s', 'rule', 'hedges', 'std');
fprintf('%8s %6s', 'cost', 'std', 'cost', 'std', 'cost', 'std');
fprintf('\n');
for j = 1:numel(steps)
    fprintf('%14s %7d %9.3f', labels{j}, steps(j), sdPnl(1, j));
    fprintf('%8.3f %6.3f', [avgCost(2:end, j) sdPnl(2:end, j)]');
    fprintf('\n');
end
for j = 1:numel(bands)
    fprintf('%14s %7.1f %9.3f', sprintf('band %.2f', bands(j)), bandHedges(j), bandSd(1, j));
    fprintf('%8.3f %6.3f', [bandCost(2:end, j) bandSd(2:end, j)]');
    fprintf('\n');
end

% The best band and the best timetable are picked on the paths above, so both are re-scored on fresh paths.
fprintf('\nLowest RMS P&L with a band and on a timetable, on the paths above and on fresh paths\n');
fprintf('%6s %6s %7s %7s %14s %7s %7s %8s %7s\n', 'cost', 'band', 'RMS', 'fresh', 'timetable', 'RMS', 'fresh', 'gain', 'fresh');
for i = 2:numel(costs)
    [bandBest, b] = min(bandRms(i, :));
    [timeBest, t] = min(rmsPnl(i, :));
    rng(2);
    pnl = simulate_hedge(p, nChecks, p.sigmaImp, p.sigmaImp, costs(i), bands(b));
    bandFresh = sqrt(mean(pnl.^2));
    rng(2);
    pnl = simulate_hedge(p, steps(t), p.sigmaImp, p.sigmaImp, costs(i));
    timeFresh = sqrt(mean(pnl.^2));
    fprintf('%5.1f%% %6.2f %7.3f %7.3f %14s %7.3f %7.3f %7.1f%% %6.1f%%\n', 100 * costs(i), bands(b), bandBest, bandFresh, ...
            labels{t}, timeBest, timeFresh, 100 * (1 - bandBest / timeBest), 100 * (1 - bandFresh / timeFresh));
end

fig = figure('Position', [100 100 1200 400]);
for i = 2:numel(costs)
    subplot(1, numel(costs) - 1, i - 1);
    plot(avgCost(i, :), sdPnl(i, :), 'o-', bandCost(i, :), bandSd(i, :), 's-', 'LineWidth', 1.5);
    xlabel('Average trading cost per option');
    ylabel('Std of P&L per option', 'Interpreter', 'none');
    title(sprintf('Cost %.1f%% of value traded', 100 * costs(i)));
    grid on;
end
legend('timetable', 'band', 'Location', 'northeast');
print(fig, fullfile('figures', 'band_vs_timetable.png'), '-dpng', '-r150');
