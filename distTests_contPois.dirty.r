# This is an environment in which to test ranges of values for use in the approximate continuous Poisson distribution draws.

# This is the sequence of values to have evaluated
tmpSet <- 10^seq(-4,6)
# This sets up how many replicate draws from distributions are made, doing at least 1e5
# is a compromise between run time and accuracy of comparison.
tmpReps <- 1e5
		
# This is where a .pdf will be output
pdf("~/Desktop/test.pdf",height=4*9,width=6*2)
par(mfrow=c(length(tmpSet),2))

# This stores the comparissons of the Ppoisson and approximate continuous Poisson (a gamma type) distribution
aaa <- sapply(tmpSet,function(thisShape){
		# The shape parameter is the lambda for Poisson, and the shape of the gamma
		tmpShape  <- thisShape
		# This is only used for the gamma distribution and is the rate parameter
		# scaled by the shape to create similar distribution attributes to Poisson
		tmpRate <- 1 + (1/ tmpShape)
		# Poisson and then gamma draws, the later is the approximate continuous Poisson
		tmpPois <- rpois(tmpReps, tmpShape)
		tmpGamma <- rgamma(tmpReps,tmpShape* tmpRate,tmpRate)
		
		# These are historgrams to be visualised in the .pdf
		hist(tmpPois,breaks=100, main=paste("Poisson ",tmpShape,sep=""))
		abline(v= tmpShape,col="red",lwd=2)
		hist(tmpGamma,breaks=100, main=paste("Gamma ",tmpShape,sep=""))
		abline(v= tmpShape,col="red",lwd=2)
		tmpResults <-  sapply(list(tmpPois,tmpGamma),function(x){ 
					c("Mean"=mean(x),"Min"=min(x),"Max"=max(x),"Var"=var(x)) 
				})
		
		# This return a normalised comparison between the Poisson and gamma distriubtion draws.
		return( apply(tmpResults,MARGIN=1,function(y){ (y[1]-y[2])/(y[1]) }) )
		})
dev.off()

# This prints out the comparisons.
colnames(aaa) <- as.character(tmpSet)
aaa

