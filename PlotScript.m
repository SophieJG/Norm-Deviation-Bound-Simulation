clc;

FILE_NAME = 'simulationPlot';
DATA_FILE = 'Regression/simulationData.csv';

T = readtable(DATA_FILE);

% Compute least squares constant
SCALE = leastSquares(T.KsqrtlogK, T.deviation);

generatePlots(T.p, T.K, SCALE*T.KsqrtlogK, T.deviation, FILE_NAME, true);