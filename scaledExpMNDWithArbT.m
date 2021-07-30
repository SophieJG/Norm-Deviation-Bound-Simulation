function [scaledAvg] = scaledExpMNDWithArbT(m, p, numSamples, T)
% approximate the expected norm deviation and divide by complexity
% T is a set of k vectors in R^n, represented by an n x k matrix
    avg = expectedNormDeviation(m, p, numSamples, T);
    complexity = computeComplexity(T, numSamples);
    scaledAvg = avg / complexity;
end

function [complexity] = computeComplexity(T, numSamples)
    sum = 0;
    for i=1:numSamples
        sum = sum + maxGaussianInnerProduct(T);
    end
    complexity = sum/numSamples;
end

function [maxDot] = maxGaussianInnerProduct(T)
    [n,k] = size(T);
    g = randn(n, 1);
    maxDot = 0;
    for i=1:k
        x = T(:,i);
        dot = abs(g'*x);
        if dot > maxDot
            maxDot = dot;
        end
    end
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

function [maxDev] = maxNormDeviation(m, p, T)
% generate an m x n matrix of scaled Bernoullis, and find the maximum norm
% deviation for each standard basis vector in R^n
    maxDev = 0;
    [n, k] = size(T);
    A = scaledBernoullis(m, n, p);
    for i = 1:k
        x = T(:, i);
        Ax = A*x;
        normDeviation = abs(norm(Ax) - (sqrt(m)*norm(x)));
        if normDeviation > maxDev
            maxDev = normDeviation;
        end
    end
end
