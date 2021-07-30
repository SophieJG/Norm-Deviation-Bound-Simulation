function [scaledAvg] = scaledExpectedNormDeviationGeneral(m, p, numSamples, T)
% approximate the expected norm deviation and divide by complexity
% T is a set of k vectors in R^n, represented by an n x k matrix
    avg = expectedNormDeviation(m, p, numSamples, T);
    [n,k] = size(T);
    complexity = sqrt(log(n));
    scaledAvg = avg / complexity;
end

function [avg] = expectedNormDeviation(m, p, numSamples, T)
% approximate the expected norm deviation by the average devation of
% numSamples samples
    sum = 0;
    for i=1:numSamples
        sum = sum + maxNormDeviation(m, p, T);
    end
    avg = sum/numSamples;
end

function [max] = maxNormDeviation(m, p, T)
% generate an m x n matrix of scaled Bernoullis, and find the maximum norm
% deviation for each standard basis vector in R^n
    max = 0;
    [n, k] = size(T);
    bern = scaledBernoullis(m, n, p);
    for i = 1:k
        x = T(:, i);
        Ax = bern*x;
        normDeviation = abs(norm(Ax) - (sqrt(m)*norm(x)));
        if normDeviation > max
            max = normDeviation;
        end
    end
end
