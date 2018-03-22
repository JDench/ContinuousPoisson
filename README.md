# ContinuousPoisson
This is the code I've developed for R which allows a user to get draws from a continuous distribution which closely approximates a Poisson.

This comes from an effort to explore why a simulation tool was not replicating theoretical results related to the survival probability of a rare object, with m >= 1, in a Galton-Watson like branching process.  I wanted to create a means so simulate stochasticity around the deterministic solutions and was concernd my use of the discrete Poisson distribution related to the difference between simulation and theory.  The goal was to draw from a continuous Poisson like distribution.  I was able to find PGF methods for approximate continuous Poisson, but not a means in R to simulate draws from that same.

This project is my function to get draws from a continuous distribution which approximates Poisson.  This includes the function, a test environment, and results.

Enjoy?
