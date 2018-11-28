remove(list=ls())
setwd("/Users/Tomas/One Drive/OneDrive/Docs_cloud/Lehre_cloud/Micro_R/UE3_MLE")
#install.packages("foreign")
#install.packages("aod")
#install.packages("ggplot2")
#install.packages("descr")
#install.packages("xtable")
#install.packages("sandwich")
#install.packages("lmtest")
library(lmtest)
library(descr)
library(xtable)
library(sandwich)
library(aod)
library(ggplot2)
library(foreign)
library(pastecs)
library(np)

mroz<-read.dta("mroz.dta")# Creating an overview about the variables
variables<-cbind(colnames(mroz),attr(mroz,"var.labels"))
#View(variables)
options(digits=4)

# In the next line, mroz$inlf is defined as categorical variable and value labels are 
# attached to the respective values (0 & 1)
mroz$inlf<-factor(mroz$inlf,levels=c(0,1),labels=c("not working","working"))
table(mroz$inlf,dnn=c("inlf"), useNA="always")

# The regression did not run when inlf was defines as factor (not working, working), hence, 
# I have reloaded the dataset.
mroz<-read.dta("mroz.dta")

# First let us estimate the LPM from the last tutorial:
rg<-lm(mroz$inlf~mroz$age + mroz$educ + mroz$nwifeinc + mroz$kidslt6)
summary(rg)

fitted_rg<-fitted.values(rg)
plot(rg$fitted.values,mroz$inlf)

# We know for a fact that a bernoulli random variable will feature heteroscedastic error term in a 
# Linear Probability Model, whenever the probability depends on at least one x.
# There are formal test for heteroscedsticity, but we do not have to do them, since we know it for a fact.

# vcovHC from the package "sandwich" estimates the heteroscedasticity consistent 
# variance-covariance matrix.
# We can directly compare the residuals from lm and the robbust estimation:
vcovHC(rg)
vcov(rg)

# Note that the coefficient's estimates do not change but the standard errors did (even if not by much)

# Now you have to use an another command to test the coefficient's signifficance, because the standard
# Errors in rg are not valid (since in the object "rg" the results from the lm estimation were saved w/o the robbust standard errors).
# Therefore, you produce new t-statistics (and signifficance levels) with the new S.E.
# using coeftest, where you can choose how you want to estimate the var-cov-Matrix (by which sandwich method).

HCrg<-coeftest(rg,vcov=vcovHC(rg,"HC0")); HCrg
summary(rg)

# (FYI) I wanted to compare the coefficients. First, I have to find out what kind of object HCrg is:
is.matrix(HCrg)
# then look at the coefficients column (all rows of the first column = [,1]):
HCrg[,1]
rg$coefficients
#compare:
rg$coefficients==HCrg[,1]
# Yeah, the same!

# default in R
coeftest(rg,vcov=vcovHC(rg,"HC3"))
# default in STATA
coeftest(rg,vcov=vcovHC(rg,"HC1"))
###################################################
################# PROBIT Model ####################
###################################################

# We simulate the latent variable as well as the observed variable y, to discuss 
# some issues with the probit model.

# first simulate the data
# we just induce some randomness into x (not necessary)
x=rnorm(100,sd=2,mean=7);x

# this is the important part. It was assumed that x is independent of epsilon. Here we have 
# a standard normal distributed epsilon, so definitely homoscedastic.
epsilon=rnorm(100,sd=1,mean=0)
y_latent=-14+2*x+epsilon

# now generate the observed y from the latent variable
y=y_latent
y[y<0]<-0;y
y[y!=0]<-1;y
# it is faster to do everything in vectors than with loops. But sometimes it is easier 
# to do it with loops.

# Estimate probit from the observed data (y and x), so without using the information on y_latent
probit<-glm(y ~ x, family=binomial(link="probit"))
summary(probit)
plot(x,probit$fitted.values)
plot(sort(x),probit$fitted.values[order(x)],type="l",lwd=2)

#produce fitted values for the latent variable 
# the predicted probabilities are Phi(x'B), x'B. Therefore let us compute x'B:
a=seq(from=1,to=1,length=length(y_latent))
X=cbind(a,x)
beta<-probit$coefficients
dim(beta)<-c(2,1)
beta
dim(X)
xb<-X%*%beta

# It exists an easier way, you can extract it from the package using:
xb_package<-probit$linear.predictors
xb==xb_package
sum(xb==xb_package)


# get a picture (literally) about how good our estimator is:
plot(x,y_latent)
lines(x,xb,type="p",col="green",lwd=2)
abline(lm(y_latent~x),col="red",lwd=2)
# the red one is the estimated OLS line based on the unobserved latent variable!
# for all means and purposes, we can view the red line as the true regression line. 
# The latent variable fullfils all assumptions of the OLS-Method so we can use it. 
# Probit is constructed precicelly because we cannot observe the latent variable. We only observe 
# the y={0,1}.

#########################################################################################
### MORE OBSERVATIONS (do the estimates get any better when we increase the sample size?)
#########################################################################################

set.seed(0411)
x=rnorm(1000,sd=2,mean=7)
epsilon=rnorm(1000,sd=1,mean=0)
y_latent=-14+2*x+epsilon
# now generate the observed y from the latent variable
y=y_latent
y[y<0]<-0
y[y!=0]<-1

probit<-glm(y ~ x, family=binomial(link="probit"))
summary(probit)
plot(x,probit$fitted.values)
plot(sort(x),probit$fitted.values[order(x)],type="l",lwd=2)

#produce fitted values for the latent variable 
xb<-probit$linear.predictors

# get a picture (literally) about how good our estimator is:
plot(x,y_latent)
lines(x,xb,type="p",col="green",lwd=2)
abline(lm(y_latent~x),type="l",col="red",lwd=2)

## What happens when we set sd_e=2 
# Compare it to the slide 12 and 13 from the third Tutorial
set.seed(0411)
x=rnorm(1000,sd=2,mean=7)
epsilon=rnorm(1000,sd=2,mean=0)
y_latent=-14+2*x+epsilon
# now generate the observed y from the latent variable
y=y_latent; y[y<0]<-0; y[y!=0]<-1
probit_sd2<-glm(y ~ x, family=binomial(link="probit"))

probit$coefficients
probit_sd2$coefficients

# We see that as the standard error of the Eror Term increases from 1 to 2,
# the coefficients are approxmatelly halved! As we would predict based on the slide 12.
# You can play arround changing the sd as well as the mean of the epsilon.

####################################################
#### WHAT HAPPENS IF y_latent is heteroscedastic? ##
####################################################

set.seed(0411)
x=rnorm(100,sd=2,mean=7)
epsilon=rnorm(100,sd=0.5*x,mean=0)
y_latent=-14+2*x+epsilon
# now generate the observed y from the latent variable
y=y_latent
y[y<0]<-0
y[y!=0]<-1


probit<-glm(y ~ x, family=binomial(link="probit"))
summary(probit)
plot(x,probit$fitted.values)
plot(sort(x),probit$fitted.values[order(x)],type="l",lwd=2)

#produce fitted values for the latent variable 
xb<-probit$linear.predictors

# get a picture (literally) about how good our estimator is:
plot(x,y_latent)
lines(x,xb,type="p",col="green",lwd=2)
abline(lm(y_latent~x),type="l",col="red",lwd=2)

####################################################
#### Does more observations help ?? ################
####################################################
set.seed(0411)
x=rnorm(1000,sd=2,mean=7)
epsilon=rnorm(1000,sd=0.5*x,mean=0)
y_latent=-14+2*x+epsilon
# now generate the observed y from the latent variable
y=y_latent
y[y<0]<-0
y[y!=0]<-1

probit<-glm(y ~ x, family=binomial(link="probit"))
summary(probit)
plot(x,probit$fitted.values)
plot(sort(x),probit$fitted.values[order(x)],type="l",lwd=2)

#produce fitted values for the latent variable 
xb<-probit$linear.predictors

# get a picture (literally) about how good our estimator is:
plot(x,y_latent)
lines(x,xb,type="p",col="green",lwd=2)
abline(lm(y_latent~x),type="l",col="red",lwd=2)

# Why is it so? 


