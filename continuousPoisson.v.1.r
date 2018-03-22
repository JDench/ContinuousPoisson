# This is the function to get draws from the approximate continuous Poisson distribution.
# The lambda argument is the only that need be supplied and is as per the lambda of 
# a discrete Poisson distribution of interest.  The adjustment controls the 
# mass and dispersion of the continuous distribution.  
continuousPoisson <- function(func_numDraws, func_lambda, func_adjust = 3){
	# By defining the rate parameter as a function of the shape
	# and then later the shape as the product of both, is what gives 
	# Poisson like distribution
	func_rate <- 1 + (func_adjust/ func_lambda)
	# gamma draws to approximate continuous Poisson
	return( rgamma(func_numDraws, func_lambda* func_rate, func_rate) )
			
}