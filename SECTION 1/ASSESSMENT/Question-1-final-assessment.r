# QUESTION 1: Olympic running

# In the 200m dash finals in the Olympics, 8 runners compete for 3 medals (order matters). In the 2012 Olympics, 
#3 of the 8 runners were from Jamaica and the other 5 were from different countries. The three medals were all 
#won by Jamaica (Usain Bolt, Yohan Blake, and Warren Weir).

#Use the information above to help you answer the following four questions.

# 1A) How many different ways can the 3 medals be distributed across 8 runners?
medals <- permutations(8,3)
nrow(medals)
# 336

# 1B) How many different ways can the three medals be distributed among the 3 runners from Jamaica?
jamaica <- permutations(3, 3)
nrow(jamaica)
# 6

# 1C) What is the probability that all 3 medals are won by Jamaica? 
nrow(jamaica)/nrow(medals)
# 0.0178

# 1D) Run a Monte Carlo simulation on this vector representing the countries of the 8 runners in this race:
# For each iteration of the Monte Carlo simulation, within a replicate() loop, select 3 runners representing 
# the 3 medalists and check whether they are all from Jamaica. Repeat this simulation 10,000 times. 
# Set the seed to 1 before running the loop.

# Calculate the probability that all the runners are from Jamaica.

set.seed(1)
B <- 10000
monte_carlo <- replicate(B, {
    winners <- sample(runners, 3, replace = FALSE)
    all(winners == "Jamaica")})
mean(monte_carlo)
# 0.0174

