5+6
a=5+6
b=c(3,4,5,6)
d=seq(from=1,to=9,by=1)
d1=seq(9)
d2=seq(from=1,to=9)

# displaying what we have created
d;d1;d2

# we can look at what kind of objects did we create
is.vector(d)
is.matrix(d)
# interestingly enough a vector in R is no matrix 
# but we can make it to one:
d3=matrix(d,ncol=length(d))
is.matrix(d3)
# d3 is a matrix and d is not even though they are identical
d;d3

dim(d2)
dim(d2)<-c(3,3)
d2
# now we have generated a different matrix out of the vecotr d2
# befere we have specified with 'ncol' how many columns should 
# the resulting matrix have. If we don't do it, R will implements 
# the default settings

is.matrix(d2)
d1=as.matrix(d1)
d1
dim(d1)
dim(d)
# You would think that d and d1 would have the same dimension
# but in R, vectors do not have any dimension. Dimension is a characteristic of matrices

# You can do bunch of other things with vectors:

e=c(1,2,5,10,15,17,16,15,11,7)
f=c(1,3,8,13,16,18,20,22,24,28)
plot(f,e,type="l",col="red",lwd=2)

# Element-by-Element multiplication:
e*f

# Vector Multiplication (Conformity is assumed here and need to be ensured by you)
e%*%f

f%*%t(f) #t(f) - transponse of f
# the fisrt one gives us a "number" whereas the second gives us a vector
# this is something worth remembering to 

# Functions:
mean(x=e) # mean of the vector e:
a<-mean(e)
a
sum(f)


#Random sample:
x=rnorm(100, mean=10, sd=3.4)
x<-as.matrix(x)
colnames(x)<-"income"
x
x<-data.frame(x)
x

## here you need to install it first using: install.packages("foreign")
library("foreign")

# set a working directory:
setwd("/Users/seema/Documents/Semester1/Micro/Tutorial_1_Introduction")
data<-data.frame(read.dta(file="nlswork_adj.dta"))


# data<-read.dta(file="nlswork_adj.dta") will suffice to load .dta dataset
# R is smart enough to know that the output of the read.dta is a data.frame 
# so it preasumes this format. The longer version is just fail-safe and more general for other commands.


mean(data$ln_wage)
# here I just specified that I want to get the mean of the "ln_wage" which is a
# column of the dataframe "data"

library("pastecs")
stat.desc(data)
# little bit crowded but you get the basic Information
stat.desc(data$ln_wage)

# One can also create some additional variable and make it a part of the dataset:
# This is for you if you want to try it out ;) (hint: use the command 'cbind')
