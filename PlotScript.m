clc;

FILE_NAME = 'simulationPlot';
DATA_DIRECTORY = 'data/';
DATA_FILE = DATA_DIRECTORY + 'defaultSimulationData.csv';

T = readtable(DATA_FILE);

% Compute least squares constant
scale = leastSquares(T.KsqrtlogK, T.MND);

generatePlots(T.p, T.K, scale*T.KsqrtlogK, T.MND, FILE_NAME, true);