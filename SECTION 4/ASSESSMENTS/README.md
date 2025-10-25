### These exercises, available to verified learners only, review and assess the following concepts:
- Expected value and standard error of a single draw of a random variable
- Expected value and standard error of the sum of draws of a random variable
- Monte Carlo simulation of the sum of draws of a random variable
- The Central Limit Theorem approximation of the sum of draws of a random variable
- Using z-scores to calculate values related to the normal distribution and normal random variables
- Calculating interest/premium rates to minimize chance of losing money
- Determining a number of loans/policies required to profit
- Simulating the effects of a change in event probability

### Setup and libraries
--> Run the code below to set up your environment and load the libraries you will need for the following exercises:

          library(tidyverse)
          
          library(dslabs)


### Background
In the motivating example The Big Short, we discussed how discrete and continuous probability concepts relate to bank loans and interest rates. Similar business problems are faced by the insurance industry. 

Just as banks must decide how much to charge as interest on loans based on estimates of loan defaults, insurance companies must decide how much to charge as premiums for policies given estimates of the probability that an individual will collect on that policy. 

We will use data from 2015 US Period Life Tables 

--> Here is the code you will need to load and examine the data from dslabs:

          data(death_prob)
          
          head(death_prob)

