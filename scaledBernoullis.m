function [scaledBernoulliMatrix] = scaledBernoullis(m,n, p)
% generate an m x n matrix of scaled Bernoulli(p) random variables
    scaledBernoulliMatrix = arrayfun(@(u) singleBernoulli(u, p), rand(m,n));
end

function [b] = singleBernoulli(u, p)
% convert a Uniform random variable to a scaled Bernoulli random variable
    if (u >= 0) && (u < 1-p)
        b = 0;
    else
        b = 1/sqrt(p);
    end
end