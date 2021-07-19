require(jpeg)
#-- create a vector of the names:
name=c("male.pacole","male.pspliu",
"male.sjbeck","male.skumar",
"male.rsanti","female.anpage","female.asamma",
"female.klclar","female.ekavaz","female.drbost")
#--Each row of x will hold a photo.
x = matrix( 0, nrow = 10 * 5, ncol = 200 * 180 )

setwd("D:/Prayas/NEW/Desktop")
k = 0
for(i in 1 : 10)
{
for(j in 1 : 5)
{
k = k + 1
filename=paste("grayfaces/",name[i],".",j,
".jpg",sep="")
x[k, ] = as.vector( readJPEG( filename ) )
}
}

drawPic = function(y,title)
{ dim(y) = c(200,180)
plot(1:2,ty='n',main=title)
rasterImage(as.raster(y),1,1,2,2)
}

drawPic( x[30, ], "A female face" )

meanx = apply(x,2,mean)
drawPic( meanx, "The mean face" )

A = y %*% t(y)
eig = eigen(A)
values = eig$values

P = t(y) %*% eig$vec[,-50]
Q = apply(P,2,function(x) x/sqrt(sum(x*x)))

showEigFace = function(vec,i)
{
y = abs(vec)
extreme = range(y)
y = (y-extreme[1])/(extreme[2]-extreme[1])
drawPic(y, paste("Eigenface",i))
}
showEigFace(Q[,1],1)

scores = y %*% Q #i-th row is for i-th image


expl = 100*cumsum(values)/sum(values)
plot(expl,main="Cumulative variance Explained",type="b",
xlab="Components", ylab="Cum. Variance")

coeff = as.vector(scores[30, ])

#Now with the mean face, we progressively add more details.

par(mar = rep(3, 4))
for(k in 1:49)
{
if(k==1)
temp = Q[,1]*coeff[1]
else
temp=Q[,1:k] %*% as.vector(coeff[1:k])
recons = meanx + temp
recons[ recons < 0 ] = 0
drawPic( recons, paste( "k=",k,",","Var=",
round(values[k],2),",",'\n',"Cum.Var=",
round(expl[k],2),"%" ) )
}











		