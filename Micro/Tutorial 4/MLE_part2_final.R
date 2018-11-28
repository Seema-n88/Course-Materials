remove(list=ls())
setwd("/Users/Tomas/One Drive/OneDrive/Docs_cloud/Lehre_cloud/Micro_R/UE4_ML_")
library(lmtest)
library(descr)
library(aod)
library(ggplot2)
library(foreign)
library(pastecs)
library(Matrix)
mroz<-read.dta("mroz.dta")
variables<-cbind(colnames(mroz),attr(mroz,"var.labels"))
options(digits=6)



# Some questions:
# let's regress the in-labour-force on just a constant

probit<-glm(mroz$inlf~1, family=binomial(link="probit"))
summary(probit)
# Does the number 0.1723 make sense? If yes, then why?

# We can trasnform the number using the CDF of the normal distribution (Phi)
pnorm(0.1723)
# The result is identical with the mean of the sample:
# P(Y=1) = Phi(Beta_0) = mean of the sample
stat.desc(mroz$inlf)


# the other way arround:
stat.desc(mroz$inlf)[9]
qnorm(stat.desc(mroz$inlf)[9])
# This is the value of the inverse of the 
# standard normal cdf at the mean of the sample. And we see that it is 
# identical with the estimate of the Beta_0.


#####################################
#### PLOT THE log-Likelihood:  ######
#####################################

# We need to define some numbers that come up in the fucntions we want to plot.

mean_lf=mean(mroz$inlf);mean_lf
# how many observations with 1:
sum_lf=stat.desc(mroz$inlf)[7];sum_lf
# calling the seventh Element of the output of the command(stat.desc(.))
# number of observations as the sum of the 1st and 3rd Element of the stat.desc's output
n=stat.desc(mroz$inlf)[1]+stat.desc(mroz$inlf)[3];n

# How to define a function in generall:

#myfunction <- function(arg1, arg2, ... ){
# statements
#return(object)
#}

# function computing the log-Likelihood for different pi's.

# The function computes the individual log-likelihood contribution for every observation
# Afterwards the sum is built over all individuals [defined through the vector data] 
# and that for every probability # pi[i]. 
# Therefore sumLL is a vector of sums, where every i is a sum over all individuals
# for the respective pi[i].

ll<-function(data,p){
  sumLL=c()
  for(i in 1:length(p)){
    y=data*log(p[i])+(1-data)*log(1-p[i])
    z=sum(y)
    sumLL[i]=z
  }
  return(sumLL)
}
# defining the vector of probabilities (pi) fro which we will
# plot the log-Likelihood.
pi=seq(from=0.05,to=0.95,length.out=1000);pi

# what is the value of the maximum likelihood of the Probit Regression.
mle<-logLik(probit);mle
# creating a data.frame consisting of the x & y combinations we want to plot.
data_ll<-data.frame(pi,ll(mroz$inlf,pi))
colnames(data_ll)<-c("pi","log-Likelihood(pi)")
plot(data_ll,xaxt="n",type="l",lwd="2.5")
axis(1, at = seq(0.05, 1, by = 0.05), las=2)
abline(h=mle);abline(v=mean_lf)


####################################
######### Plot the FOC:  ###########
####################################

Foc<-function(p){
  foc=(sum_lf-n*p)/(p*(1-p))
  return(foc)
}

data_foc<-data.frame(pi,Foc(pi))
colnames(data_foc)<-c("pi","Value of FOC")

plot(data_foc,xaxt="n",type="l",lwd=2.5)
axis(1, at = seq(0.05, 1, by = 0.05), las=2)
abline(h=0);abline(v=0.568)


#############################################
######### Plot the SOC ######################
#############################################


Soc<-function(sum,p){
  soc=-((sum/p^2)+(n-sum)/((1-p)^2))
        return(soc)
}

data_soc<-data.frame(pi,Soc(sum_lf,pi))
colnames(data_soc)<-c("pi","Value of SOC")
plot(data_soc,xaxt="n",type="l",lwd=2,ylim=c(-20000,-1000))
axis(1, at = seq(0.05, 1, by = 0.05), las=2)

# How would the Second order look like if we had only 100 instead of 428 working 
# spouses in the sample? (Given the same sample size)
data_soc_100<-data.frame(pi,Soc(100,pi))
colnames(data_soc_100)<-c("pi","Value of SOC")
plot(data_soc_100,xaxt="n",type="l",col="blue")
axis(1, at = seq(0, 1, by = 0.05), las=2)

# On the contrary,what would change had we 600 instead of 428 working 
# spouses in the sample? (Given the same sample size)
data_soc_600<-data.frame(pi,Soc(600,pi))
colnames(data_soc_600)<-c("pi","Value of SOC")
plot(data_soc_600,xaxt="n",type="l",col="red")
axis(1, at = seq(0.05, 1, by = 0.05), las=2)


plot(data_soc_600,xaxt="n",col="red",type="l",lwd=2,ylim=c(-15000,0),xlim=c(0.1,1.2),yaxt="n",main="The values of the SOC as a function of pi, for three different values of number of working spouses", sub="(Note: The sample size is the same for all three graphs)")
lines(data_soc_100,xaxt="n",col="blue",lwd=2)
lines(data_soc,xaxt="n",type="l",lwd=2)
axis(1, at = seq(0.05, 1, by = 0.05), las=2)
axis(2,at = seq(-15000,-1000, by= 2000), las=1)
legend(0.95,-2000,c("# of working = 100", "benchmark (# = 428)","# of working = 600"),lty=c(1,1,1),lwd=c(2,2,2),col=c("blue","black","red"),cex=0.8,y.intersp = 0.9,xjust=0)
abline(v=100/753, col="blue");abline(v=428/753, col="black");abline(v=600/753, col="red")
# mean of #=100: 100/753
# mean of #=600: 600/753
100/753;428/753;600/753

## to check to variances, we can also estimate the models:

# I will estimate it with Logit, because the derivation is easier!
y_100=rep(0,length(mroz$inlf))
y_600=rep(0,length(mroz$inlf))
y_428=mroz$inlf
y_100[1:100]<-rep(1,100)
y_600[1:600]<-rep(1,600)

logit_100<-glm(y_100~1, family=binomial(link="logit"))
logit_428<-glm(y_428~1, family=binomial(link="logit"))
logit_600<-glm(y_600~1, family=binomial(link="logit"))

# To do - compute the Variances of the P(Y=1)
# Computing the actual Variances of the P(Y=1)_hat: (using delta method)
# Inputs are the xi'B (in our case only Beta_0) and the Variance of Beta.
varl<-function(par1,par2){
  p=-par1
  v=(exp(p))/((1+exp(p))^2) 
  var=v*par2*v
  return(var)
}

# This function gives you the predicted probability out of the estimated coefficient B_0
lprob<-function(par){
  p=(exp(par))/(1+exp(par))
  return(p)
}

# the coefficient B_0 aus der Logit Estimation  
coefficients(logit_100)
# The standard error of this coefficient (S.E.(B_0))
sqrt(vcov(logit_100))
# The MLE Estimate for pi in this sample 
100/753
# Probability linked to the coefficient
lprob(coefficients(logit_100))


# The inverse value of the - second order derivation evaluated 
# at the Maximum Likelihood estimate
sqrt(solve(-Soc(100,100/753)))
# The S.E. of the predicted Probability from the logit regression 
sqrt(varl(coefficients(logit_100),vcov(logit_100)))

## -> So we see that manually computing the variance of P(Y=1)
## and evaluating the SOC gives us the same result!


# the coefficient B_0 aus der Logit Estimation  
coefficients(logit_428)
# The standard error of this coefficient (S.E.(B_0))
sqrt(vcov(logit_428))
# The MLE Estimate for pi in this sample 
428/753
# Probability linked to the coefficient
lprob(coefficients(logit_428))

# The inverse value of the - second order derivation evaluated 
# at the Maximum Likelihood estimate
sqrt(solve(-Soc(428,428/753)))

# The S.E. of the predicted Probability from the logit regression
sqrt(varl(coefficients(logit_428),vcov(logit_428)))

# the coefficient B_0 aus der Logit Estimation  
coefficients(logit_600)
# The standard error of this coefficient (S.E.(B_0))
sqrt(vcov(logit_600))
# The MLE Estimate for pi in this sample 
600/753
# Probability linked to the coefficient
lprob(coefficients(logit_600))


# The inverse value of the - second order derivation evaluated 
# at the Maximum Likelihood estimate
sqrt(solve(-Soc(600,600/753)))
# The S.E. of the predicted Probability from the logit regression
sqrt(varl(coefficients(logit_600),vcov(logit_600)))

# The logit estimation of the logit regression on only constant 
# based on the three samples (100,428 and 600 working woman, respectively)
summary(logit_100);summary(logit_428);summary(logit_600)

#####################################
#### COMPUTING THE VARIANCES:  ######
#####################################

#### AVAR 1:  ######

# let's try that for the Probit model:
probit<-glm(mroz$inlf~mroz$age + mroz$educ + mroz$nwifeinc + mroz$kidslt6, family=binomial(link="probit"))
summary(probit)

# producing Xi'beta (sum of characteristics weighted by the respective x := b_0 +b_1*x_1+ ... +b_k*x_k)
xb<-probit$linear.predictors

# creating the data matrix 'X':
a=seq(from=1,to=1,length=length(mroz$age))
X=cbind(a,mroz$age,mroz$educ,mroz$nwifeinc,mroz$kidslt6);X

# having xb, we can compute the lambda_i (which will be a vector)
lambda=(dnorm(xb)*(mroz$inlf-pnorm(xb)))/(pnorm(xb)*(1-(pnorm(xb))))
c=lambda*(lambda+xb);c # vector of individual's c_i (every row of the vector c stores the respective c_i)
sq_c=sqrt(c);sq_c # square root of c

# transforming the X Matrix
library(Matrix)
# the package Matrix does not have to be installed but it has to
# be loaded for "Diagonal" and other commands to work.
length(xb)
I_sq_c=Diagonal(n=length(xb),x=sq_c)
# Creating diagonal matrix with 0 ot the off-diagonal elements 
# and the vector c at the main diagonal

# let's try whether it worked:
sum(I_sq_c)
sum(sq_c)
# -> yes it worked, since the sum of all Elements of the matrix is equal to 
# the some of the elemenets in the vector sq_c.

X_SQ_c=I_sq_c%*%X
X_SQ_c


# putting it together:
# solve(.) computes the inverse
Avar1=solve(t(X_SQ_c)%*%X_SQ_c);Avar1

# Consider the standard deviation and compare it to what R has computed as a default 
# option in the glm function.

sqrt(diag(Avar1))
sqrt(diag(vcov(probit)))


#### AVAR 2:  ######

c2=lambda
I_c2=Diagonal(n=nrow(X),x=c2)
Avar2=solve(t(I_c2%*%X)%*%(I_c2%*%X))
sqrt(diag(Avar2))
sqrt(diag(Avar1))


#### AVAR 3:  ######

c3=sqrt((dnorm(xb)^2)/(pnorm(xb)*(1-pnorm(xb))));c3
I_c3=Diagonal(n=nrow(X),x=c3)
Avar3=solve(t(I_c3%*%X)%*%(I_c3%*%X))
sqrt(diag(Avar3))

# Let's compare all three results:
sqrt(diag(Avar1))
sqrt(diag(Avar2))
sqrt(diag(Avar3))
# default in glm-package (is computed using the conditional hessian):
sqrt(diag(vcov(probit)))

# They are all asympthotically equal, hence, we expected 
# the results to be very close.

