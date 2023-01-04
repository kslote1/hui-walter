### LCA.R
### purpose: read in SAMHSA 2015 data and run LCA on it
### with different number of classes,and (2) with a covariate


###
#poLCA(formula, data, nclass = 2, maxiter = 1000, graphs = FALSE,  tol = 1e-10, na.rm = TRUE, 
#	 probs.start = NULL, nrep = 1,  verbose = TRUE, calc.se = TRUE)
###

#slide10:
library(poLCA)
samhsa2015 <- read.table(file="samhsa_2015F.csv", header=T, as.is=T, sep=",")

vars <- c("mhintake", "mhdiageval", "mhreferral", "treatmt","adminserv")
for (i in 1:length(vars)){
	samhsa2015[,vars[i]] <- samhsa2015[,vars[i]]+1
}

f1 <- as.formula(cbind(mhintake, mhdiageval, mhreferral, treatmt, adminserv)~1)
LCA2 <- poLCA(f1, data=samhsa2015, nclass=2)

#slide13:
plot(LCA2)

#slide14:
LCA3 <- poLCA(f1, data=samhsa2015, nclass=3)

#slide15:
LCA3 <- poLCA(f1, data=samhsa2015, nclass=3, maxiter=3000)
LCA3 <- poLCA(f1, data=samhsa2015, nclass=3, nrep=5)
LCA3 <- poLCA(f1, data=samhsa2015, nclass=3, maxiter=3000, nrep=5)

LCA4 <- poLCA(f1, data=samhsa2015, nclass=4, maxiter=3000, nrep=5)
#LCA4 <- poLCA(f1, data=samhsa2015, nclass=4, maxiter=5000, nrep=5)

LCA5 <- poLCA(f1, data=samhsa2015, nclass=5, maxiter=5000, nrep=10)

### with covariate - 'offer pay assistance' 
#slide19:
f2<- as.formula(cbind(mhintake, mhdiageval, mhreferral, treatmt, adminserv)~payasst)

#set.seed(4589)
LCA3c <- poLCA(f2, data=samhsa2015, nclass=3, maxiter=5000, nrep=5)

#predicted class membership is in:
LCA3$predclass[1:30]

#could be used as another variable (part of the data):
samhsa2015$LCAf5 <- LCA3$predclass


