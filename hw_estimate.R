# Ensure JAGS is installed on your machine: https://mcmc-jags.sourceforge.io/
# otherwise the following won't work (complains about missing .so files, etc.)

install.packages("rjags")
library(rjags)

install.packages("runjags")
library(runjags)
testjags()  # confirm installation

data <- read.csv("HW_2.csv")
data[['ID']] <- data$X
data[['Population']] <- data$Class
data[data == 'M'] <- 1
data[data == 'B'] <- 0

col_names <- c('ID','Population','Test1','Test2')
data[col_names] <- lapply(data[col_names] , factor)
template_huiwalter(data[col_names], outfile="hw_model_2.txt")
out <- autorun.JAGS("hw_model_2.txt")

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


prior_test1_se = out[["summaries"]]["prev[1]","SD"]  # theta_1_se
prior_test2_se = out[["summaries"]]["prev[2]","SD"]  # theta_2_se

# alpha_1
fpr_test1_stats <- list()
for (i in c("Upper95", "Mean", "Lower95")){
  
  n <- i
  if (i == 'Upper95'){
    n <- "Lower95"
  } else if(i == "Lower95"){
    n <- "Upper95"
  }
  fpr_test1_stats[n] <- 1 - out[["summaries"]]["sp[1]", i]
}
fpr_test1_stats["sd"] <- out[["summaries"]]["sp[1]","SD"]

# alpha_2
fpr_test2_stats <- list()
for (i in c("Upper95", "Mean", "Lower95")){
  
  n <- i
  if (i == 'Upper95'){
    n <- "Lower95"
  } else if(i == "Lower95"){
    n <- "Upper95"
  }
  fpr_test2_stats[n] <- 1 - out[["summaries"]]["sp[2]", i]
}
fpr_test2_stats["sd"] <- out[["summaries"]]["sp[2]","SD"]


# beta_1
fnr_test1_stats <- list()
for (i in c("Upper95", "Mean", "Lower95")){
  
  n <- i
  if (i == 'Upper95'){
    n <- "Lower95"
  } else if(i == "Lower95"){
    n <- "Upper95"
  }
  fnr_test1_stats[n] <- 1 - out[["summaries"]]["se[1]", i]
}
fnr_test1_stats["sd"] <- out[["summaries"]]["se[1]","SD"]

# beta_2
fnr_test2_stats <- list()
for (i in c("Upper95", "Mean", "Lower95")){
  
  n <- i
  if (i == 'Upper95'){
    n <- "Lower95"
  } else if(i == "Lower95"){
    n <- "Upper95"
  }
  fnr_test2_stats[n] <- 1 - out[["summaries"]]["se[2]", i]
}
fnr_test2_stats["sd"] <- out[["summaries"]]["se[2]","SD"]
