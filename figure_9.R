#######################################################
# Title: Dependent Generalised Dirichlet Process Priors
# Author: William Barcella
# Description: Marginal posterior predictive density 
#######################################################

### Package
require(coda)
require(mcmcplots)
require(ggmcmc)
require(MASS)
library(RColorBrewer)

par(mfrow=c(1,1),mar=c(2,2,2,2))

# Source samples from the predictive
yPred1 <- fitmodel$BUGSoutput$sims.list$yPred1
yPred2 <- fitmodel$BUGSoutput$sims.list$yPred2
yPred3 <- fitmodel$BUGSoutput$sims.list$yPred3

# t=2
plot(density(yPred1[,1,3]),main="",xlab="",ylab="",cex.axis=0.7,ylim=c(0,0.25),xlim=c(-4,16),lwd=1)
lines(density(yPred1[,2,3]),col=2,lwd=1)

lines(density(yPred2[,1,3]),main="",xlab="",ylab="",cex.axis=0.7,lty=2)
lines(density(yPred2[,2,3]),col=2,lty=2,lwd=1)

lines(density(yPred3[,1,3]),main="",xlab="",ylab="",cex.axis=0.7,lty=3)
lines(density(yPred3[,2,3]),col=2,lty=3,lwd=1)

