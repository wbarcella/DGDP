#######################################################
# Title: Dependent Generalised Dirichlet Process Priors
# Author: William Barcella
# Description: Main code
#######################################################

require(R2jags)

# Source data
load("example_data_dgdp.RData")
TT <- dim(Y)[2] # Dimension of the response variable
n <- dim(Y)[1] # Number of patients 
K <-  20 # Truncation level for the DGDP

# Index variable for the risk group
Z <- cbind(rep(1,n),(lz-1))
uz <- unique(Z)

# Values to evaluate the predictive mean  
Xp1  <- as.vector(colMeans(X))
Xp2  <- as.vector(X[1,])
Xp3  <- as.vector(X[10,])

# Hyperparameter of G_0
m_int = c(0,0,0,0)
Tau_int = diag(4)*0.01


# Data to pass in JAGS
dataJags=list(y=Y, X=X, n=n, K=K, lz=lz, un=max(lz), 
              uz=uz, disT=disT, TT=TT,
              Xp1=Xp1,Xp2=Xp2,Xp3=Xp3, 
              m_int=m_int, Tau_int=Tau_int)

# Random initial values
#inits <-  c(list(list(.RNG.seed=2345)),list(list(.RNG.seed=1234)))
inits <-list(list(.RNG.seed=2345))

# JAGS script of the model
filein <- "example_code_dgdp"

# Parameters to save
params <- c("inPred","bePred", "g",
            "yPred1","yPred2","yPred3", "coef","prsb","rho_omegaP","s_omega2P") 

fitmodel <- jags(model.file=filein, inits=inits, data=dataJags,
               parameters.to.save=params, n.chains=1, n.iter=50000, n.burnin=30000,
               n.thin=1, DIC=FALSE)
