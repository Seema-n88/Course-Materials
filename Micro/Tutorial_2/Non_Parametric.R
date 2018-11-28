remove(list=ls())
setwd("/Users/Tomas/One Drive/OneDrive/Docs_cloud/Lehre_cloud/Micro_R/UE2_NP_LPM/R_files")
#install.packages("foreign")
library(foreign)
library(pastecs)
mroz<-read.dta("mroz.dta")


# to get a basic idea about the dataset, we can look at the first couple of observations
head(mroz)
tail(mroz)
# but it can be used more versitile
mroz[1:10,1:4] # First four Variables for first ten observations, remember? the dataset is just a special matrix.


# What came with the dataset (it was a stata-dataset), the description of the variables:
a<-attr(mroz,"var.labels")
a
b<-colnames(mroz)
dim(b)<-c(22,1)
dim(a)<-c(22,1)
variables<-cbind(b,a)
variables
View(variables)
# This works only if you did not specify explicitely that mroz is a data.frame, i.e.
# i.e.: you have used mroz<-read.dta("path") instead of mroz<-data.frame(read.dta("path"))
# but the mroz is a data.frame:
is.data.frame(mroz)

# You don't have to create anything to get this "overview", you can simply type in:
View(cbind(colnames(mroz),attr(mroz,"var.labels")))
# If you would like to change names of the variables you would need to do it like this:
colnames(mroz)[1]<-c("INLF")
View(cbind(colnames(mroz),attr(mroz,"var.labels")))
colnames(mroz)[1]<-c("inlf")
# you are not changing the vartiable's name infl but you are changing
# the first column's name of the "matrix" called MROZ.

summary(mroz)
options(digits=3)
stat.desc(cbind(mroz$inlf,mroz$hours,mroz$kidslt6,mroz$educ,mroz$wage,mroz$unem,mroz$nwifeinc))
# If only you want to see the basic statistics you can specify:
stat.desc(cbind(mroz$inlf,mroz$hours,mroz$kidslt6,mroz$educ,mroz$wage,mroz$unem,mroz$nwifeinc),desc=FALSE)

#####################################################################
#####################   NON-PARAMETRIC REGRESSION   #################
######################################################################

# let's say we want to use built-in command "ksmooth"
?ksmooth
# let's say we want to predict the relationsship between faminc and spouse's 
# participation in the labour market:

# first do it without "optimally" selecting the bandwith:
k<-ksmooth(mroz$faminc,mroz$inlf,kernel=("normal"))
plot(k$x,k$y,type="l")
#look at k?
k

# It gives us the points we can plot -> Because we have n(=753) X-points to which ksmooth has produced y-points
# y-points are going to built the plot of the function m(x).

# Why? (Hint: the default settings for the Bandwidth is 0.5)

sd(mroz$faminc)
# -> you see, too large standard deviuation for a h=0.5!

k<-ksmooth(mroz$faminc,mroz$inlf,kernel=("normal"),bandwidth=1000)
plot(k$x,k$y,type="l",xlab = "Family income", ylab = "estimate of the conditional probability of spouse working", main ="Gaussian kernel with h=1000")

k<-ksmooth(mroz$faminc,mroz$inlf,kernel=("normal"), bandwidth=2000)
k
plot(k$x,k$y,type="l",xlab = "Family income", ylab = "estimate of the conditional probability of spouse working", main ="Gaussian kernel with h=2000")

k<-ksmooth(mroz$faminc,mroz$inlf,kernel=("normal"), bandwidth=4000)
k
plot(k$x,k$y,type="l",xlab = "Family income", ylab = "estimate of the conditional probability of spouse working", main ="Gaussian kernel with h=4000")

# Let's say we change the kernel-function:
k<-ksmooth(mroz$faminc,mroz$inlf,kernel=("box"), bandwidth=4000)
k
plot(k$x,k$y,type="l",xlab = "Family income", ylab = "estimate of the conditional probability of spouse working", main ="Uniform kernel with h=4000")

# Compare graphs produced by "normal" - Kernel with h=4000 and by "box" - Kernel with h=4000 with the graph produced
# by kernel "normal" with h=2000. You see that the bandwith choice has a much larger effect on the shape of the graph 
# that the choice of the Kernel. 

# We need to choose 'kernel' and the 'bandwith' and how many points are going to be produced
# The choice of Bandwidth is most important:

# Rule of thumb is sd(x)*n^-(1/5)
bw=sd(mroz$faminc) * length(mroz$faminc)^(-1/5)
bw

k_bw<-ksmooth(mroz$faminc,mroz$inlf,kernel=("normal"),bandwidth = bw)
k_bw
plot(k_bw$x,k_bw$y,type="l",xlab = "Family income", ylab = "estimate of the conditional probability of spouse working",xlim=c(0,100000))


# That was the built-in function. For more functionality and versatility use the np-package

# You need to install this package first using:
# install.packages("np")
library(np)

# it is a two-step estimation, where the optimal bandwidth is selected in the fisrt step and the kernel 
# regression is computed in the second step, given the optimal bandwidth
bw_lc <- npregbw(xdat=mroz$faminc, ydat=mroz$inlf,regtype="lc",nmulti=2)
np_reg_lc<-npreg(bws = bw_lc, regtype="lc")
summary(np_reg_lc)
fit_lc<-fitted(np_reg_lc)

plot(mroz$faminc, mroz$inlf, xlab="Family income", ylab="In-Labour-Force", cex=0.5, main="Nadaraya-Watson estimated regression",xaxt="n",sub = "Cross validated bandwidth",cex.main = 1.5,cex.sub = 1.3)
lines(sort(mroz$faminc), fit_lc[order(mroz$faminc)], col= "blue",lwd=2)

# Let us compare the graphs produced by the rule-of-thumb bandwidth and by the NP-Package that selects the 
# optimal Bandwidth given the data:
plot(k_bw$x,k_bw$y,type="l",xlab = "Family income", ylab = "estimate of the conditional probability of spouse working",xlim=c(0,100000))
lines(sort(mroz$faminc), fit_lc[order(mroz$faminc)], col= "blue",lwd=2)
# As mentioned earlier, the bandwidth selection is the most important choice with the Kernel-Regression

bw_elc <- npregbw(xdat=mroz$faminc, ydat=mroz$inlf, ckertype="epanechnikov", ckerorder=4)
np_reg_elc<-npreg(bws = bw_elc, regtype="lc")
summary(np_reg_elc)
fit_elc<-fitted(npreg(bws = bw_elc, regtype="lc"))

plot(k_bw$x,k_bw$y,type="l",xlab = "Family income", ylab = "estimate of the conditional probability of spouse working",xlim=c(0,100000))
lines(sort(mroz$faminc), fit_lc[order(mroz$faminc)], col= "blue",lwd=2)
lines(sort(mroz$faminc), fit_elc[order(mroz$faminc)], col= "red",lwd=2)

# Compare black and blue lines and notice the difference caused by the different bandwith selection
# Compare blue and red line to see what difference the choice of the Kernel causes given the same 
# procedure was applied to extract the optimal bandwidth.
# (This is nothing against the rule of thumb, because the bandwidth selection in the latter steps is not constant 
# on the whole interval).
# But it certainly makes the point that the choice of the bandwidth is more important than the 
# choice of the kernel function

# The decision to work or not to work depends most probably on the non-wife-income (i.e. the income that 
# was actually available or predicted when the decision to work or not was made).

bw_lc <- npregbw(xdat=mroz$nwifeinc, ydat=mroz$inlf,regtype="lc",nmulti=2)
np_reg_lc<-npreg(bws = bw_lc, regtype="lc")
summary(np_reg_lc)
fit_lc<-fitted(np_reg_lc)

myTicks1<-c(min(mroz$nwifeinc),median(mroz$nwifeinc),max(mroz$nwifeinc))
plot(mroz$nwifeinc, mroz$inlf, xlab="Non-Spouse-Income", ylab="In-Labour-Force", cex=0.5, main="Nadaraya-Watson estimated regression",xaxt="n",sub = "Cross validated bandwidth",cex.main = 1.5,cex.sub = 1.3)
lines(sort(mroz$nwifeinc), fit_lc[order(mroz$nwifeinc)], col= "blue",lwd=2)
axis(side=1,at=myTicks1)

# Just as ilustration look how much it takes to compute it with 2 or even 3 independent variable
# just 1 independent variable as benchmark:
system.time(bw_lc <- npregbw(mroz$inlf~mroz$educ, regtype="lc",nmulti=2))
# 2 independent variables
system.time(bw_lc <- npregbw(mroz$inlf~mroz$educ+mroz$nwifeinc, regtype="lc",nmulti=2))
# 3 independent variables
system.time(bw_lc <- npregbw(mroz$inlf~mroz$educ+mroz$nwifeinc+mroz$kidslt6, regtype="lc",nmulti=2))
# and we only have 753 observations here.


##### --> NOW TO SLIDE 5!


# We know that the decission to work or not to depends on more variables and 
# we need to include them. 
# The question is how when the non-parametric regression is connected to problems with 
# multiple variables:

# More structure?

#####################################################################
#################    Linear-Probability-Model   #####################
#####################################################################

# Univariate Regression, so only using non-wife income as before:
rg<-lm(mroz$inlf~mroz$nwifeinc)
summary(rg)
plot(mroz$nwifeinc, mroz$inlf, xlab="Non-Spouse-Income", ylab="In-Labour-Force", cex=0.5, main="Univariate regression" ,cex.main = 1.5,cex.sub = 1.3)
abline(rg)
# INTERPRETATION: If the non-wife income increases by one tsd $ than the probability for woman to participate in the labour market 
# drops by 0.5 PERCENTAGE POINTS. 
#PROBLEM: it is a constant effect for all income levels. 


# We can make it more flexible, so that the marginal effect of an additional 
# unit is not constant for all x but changes with x.
# Please not that we are still imposing a structure 
# i.e.: How does the marginal effect change with the changing x? We need to specify that in linear model.
rg<-lm(mroz$inlf~mroz$nwifeinc+I(mroz$nwifeinc^2))
summary(rg)
fit_rg<-fitted(rg)
plot(mroz$nwifeinc, mroz$inlf, xlab="Non-Spouse-Income", ylab="In-Labour-Force", cex=0.5, main="Regression with 2th order polynomial" ,cex.main = 1.5,cex.sub = 1.3)
lines(sort(mroz$nwifeinc),fit_rg[order(mroz$nwifeinc)], col= "blue",lwd=2)

rg<-lm(mroz$inlf~mroz$nwifeinc+I(mroz$nwifeinc^2)+I(mroz$nwifeinc^3))
summary(rg)
fit_rg<-fitted(rg)
plot(mroz$nwifeinc, mroz$inlf, xlab="Non-Spouse-Income", ylab="In-Labour-Force", cex=0.5, main="Regression with 3th order polynomial" ,cex.main = 1.5,cex.sub = 1.3)
lines(sort(mroz$nwifeinc),fit_rg[order(mroz$nwifeinc)], col= "blue",lwd=2)

rg<-lm(mroz$inlf~mroz$nwifeinc+I(mroz$nwifeinc^2)+I(mroz$nwifeinc^3)+I(mroz$nwifeinc^4)+I(mroz$nwifeinc^5)+I(mroz$nwifeinc^6)+I(mroz$nwifeinc^7)+I(mroz$nwifeinc^8)+I(mroz$nwifeinc^9)+I(mroz$nwifeinc^10))
summary(rg)
fit_rg<-fitted(rg)
plot(mroz$nwifeinc, mroz$inlf, xlab="Non-Spouse-Income", ylab="In-Labour-Force", cex=0.5, main="Regression with 10th order polynomial" ,cex.main = 1.5,cex.sub = 1.3)
lines(sort(mroz$nwifeinc),fit_rg[order(mroz$nwifeinc)], col= "blue",lwd=2)

## We see that the more "flexibility we include in the model = higher order polynomyals, the more the 
# result look like the non-parametric regression 

# A model that accomodates more than one variable:

rg<-lm(mroz$inlf~mroz$age + mroz$educ + mroz$nwifeinc + mroz$kidslt6)
summary(rg)

# PROBLEM -> There is no "mechanism" that would bound the predicted value of y (which is probability in our case)
# between 0 and 1. So we can get higher predicted probabilities than 1 or lower than 0 (and that is not sensible)

# Negatives are more than obvious! (Look at the figure below)
x=mroz$repwage
rg<-lm(mroz$inlf~x)
summary(rg)
plot(x, mroz$inlf, ylim=c(0,1.0), xlim=c(-0.2,11), xlab="Reported wage in 1976", ylab="In-Labour-Force", cex=0.5, main="Univariate regression" ,cex.main = 1.5,cex.sub = 1.3)
abline(rg)

plot(x, mroz$inlf, ylim=c(0,1.5), xlim=c(-0.2,11), xlab="Reported wage in 1976", ylab="In-Labour-Force", cex=0.5, main="Univariate regression" ,cex.main = 1.5,cex.sub = 1.3)
abline(rg)

plot(x, mroz$inlf, ylim=c(0,2), xlim=c(-0.2,11), xlab="Reported wage in 1976", ylab="In-Labour-Force", cex=0.5, main="Univariate regression" ,cex.main = 1.5,cex.sub = 1.3)
abline(rg)
abline(v=9.5,h=1.565)

# You can see that for a woman in the data set (so not out of sample prediciton)
# we would predict a probability to work at 156.5 percent so way about 100%.
# 
