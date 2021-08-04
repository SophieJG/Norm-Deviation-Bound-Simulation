function [coeff] = leastSquares(design,response)
%leastSquares Computes the least squares coefficient for the simluation.
%   'response' must be a column vector. The number of columns of 'design'
%   should be the number of predictor variables; correspondingly, the
%   number of rows is the sample size.

coeff = ((transpose(design)*design)\transpose(design))*response;
disp(coeff)
end

