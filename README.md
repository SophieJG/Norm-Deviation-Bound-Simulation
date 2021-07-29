# Tight Deviation Bound Simulation

To run the simulation, clone the repository, open in MATLAB, and run SimulationScript.

The simulation will generate `NUM_POINTS` linearly spaced points p from 0 to `RIGHT_ENDPOINT`, not including 0. It will then examine the expected max norm deviation of Bernoulli(p) random variables for each p. `SAMPLES` controls the number of samples whose average is used to approximate the expectation.

The values of `NUM_POINTS`, `RIGHT_ENDPOINT`, and `SAMPLES` are set at the beginning of SimulationScript and can be modified by the user.
