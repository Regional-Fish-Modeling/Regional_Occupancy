# Regional brook trout occ model - DeWeber and Wagner (2015)


#################################################################
########## BUGS CODE ############################################
#################################################################

# Define the model in the BUGS language and write a text file 
sink("FinalMax30Temp_VaryModel.txt") 
cat("
model {

# Likelihood: 
# Level-1 of the model
for(i in 1:n){  
     y[i] ~ dbern(p[i]) 
     logit(p[i]) <- mu[i] # Logit link
     mu[i] <- alpha[group[i]] + beta1[group[i]]*wat[i] + beta2[group[i]]*soil[i] + beta3[group[i]]*netag[i] + beta4[group[i]]*urb[i] + 
		b1*wat[i]*netag[i] 
	} 
	
# Level-2 of the model
for(j in 1:J){ 
	alpha[j] <- BB[j,1] 
	beta1[j] <- BB[j,2] 
	beta2[j] <- BB[j,3] 
	beta3[j] <- BB[j,4] 
	beta4[j] <- BB[j,5] 

	BB[j,1:K] ~ dmnorm (BB.hat[j,], Tau.B[,]) 

	BB.hat[j,1] <- mu.alpha + b1.alpha * edumntemp[j] 
	BB.hat[j,2] <- mu.beta1 
	BB.hat[j,3] <- mu.beta2 + b1.beta2 * edumnsoilprm[j]  
	BB.hat[j,4] <- mu.beta3 
	BB.hat[j,5] <- mu.beta4 
}


# Priors
mu.alpha ~ dnorm(0, 0.0001)
mu.beta1 ~ dnorm(0, 0.0001)
mu.beta2 ~ dnorm(0, 0.0001)
mu.beta3 ~ dnorm(0, 0.0001)
mu.beta4 ~ dnorm(0, 0.0001)
b1.alpha ~ dnorm(0,0.0001)
b1.beta2 ~ dnorm(0,0.0001)
b1 ~ dnorm(0,0.0001)

# Model variance-covariance
  Tau.B[1:K,1:K] ~ dwish(W[,], df)
  df <- K+1
  Sigma.B[1:K,1:K] <- inverse(Tau.B[,])
  for (k in 1:K){
    for (k.prime in 1:K){
      rho.B[k,k.prime] <- Sigma.B[k,k.prime]/
        sqrt(Sigma.B[k,k]*Sigma.B[k.prime,k.prime])
    }
    sigma.B[k] <- sqrt(Sigma.B[k,k])
  }

} # end model
",fill = TRUE)
sink()

