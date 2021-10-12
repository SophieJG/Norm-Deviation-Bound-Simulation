clc;

LOG_LOG = true;
FILE_NAME = "simulationPlot";
DATA_FILE = "defaultSimulationData.mat";
load("data/" + DATA_FILE, 'p', 'K', 'KsqrtlogK', 'MND');

generatePlots(p, K, KsqrtlogK, MND, FILE_NAME, LOG_LOG);