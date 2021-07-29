function [scaledAvg] = scaledExpectedNormDeviation(m, p, numSamples)
% approximate the expected norm deviation and divide by complexity
    n = floor(2/p);
    avg = expectedNormDeviation(m, n, p, numSamples);
    complexity = sqrt(log(n));
    scaledAvg = avg / complexity;
end

function [avg] = expectedNormDeviation(m, n, p, numSamples)
% approximate the expected norm deviation by the average devation of
% numSamples samples
    sum = 0;
    for i=1:numSamples
        sum = sum + maxNormDeviation(m, n, p);
    end
    avg = sum/numSamples;
end

function [max] = maxNormDeviation(m, n, p)
% generate an m x n matrix of scaled Bernoullis, and find the maximum norm
% deviation for each standard basis vector in R^n
    max = 0;
    for i = 1:n
        bern = scaledBernoullis(m, p);
        normDeviation = abs(norm(bern) - sqrt(m));
        if normDeviation > max
            max = normDeviation;
        end
    end
end

