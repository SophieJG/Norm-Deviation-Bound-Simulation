clc;

NUM_POINTS = 100;
RIGHT_ENDPOINT = 0.1;
SAMPLES = 100;

% demonstrate that the upper bound Ksqrt(logK)*complexity is tight

% generate a vector of parameters for the Bernoullis
p = linspace(RIGHT_ENDPOINT/NUM_POINTS, RIGHT_ENDPOINT, NUM_POINTS);

KFn = @(x) 1/sqrt(x*log(1+1/x));
KsqrtlogKFn = @(x) KFn(x) * sqrt(log(KFn(x)));

K = arrayfun(KFn, p);

% compute K*sqrt(log K) for each value of p
KsqrtlogK = arrayfun(KsqrtlogKFn, p);

% sample a mean max norm deviation for each value of p and divide by
% complexity
deviationFn = @(x) scaledMeanMNDWithStandardBasis(ceil(KsqrtlogKFn(x)^2), x, SAMPLES);
deviation = arrayfun(deviationFn, p);

T = table(p.',K.', KsqrtlogK.', deviation.', 'VariableNames', {'p','K','KsqrtlogK','MND'});
writetable(T, 'defaultSimulationData.csv');

% Compute least squares constant
scale = leastSquares(transpose(KsqrtlogK), transpose(deviation));

% plot the deviation and K*sqrt(log K) for reference

prefixEndpoint =  strrep(string(RIGHT_ENDPOINT), '.', ',');
prefix = NUM_POINTS + "_pts_" + SAMPLES + "_samples_" + prefixEndpoint + "_endpoint";

generatePlots(p, K, scale*KsqrtlogK, deviation, prefix, true);