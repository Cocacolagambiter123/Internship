%RUN_EXPERIMENTS Delta-hedging a short call: how rebalancing frequency, a wrong volatility
% and trading costs change the profit and loss. Prints three tables and saves four figures
% in the figures folder. Runs in base MATLAB (no toolboxes) and in GNU Octave.

rng(1);  % same random numbers on every run

p = struct();
p.S0 = 100;          % stock price
p.K = 100;           % strike (at the money)
p.T = 0.25;          % three months to expiry
p.r = 0.03;          % risk-free rate
p.mu = 0.08;         % real-world drift of the stock; the delta hedge removes almost all of its effect
p.sigmaImp = 0.20;   % implied volatility the call is sold at
nPaths = 50000;

steps = [6 13 26 63 126 252];   % hedges over three months, fortnightly to four times a day
labels = {'fortnightly', 'weekly', 'twice weekly', 'daily', 'twice daily', '4x daily'};
daily = 4;                      % index of daily hedging in steps
stepTicks = arrayfun(@(n) sprintf('%d', n), steps, 'UniformOutput', false);
plain = {'Interpreter', 'none'};  % so "P&L" prints literally in plot text

figDir = fullfile(fileparts(mfilename('fullpath')), 'figures');
if ~exist(figDir, 'dir')
    mkdir(figDir);
end

[premium, ~, ~, vega] = bs_call(p.S0, p.K, p.T, p.r, p.sigmaImp);
fprintf('Short one call: S0 = %g, K = %g, T = %g years, r = %g%%, implied vol %g%%\n', ...
        p.S0, p.K, p.T, 100 * p.r, 100 * p.sigmaImp);
fprintf('Premium %.3f, vega %.2f, %d paths\n\n', premium, vega, nPaths);

%% 1. Hedging error against rebalancing frequency (realised vol = implied vol, no costs)
pnlByFreq = cell(size(steps));
sd = zeros(size(steps));
for j = 1:numel(steps)
    pnlByFreq{j} = simulate_hedge(p, steps(j), p.sigmaImp, p.sigmaImp, 0, nPaths);
    sd(j) = std(pnlByFreq{j});
end
approx = sqrt(pi / 4) * p.sigmaImp * vega ./ sqrt(steps);   % Derman-Kamal approximation
logFit = polyfit(log(steps), log(sd), 1);

fprintf('1. Hedging error against rebalancing frequency (no trading costs)\n');
fprintf('%14s %7s %10s %10s %15s\n', 'frequency', 'hedges', 'mean P&L', 'std P&L', 'approximation');
for j = 1:numel(steps)
    fprintf('%14s %7d %10.3f %10.3f %15.3f\n', labels{j}, steps(j), mean(pnlByFreq{j}), sd(j), approx(j));
end
skew = @(x) mean(((x - mean(x)) / std(x)).^3);
fprintf('Slope of log(std) on log(hedges): %.3f (theory: -0.5)\n', logFit(1));
fprintf('Skewness of P&L: weekly %.2f, daily %.2f\n\n', skew(pnlByFreq{2}), skew(pnlByFreq{daily}));

centers = -5:0.1:5;   % values beyond the range land in the end bins, which fall outside the axes
fig = figure;
plot(centers, hist(pnlByFreq{2}, centers) / (nPaths * 0.1), ...
     centers, hist(pnlByFreq{daily}, centers) / (nPaths * 0.1), 'LineWidth', 1.5);
xlim([-4 4]);
xlabel('Hedged P&L per option', plain{:});
ylabel('Density');
legend('weekly', 'daily');
title('P&L of a delta-hedged short call', plain{:});
grid on;
print(fig, fullfile(figDir, 'pnl_distribution.png'), '-dpng', '-r150');

fig = figure;
loglog(steps, sd, 'o-', steps, approx, '--', 'LineWidth', 1.5);
set(gca, 'XTick', steps, 'XTickLabel', stepTicks, 'YTick', [0.2 0.5 1 2], 'YTickLabel', {'0.2', '0.5', '1', '2'});
ylim([0.15 2]);
xlabel('Hedges until expiry');
ylabel('Standard deviation of P&L', plain{:});
legend('simulation', 'Derman-Kamal: sqrt(\pi/4) \sigma vega / sqrt(N)', 'Location', 'southwest');
title(sprintf('Hedging error against number of hedges: fitted slope %.2f', logFit(1)));
grid on;
print(fig, fullfile(figDir, 'hedging_error_vs_frequency.png'), '-dpng', '-r150');

%% 2. Selling at the wrong volatility (daily hedging, no costs)
realVols = 0.10:0.05:0.30;
theory = zeros(size(realVols));
meanImp = theory; sdImp = theory; meanReal = theory; sdReal = theory;
for j = 1:numel(realVols)
    theory(j) = premium - bs_call(p.S0, p.K, p.T, p.r, realVols(j));
    pnl = simulate_hedge(p, steps(daily), realVols(j), p.sigmaImp, 0, nPaths);   % delta at implied vol
    meanImp(j) = mean(pnl); sdImp(j) = std(pnl);
    pnl = simulate_hedge(p, steps(daily), realVols(j), realVols(j), 0, nPaths);  % delta at realised vol
    meanReal(j) = mean(pnl); sdReal(j) = std(pnl);
end

fprintf('2. Call sold at %g%% implied vol, stock realises a different vol (daily hedging)\n', 100 * p.sigmaImp);
fprintf('%9s %20s %22s %22s\n', '', 'theory', 'delta at implied vol', 'delta at realised vol');
fprintf('%9s %20s %11s %10s %11s %10s\n', 'realised', 'C(implied)-C(real)', 'mean', 'std', 'mean', 'std');
for j = 1:numel(realVols)
    fprintf('%8.0f%% %20.3f %11.3f %10.3f %11.3f %10.3f\n', 100 * realVols(j), theory(j), ...
            meanImp(j), sdImp(j), meanReal(j), sdReal(j));
end
fprintf('\n');

volGrid = linspace(0.08, 0.32, 100);
fig = figure;
plot(100 * volGrid, premium - bs_call(p.S0, p.K, p.T, p.r, volGrid), 'k-', 'LineWidth', 1);
hold on;
h = [errorbar(100 * realVols - 0.4, meanImp, sdImp, 'o'), errorbar(100 * realVols + 0.4, meanReal, sdReal, 's')];
set(h, 'LineWidth', 1.2);
hold off;
xlabel('Realised volatility (%)');
ylabel('Hedged P&L per option (mean +/- 1 std)', plain{:});
legend('C(implied) - C(realised)', 'delta at implied vol', 'delta at realised vol');
title(sprintf('Call sold at %g%% implied volatility, hedged daily', 100 * p.sigmaImp));
grid on;
print(fig, fullfile(figDir, 'volatility_mismatch.png'), '-dpng', '-r150');

%% 3. Trading costs against hedging error (realised vol = implied vol)
costs = [0 0.001 0.002 0.005];    % proportional cost per trade, as a fraction of value traded
rmsPnl = zeros(numel(costs), numel(steps));
avgCost = rmsPnl;
for i = 1:numel(costs)
    for j = 1:numel(steps)
        [pnl, paid] = simulate_hedge(p, steps(j), p.sigmaImp, p.sigmaImp, costs(i), nPaths);
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

legendText = cell(1, numel(costs));
for i = 1:numel(costs)
    legendText{i} = sprintf('cost %.1f%%', 100 * costs(i));
end
fig = figure;
semilogx(steps, rmsPnl', 'o-', 'LineWidth', 1.5);
set(gca, 'XTick', steps, 'XTickLabel', stepTicks);
xlabel('Hedges until expiry');
ylabel('Root-mean-square P&L per option', plain{:});
legend(legendText, 'Location', 'north');
title('Hedging more often cuts risk but costs more');
grid on;
print(fig, fullfile(figDir, 'costs_vs_frequency.png'), '-dpng', '-r150');
