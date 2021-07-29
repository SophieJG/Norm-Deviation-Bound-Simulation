# Calculation of best-fitting constant term

# Change first argument to name of file that contains simulation results
simul <- read.table("simulationData.csv",header=TRUE, sep=',')

# With intercept term
reg <- lm(deviation~KsqrtlogK, data=simul)
reg$coefficients[2]

# Without intercept term
est_noIntercept <- solve(t(simul$KsqrtlogK)%*%simul$KsqrtlogK, t(simul$KsqrtlogK)%*%simul$deviation)
est_noIntercept