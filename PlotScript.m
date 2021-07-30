clc;

FILE_NAME = 'simulationPlot';
DATA_FILE = 'Regression/simulationData.csv';

T = readtable(DATA_FILE);
generatePlots(T.p, T.K, T.KsqrtlogK, T.deviation, FILE_NAME, true);