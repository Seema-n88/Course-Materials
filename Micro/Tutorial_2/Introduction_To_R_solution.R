
####################################################################################
############     SOLUTION TO SHORT INTRODUCTION TO R    ############################
####################################################################################

setwd("/Users/Tomas/One Drive/OneDrive/Docs_cloud/Lehre_cloud/Micro_R/UE1_Introduction/R")

# Chapter 3.1:
(2014-2008)/(2014-1988)*100
# Yes I am older than you :D

# Chapter 3.2:
a=2014-2008
b=2014-1988
c=a/b*100
names(c)<-"Percent of my life spent in the tertiary education"
c

# Chapter 3.4:
d=c(4,5,8,11)
sum(d)

# Chapter 3.5:
e=sort(rnorm(100,mean=0,sd=1))
plot(x=e, type="h",col="red")

# Chapter 4:
?sqrt

# Chapter 5:
# it is straightforward, hence left out

# Chapter 6.2:
P=seq(from=31, to=60)
Q=as.matrix(P)
dim(Q)<-c(6,5)
Q

# Chapter 6.3:
remove(list=ls())
x1=rnorm(100)
x2=rnorm(100)
x3=rnorm(100)
t1=as.matrix(cbind(x1,x1+x2,x1+x2+x3))
colnames(t1)<-c("a","b","c")
t<-data.frame(t1)
t1
plot(t)
sd(t)
# this was the point of that excercise to show you that you cannot 
# estimate standard deviation of a whole dataset -> it would not make any sense
sd(t1)

# Chapter 7:
plot(t$a,type="l",ylim=range(t),lwd=3,col=rgb(1,0,0,0.3))
plot(t$b,type="s",lwd=2,col=rgb(0.3,0.4,0.3,0.9))
plot(t$c,pch=20,cex=4,col=rgb(0,0,0.1,0.3))

'experiment with the respective parameters and look into help-file by typing ?rgb etc.'

# Chapter 8:
## creating a file:
d=data.frame(a=c(1,2,4,8,16,32) , g=c(2,4,8,16,32,64) , x=c(3,6,12,24,48,96))
# If you set your working directory, all files will be saved to and load from 
# this directory without you specifying the paths

write.table(x=d,file="tst1.txt",sep=",",row.names=FALSE)
dir(all.files=TRUE)
# just checking whether the file was created

remove(list="d")
dir(all.files=TRUE)
d<-read.table(file="tst1.txt",sep=",",dec=".",header=TRUE)
e<-data.frame(a=d$a,g=d$g*5,x=d$x)
write.table(x=e,file="tst2.txt",row.names=FALSE,)

# It is whimsical. I found out that if you use sep="" in the write.table, the read.table command
' will give you an error specifying sep="" .
That is why I have used sep="," to make it fail safe.'


# Chapter 9:
f=rnorm(100)
g=sqrt(f)

# You already see warning message: NaNs produced, which means Not a Numbers produced
# Obviously, you can only compute square root of non-negative numbers:
g


# Chapter 10.2:
dates=strptime(c("20151021210000","20151206060000","20151224180000"),format="%Y%m%d%H%M%S")
n=c(0,0,3)
dates
plot(dates,n)



# Chapter 11.2:
a=seq(length.out=100)
a11=a[a<5]*10
a12=a[a>90]*10
a1=c(a11,a12)
a2=a[a<=90 & a>=5]*0.1
a1;a2

# if you really want to use a for-loop in this task:
# if you just want to fill a vector in the loop:
# 
# same way

b1=c()
b2=c()
for(i in 1:100)
{
if(a[i]<5)
{
  b=a[i]*10
  b1=c(b1,b)
}else{
    if(a[i]>90)
{ 
  b=a[i]*10
  b1=c(b1,b)
}else{
  b=a[i]*0.1
  b2=c(b2,b)
    }
  }
}
b1
b2
# for comparison 
a1;a2

# Chapter 11.3, your own functions:
fun2=function(arg1)
{
h=arg1
h2=c()
h3=c()
for(i in 1:100)
{
  if(h[i]<5 | h[i]>90)
  {
    h1=h[i]*10
    h2=c(h2,h1)
  }else{
    h1=h[i]*0.1
    h3=c(h3,h1)
    }
  }
return(list(h2,h3))
}

fun2(a)
# for comparison 
a1;a2
b1;b2
