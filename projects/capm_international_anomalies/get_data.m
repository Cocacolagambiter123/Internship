%GET_DATA Downloads the Jensen-Kelly-Pedersen data used by run_capm_tests into data/: the anomaly
% theme returns (capped value weights) and the value-weighted market excess returns.
% unzip accepts a URL, in MATLAB and in Octave.

base = 'https://jkpfactors.s3.amazonaws.com/public/';
unzip([base '%5Ball_countries%5D_%5Ball_themes%5D_%5Bmonthly%5D_%5Bvw_cap%5D.zip'], 'data');
unzip([base '%5Ball_countries%5D_%5Bmkt%5D_%5Bmonthly%5D_%5Bvw%5D.zip'], 'data');
