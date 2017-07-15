#######################################################
# Title: Dependent Generalised Dirichlet Process Priors
# Author: William Barcella
# Description: Posterior predictive means
#######################################################

### Package
require(coda)
require(mcmcplots)
require(ggmcmc)
require(MASS)
library(RColorBrewer)

par(mfrow=c(1,1),mar=c(2,2,2,2))


tim <- c(0,1,2,5)

# Source samples from the predictive
yPred1 <- fitmodel$BUGSoutput$sims.list$yPred1
yPred2 <- fitmodel$BUGSoutput$sims.list$yPred2
yPred3 <- fitmodel$BUGSoutput$sims.list$yPred3

#
traj1.1 <- colMeans(yPred1[,1,])
traj1.2 <- colMeans(yPred1[,2,])
plot(tim,traj1.1,type="o",ylim=c(1.8,10),cex.axis=0.7,main="",pch=1,lty=1)
lines(tim,traj1.2,type="o",pch=4,lty=1,col=2)

#
traj2.1 <- colMeans(yPred2[,1,])
traj2.2 <- colMeans(yPred2[,2,])
lines(tim,traj2.1,type="o",lty=2)
lines(tim,traj2.2,type="o",pch=4,col=2,lty=2)

#
traj3.1 <- colMeans(yPred3[,1,])
traj3.2 <- colMeans(yPred3[,2,])
lines(tim,traj3.1,type="o",lty=3)
lines(tim,traj3.2,type="o",pch=4,col=2,lty=3)

#
legend(3.3,10,cex=0.7,c("Group 1, x= 3.1, 3.8, 3.0, 3.3","Group 2, x= 3.1, 3.8, 3.0, 3.3",
                       "Group 1, x= 3.0, 0.0, 4.5, 3.7","Group 2, x= 3.0, 0.0, 4.5, 3.7",
                       "Group 1, x= 2.5, 1.9, 2.9, 3.5","Group 2, x= 2.5, 1.9, 2.9, 3.5"), 
       lty=c(1,1,2,2,3,3),
       lwd=c(1.5,1.5),col=c(1,2), bty="n", pch=c(1,4,1,4,1,4))

