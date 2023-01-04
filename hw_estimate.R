# Ensure JAGS is installed on your machine: https://mcmc-jags.sourceforge.io/
# otherwise the following won't work (complains about missing .so files, etc.)

install.packages("rjags")
library(rjags)
testjags()  # confirm installation

install.packages("runjags")
library(runjags)


data <- read.csv("hw_test.csv")
template_huiwalter(data, outfile="hw_model.txt")
out <- autorun.JAGS("hw_model.txt")

plot(out) # multiple plots

prior_test1 = out[["summaries"]]["prev[1]","Mean"]  # theta_1
prior_test2 = out[["summaries"]]["prev[2]","Mean"]  # theta_2


tpr_test1 = out[["summaries"]]["se[1]","Mean"]
tpr_test2 = out[["summaries"]]["se[2]","Mean"]

tnr_test1 = out[["summaries"]]["sp[1]","Mean"]
tnr_test2 = out[["summaries"]]["sp[2]","Mean"]

fpr_test1 = 1 - tnr_test1  # alpha_1
fpr_test2 = 1 - tnr_test2  # alpha_2

fnr_test1 = 1 - tpr_test1  # beta_1
fnr_test2 = 1 - tpr_test2  # beta_2

