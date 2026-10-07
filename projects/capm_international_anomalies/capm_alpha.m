function [alpha, beta, tOls, tNw] = capm_alpha(y, mkt)
%CAPM_ALPHA Time-series CAPM regression y = alpha + beta*mkt + e over the months where both are
% present (NaN elsewhere). Returns the t-statistic of alpha with OLS and Newey-West standard errors.
ok = ~isnan(y) & ~isnan(mkt);
T = nnz(ok);
X = [ones(T, 1) mkt(ok)];
XXi = inv(X' * X);
b = X \ y(ok);
e = y(ok) - X * b;
alpha = b(1);
beta = b(2);
tOls = alpha / sqrt(e' * e / (T - 2) * XXi(1, 1));

% Newey-West: Bartlett weights 1 - lag/(L+1) on the autocovariances of x_t*e_t up to lag L.
% Missing months enter as zeros, so a lag counts calendar months even where the series has gaps.
L = floor(4 * (T / 100)^(2 / 9));
Xe = zeros(numel(y), 2);
Xe(ok, :) = X .* e;
S = Xe' * Xe;
for lag = 1:L
    G = Xe(lag + 1:end, :)' * Xe(1:end - lag, :);
    S = S + (1 - lag / (L + 1)) * (G + G');
end
V = XXi * S * XXi;
tNw = alpha / sqrt(V(1, 1));
end
