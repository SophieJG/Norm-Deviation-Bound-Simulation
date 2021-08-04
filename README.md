# Simulation of the optimal dependence on sub-Gaussian parameter for norm deviation bounds

### Description

This project simulates the deviation of the norms in a dataset caused by applying a scaled Bernoulli random mapping to the dataset. In particular, it analyzes the expected max norm deviation. The simulation uses the standard orthonormal basis as the dataset, but there is support for other datasets as well.

### Instructions

To run the simulation, clone the repository, open in MATLAB.

**Generating the deviation**

To generate the deviation, run `SimulationScript`. This will create `NUM_POINTS` linearly spaced points p from 0 to `RIGHT_ENDPOINT` (excluding 0). It will then approximate the expected max norm deviation of Bernoulli(p) random variables for each p by computing the mean max norm deviation of the set from `SAMPLES` trials, and divide this quantity by the complexity of the set.

By default, if `USE_CUSTOM_SET` is `false`, the simulation will use the standard orthonormal basis as the set, and the ambient dimension will be chosen to maximize the norm distortion. If `USE_CUSTOM_SET` is `true`, the simulation will load the dataset stored at `CUSTOM_SET_FILE`. This _must_ be a `.mat` file containing an `n x k` matrix `T`, where `n` is the ambient dimension of the dataset, and `k` is the number of points in the dataset; each column is a point in the dataset.

The data will be saved to `RESULT_FILE` in the `data` directory. 

This script will automatically plot the data and store the plots in the `plots` directory. The name of the file will depend on the parameters of the simulation. See the following section for details on how to customize the plots.

The values of `NUM_POINTS`, `RIGHT_ENDPOINT`, `SAMPLES`, `RESULT_FILE`, `USE_CUSTOM_SET`, and `CUSTOM_SET_FILE` are set at the beginning of `SimulationScript` and can be modified by the user.


**Plotting the data**

This script will plot the mean max norm deviation over complexity (denoted by MND) and the value of K x sqrt(log K) (where K is the sub-Gaussian norm of the scaled Bernoulli matrix used in simulating the MND) as functions of both p and K.

It will plot the data stored in the `.mat` file specified in `DATA_FILE`. `DATA_FILE` must be a `.mat` file generated by `SimulationScript` (or at least have the same contents and interpretation).

If `LOG_LOG` is true, the plots will be log-log plots. Otherwise, the data will be plotted as given.

The plots will be saved with the prefix `FILE_NAME` to the `plots` directory.

The values of `DATA_FILE`, `FILE_NAME`, and `LOG_LOG` are set at the beginning of `PlotScript` and can be modified by the user.


### Further Information

This simulation is based on research carried out at the University of British Columbia by Sophie Greenwood, Halyun Jeong, Xiaowei Li, Yaniv Plan, Quang Vuong, and &#214;zg&#252;r Yilmaz.

We acknowledge the support of the Natural Sciences and Engineering Research Council of Canada (NSERC).

Nous remercions le Conseil de recherches en sciences naturelles et en génie du Canada (CRSNG) de son soutien.
