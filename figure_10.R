#######################################################
# Title: Dependent Generalised Dirichlet Process Priors
# Author: William Barcella
# Description: Posterior densities of the regression 
# coefficients
#######################################################

### Package
require(coda)
require(mcmcplots)
require(ggmcmc)
require(MASS)
library(RColorBrewer)

par(mfrow=c(1,1),mar=c(2,2,2,2))

# Source from the posterior distributions 
bePred <- fitmodel$BUGSoutput$sims.list$bePred

# beta_1
plot(density(bePred[,1,1],adjust = 2),main="",xlab="",ylab="",cex.axis=0.7,xlim=c(-1,2),ylim=c(0,4))
lines(density(bePred[,2,1],adjust = 2),col=2,main="",xlab="",ylab="",cex.axis=0.7)
legend("topleft",
       c("Group 1","Group 2"), 
       col=c(1:2),lty=c(1,1),cex=0.7,bty = "n")

# beta_2
plot(density(bePred[,1,2]),main="",xlab="",ylab="",cex.axis=0.7,xlim=c(0.2,2.5),ylim=c(0,3.7))
lines(density(bePred[,2,2]),col=2,main="",xlab="",ylab="",cex.axis=0.7)

# beta_3
plot(density(bePred[,1,3]),main="",xlab="",ylab="",cex.axis=0.7,xlim=c(-0.5,2.5),ylim=c(0,3.9))
lines(density(bePred[,2,3]),col=2,main="",xlab="",ylab="",cex.axis=0.7)

# beta_4
plot(density(bePred[,1,4]),main="",xlab="",ylab="",cex.axis=0.7,xlim=c(-0.5,1.5),ylim=c(0,3.5))
lines(density(bePred[,2,4]),col=2,main="",xlab="",ylab="",cex.axis=0.7)

