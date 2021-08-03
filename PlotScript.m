clc;

FILE_NAME = 'simulationPlot';
DATA_FILE = 'Regression/simulationData.csv';

T = readtable(DATA_FILE);

% Compute least squares constant
design = T.KsqrtlogK;
response = T.deviation;
SCALE = inv(transpose(design) * design) * transpose(design) * response;

generatePlots(T.p, T.K, SCALE*T.KsqrtlogK, T.deviation, FILE_NAME, true);