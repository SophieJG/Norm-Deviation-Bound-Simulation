# Simulation of the optimal dependence on sub-Gaussian parameter for norm deviation bounds

### Description

This project simulates the deviation of the norms in a dataset caused by applying a scaled Bernoulli random mapping to the dataset. In particular, it analyzes the expected max norm deviation. The simulation uses the standard normal basis as the dataset, but there is support for other datasets as well.

### Instructions

To run the simulation, clone the repository, open in MATLAB.

**Generating the deviation**

To generate the deviation, run `SimulationScript`. This will create `NUM_POINTS` linearly spaced points p from 0 to `RIGHT_ENDPOINT` (excluding 0). It will then approximate the expected max norm deviation of Bernoulli(p) random variables for each p by computing the mean max norm deviation from `SAMPLES` trials.

The values of `NUM_POINTS`, `RIGHT_ENDPOINT`, and `SAMPLES` are set at the beginning of SimulationScript and can be modified by the user.



**Plotting the data**




### Further Information

This simulation is based on research carried out at the University of British Columbia by Sophie Greenwood, Halyun Jeong, Xiaowei Li, Yaniv Plan, Quang Vuong, and &#214;zg&#252;r Yilmaz.

We acknowledge the support of the Natural Sciences and Engineering Research Council of Canada (NSERC).

Nous remercions le Conseil de recherches en sciences naturelles et en génie du Canada (CRSNG) de son soutien.