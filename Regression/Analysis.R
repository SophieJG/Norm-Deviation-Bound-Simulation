simul <- read.table("data_29jul.csv",header=TRUE, sep=',')
reg <- lm(deviation~KsqrtlogK, data=simul)
summary(reg)

est_noIntercept <- solve(t(simul$KsqrtlogK)%*%simul$KsqrtlogK, t(simul$KsqrtlogK)%*%simul$deviation)

# Repeat with Sophie's data
simul_s <- read.table("data_29jul_s.csv",header=TRUE, sep=',')
reg_s <- lm(deviation~KsqrtlogK, data=simul)
summary(reg_s)

est_noIntercept_s <- solve(t(simul_s$KsqrtlogK)%*%simul_s$KsqrtlogK, t(simul_s$KsqrtlogK)%*%simul_s$deviation)
