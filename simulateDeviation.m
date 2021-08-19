function simulateDeviation(numPoints, rightEndpoint, samples, resultFileName, useCustomSet, customSetFile)
    % simulate the norm deviation
    [p, K, KsqrtlogK, MND] = generateData(numPoints, rightEndpoint, samples, useCustomSet, customSetFile);

    % save the data
    save("data/" + resultFileName, 'p', 'K', 'KsqrtlogK', 'MND');
    
    % plot the data
    plotData(p, K, KsqrtlogK, MND, numPoints, rightEndpoint, samples);
end

function [p, K, KsqrtlogK, MND] = generateData(numPoints, rightEndpoint, samples, useCustomSet, customSetFile)
    % generate a vector of parameters for the Bernoullis
    p = linspace(rightEndpoint/numPoints, rightEndpoint, numPoints);

    KFn = @(x) 1/sqrt(x*log(1+(1/x)));
    KsqrtlogKFn = @(x) KFn(x) * sqrt(log(KFn(x)));

    K = arrayfun(KFn, p);

    % compute K*sqrt(log K) for each value of p
    KsqrtlogK = arrayfun(KsqrtlogKFn, p);

    % sample a mean max norm deviation for each value of p and divide by
    % complexity
    if useCustomSet
        load(customSetFile, 'T');
        MNDFn = @(x) scaledMeanMNDWithArbT(ceil(KsqrtlogKFn(x)^2), x, samples, T);
    else
        MNDFn = @(x) scaledMeanMNDWithStandardBasis(ceil(KsqrtlogKFn(x)^2), x, samples);
    end
    MND = arrayfun(MNDFn, p); 
end

function plotData(p, K, KsqrtlogK, MND, numPoints, rightEndpoint, samples)
    % plot MND and K*sqrt(log K) for reference
    prefixEndpoint =  strrep(string(rightEndpoint), '.', ',');
    prefix = numPoints + "_pts_" + samples + "_samples_" + prefixEndpoint + "_endpoint";

    generatePlots(p, K, KsqrtlogK, MND, prefix, true);
end