clc;

FILE_NAME = 'simulationPlot';
DATA_FILE = 'Regression/simulationData.csv';
SCALE = 0.791;

T = readtable(DATA_FILE);
generatePlots(T.p, T.K, SCALE*T.KsqrtlogK, T.deviation, FILE_NAME, true);