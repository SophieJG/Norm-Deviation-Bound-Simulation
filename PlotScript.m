clc;

LOG_LOG = true;
FILE_NAME = "simulationPlot";
DATA_FILE = "defaultSimulationData.mat";

load("data/" + DATA_FILE, 'p', 'K', 'KsqrtlogK', 'MND');

% Compute least squares constant
scale = leastSquares(transpose(KsqrtlogK), transpose(MND));

generatePlots(p, K, scale*KsqrtlogK, MND, FILE_NAME, LOG_LOG);