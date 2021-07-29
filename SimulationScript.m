clc;

NUM_POINTS = 50;
RIGHT_ENDPOINT = 0.1;
SAMPLES = 1000;

% demonstrate that the upper bound Ksqrt(logK)*complexity is tight

% generate a vector of parameters for the Bernoullis
p = linspace(RIGHT_ENDPOINT/NUM_POINTS, RIGHT_ENDPOINT, NUM_POINTS);

KFn = @(x) 1/sqrt(x*log(1+1/x));
KsqrtlogKFn = @(x) KFn(x) * sqrt(log(KFn(x)));

% compute K*sqrt(log K) for each value of p
KsqrtlogK = arrayfun(KsqrtlogKFn, p);

% compute the expected max norm deviation for each value of p
deviationFn = @(x) scaledExpectedNormDeviation(ceil(KsqrtlogKFn(x)^2), x, SAMPLES);
deviation = arrayfun(deviationFn, p);

% plot the deviation and K*sqrt(log K) for reference

prefixEndpoint =  strrep(string(RIGHT_ENDPOINT), '.', ',');
prefix = NUM_POINTS + "_pts_" + SAMPLES + "_samples_" + prefixEndpoint + "_endpoint";

loglog(p, KsqrtlogK, "b", p, deviation, "g");
xlabel('p');
legend('c x K(p) x sqrt(log K(p))','Expected max norm deviation / complexity');
savefig(prefix + "_p_loglog.fig");

K = arrayfun(KFn, p);

loglog(K, KsqrtlogK, "b", K, deviation, "g");
xlabel('K');
legend('c x K x sqrt(log K)','Expected max norm deviation / complexity');
savefig(prefix + "_K_loglog.fig");