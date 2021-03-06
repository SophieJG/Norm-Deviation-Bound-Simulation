function [scaledAvg] = scaledMeanMNDWithStandardBasis(m, p, numSamples)
% approximate the expected norm deviation and divide by complexity
    n = ceil(1/p);
    avg = meanMaxNormDeviation(m, n, p, numSamples);
    complexity = sqrt(log(n));
    scaledAvg = avg / complexity;
end

function [avg] = meanMaxNormDeviation(m, n, p, numSamples)
% approximate the expected norm deviation by the average deviation of
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
        bern = scaledBernoullis(m, 1, p);
        normDeviation = abs(norm(bern) - sqrt(m));
        if normDeviation > max
            max = normDeviation;
        end
    end
end

