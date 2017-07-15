#######################################################
# Title: Dependent Generalised Dirichlet Process Priors
# Author: William Barcella
# Description: Data generation process
#######################################################

# Pkgs
library(mvtnorm)
library(abind)

# General parameters
n <- 200 # number of patients
Time <- 4 # number of time periods
disT <- rbind(c(0,1,2,5),
              c(1,0,1,4),
              c(2,1,0,3),
              c(5,4,3,0))

# Covariates
m_X <- c(3,4,3,3)
c_X <- 2*diag(Time)
X <- matrix(0,nrow = n, ncol = 4)
for(i in 1:n){
  X[i,] <- rmvnorm(1, m_X, c_X) # generate covariates
}

# Super-grouping
lz <- sample(c(1,2), size = n, replace = T, prob = c(1,1)) #generate group-assignment

# Cluster assignment
s <- rep(NA,n)
p_s <- rbind(c(0.5,0.5),
             c(0.2,0.8))
for(i in 1:n){
  s[i] <- sample(c(1,2), size = 1, replace = T, prob = p_s[lz[i],] )
}

# Response
B_0 <- rbind(c(1,2,1,0),
             c(2,3,2,1))
B_1 <- rbind(c(0,1,0,0),
             c(1,2,2,1))
A <- 1*0.5^(disT)
B <- 2*0.2^(disT)
c_Y <- abind(A, B,along = 3)
Y <- matrix(0, nrow = n, ncol = 4)
for(i in 1:n){
  Y[i,] <- rmvnorm(1, c(B_0[s[i],]) + c(B_1[s[i],])*c(X[i,]), c_Y[,,s[i]]) # generate covariates
}

# save(n, Time, disT, X, Y, lz, file ="example_data_dgdp.RData")