function [W, p] = grs_test(R, mkt)
%GRS_TEST Gibbons-Ross-Shanken (1989) test that the CAPM alphas of N portfolios are jointly
% zero. R is T-by-N excess returns over common months, mkt the market excess return.
[T, N] = size(R);
X = [ones(T, 1) mkt];
B = X \ R;
E = R - X * B;
alpha = B(1, :)';
% ML estimates (divide by T): with the (T-N-1)/N factor, W is exactly F(N, T-N-1) under normal errors
Sigma = E' * E / T;
W = (T - N - 1) / N * (alpha' * (Sigma \ alpha)) / (1 + mean(mkt)^2 / var(mkt, 1));

% W ~ F(N, T-N-1) under the null, and P(F > W) is a regularised incomplete beta function
p = betainc((T - N - 1) / (T - N - 1 + N * W), (T - N - 1) / 2, N / 2);
end
