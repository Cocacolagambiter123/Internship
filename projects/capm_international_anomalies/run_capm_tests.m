%RUN_CAPM_TESTS Tests the CAPM on the JKP anomaly portfolios of every country: each theme is
% regressed on its own country's market excess return, then all themes of a country jointly (GRS).

minObs = 60;     % months needed for a regression, and common months needed for a GRS test
level = 0.05;

opts = {'Delimiter', ',', 'HeaderLines', 1};
fid = fopen(fullfile('data', '[all_countries]_[all_themes]_[monthly]_[vw_cap].csv'));
cols = textscan(fid, '%s %s %*s %*s %*s %s %f', opts{:});
fclose(fid);
[country, theme, monthEnd, ret] = cols{:};
fid = fopen(fullfile('data', '[all_countries]_[mkt]_[monthly]_[vw].csv'));
cols = textscan(fid, '%s %*s %*s %*s %*s %*s %*s %s %f', opts{:});
fclose(fid);
[mktCountry, mktMonthEnd, mktRet] = cols{:};

% Panel R(month, theme, country) and M(month, country), NaN where a return is missing.
% ISO dates sort chronologically and the US data cover every month, so row i is the i-th month.
[countries, ~, iCountry] = unique(country);
[themes, ~, iTheme] = unique(theme);
months = unique([monthEnd; mktMonthEnd]);
[~, iMonth] = ismember(monthEnd, months);
[~, iMktMonth] = ismember(mktMonthEnd, months);
[hasThemes, iMktCountry] = ismember(mktCountry, countries);
nThemes = numel(themes);
nCountries = numel(countries);
R = NaN(numel(months), nThemes, nCountries);
R(sub2ind(size(R), iMonth, iTheme, iCountry)) = ret;
M = NaN(numel(months), nCountries);
M(sub2ind(size(M), iMktMonth(hasThemes), iMktCountry(hasThemes))) = mktRet(hasThemes);

both = ~isnan(R) & ~isnan(reshape(M, [], 1, nCountries));
T = squeeze(sum(both, 1));
kept = T >= minObs;

mu = NaN(nThemes, nCountries);
alpha = mu;
beta = mu;
tOls = mu;
tNw = mu;
for k = find(kept)'
    [j, c] = ind2sub(size(kept), k);
    mu(k) = mean(R(both(:, j, c), j, c));
    [alpha(k), beta(k), tOls(k), tNw(k)] = capm_alpha(R(:, j, c), M(:, c));
end

% Two-sided p-value of a t(df) statistic: P(|t_df| > |t|) = I_{df/(df+t^2)}(df/2, 1/2)
tPval = @(t, df) betainc(df ./ (df + t.^2), df / 2, 0.5);
sigNw = false(size(kept));
sigNw(kept) = tPval(tNw(kept), T(kept) - 2) < level;
sigOls = false(size(kept));
sigOls(kept) = tPval(tOls(kept), T(kept) - 2) < level;

% GRS on the months where all of a country's kept themes and its market have returns
grsT = zeros(1, nCountries);
grsP = NaN(1, nCountries);
for c = find(any(kept))
    common = all(both(:, kept(:, c), c), 2);
    grsT(c) = nnz(common);
    if grsT(c) >= minObs
        [~, grsP(c)] = grs_test(R(common, kept(:, c), c), M(common, c));
    end
end
grsTested = ~isnan(grsP);
notRejected = grsTested & grsP >= level;

nPort = nnz(kept);
share = [nnz(sigNw) nnz(sigOls)] / nPort;
fprintf('%d country-theme portfolios in %d countries, at least %d months each\n', ...
        nPort, nnz(any(kept)), minObs);
fprintf('Alpha = 0 rejected at %g%%: Newey-West %.1f%%, OLS %.1f%% (%.1f and %.1f times chance)\n', ...
        100 * level, 100 * share, share / level);
fprintf('%d of the %d significant alphas are positive; %d of %d countries have at least one\n', ...
        nnz(alpha(sigNw) > 0), nnz(sigNw), nnz(any(sigNw)), nnz(any(kept)));
fprintf('GRS rejects at %g%% in %d of the %d countries with at least %d common months, not in\n', ...
        100 * level, nnz(grsP < level), nnz(grsTested), minObs);
list = [countries(notRejected)'; ...
        num2cell([sum(kept(:, notRejected)); grsT(notRejected); grsP(notRejected)])];
fprintf('  %s  %2d themes  %3d months  p = %.2f\n', list{:});

names = strrep(themes, '_', ' ');
nTested = sum(kept, 2);
[~, order] = sort(sum(sigNw, 2) ./ nTested, 'descend');
fprintf('\nCountries with a significant Newey-West alpha, by theme (medians across countries)\n');
fprintf('%-20s %6s %6s %9s %10s %6s\n', 'theme', 'tested', 'signif', 'mean p.a.', 'alpha p.a.', 'beta');
for j = order'
    fprintf('%-20s %6d %6d %8.1f%% %9.1f%% %6.2f\n', names{j}, nTested(j), nnz(sigNw(j, :)), ...
            1200 * median(mu(j, kept(j, :))), 1200 * median(alpha(j, kept(j, :))), ...
            median(beta(j, kept(j, :))));
end

z = sqrt(2) * erfcinv(level);   % two-sided normal critical value
fig = figure;
hold on;
for i = 1:nThemes
    t = tNw(order(i), kept(order(i), :));
    % spread each theme's countries vertically so the points do not overlap
    plot(t, i + linspace(-0.3, 0.3, numel(t)), 'o', 'Color', [0 0.45 0.74], 'MarkerSize', 4);
end
plot([-z -z], [0 nThemes + 1], 'k--', [z z], [0 nThemes + 1], 'k--');
set(gca, 'YDir', 'reverse', 'YTick', 1:nThemes, 'YTickLabel', names(order));
ylim([0.5 nThemes + 0.5]);
xlabel(sprintf('Newey-West t-statistic of alpha (dashed: normal +/-%.2f)', z));
title('CAPM alpha t-statistics, one point per country');
print(fig, 'alpha_tstats.png', '-dpng', '-r150');
