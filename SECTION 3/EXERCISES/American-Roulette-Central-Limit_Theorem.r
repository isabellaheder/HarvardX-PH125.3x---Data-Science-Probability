# QUESTION 1: American Roulette probability of winning money:

# The exercises in the previous chapter explored winnings in American roulette. In this chapter 
# of exercises, we will continue with the roulette example and add in the Central Limit Theorem. 
# In the assessment, you created a random variable S that is the sum of your winnings after betting on green 
# a number of times in American Roulette. What is the probability that you end up winning money if you bet on green 100 times?

# Determine the expected value avg and standard error se as you have done in previous exercises.
# Use the pnorm function to determine the probability of winning money.

# probability of the ball landing in a green pocket
p_green <- 2 / 38

# probability of the ball not landing in a green pocket
p_not_green <- 1-p_green

# number of bets
n <- 100

# Calculate 'avg', the expected outcome of 100 spins if you win $17 when the ball lands on green and you lose $1 when the ball doesn't land on green
avg <- n * (17*p_green + -1*p_not_green)

# Compute 'se', the standard error of the sum of 100 outcomes
se <- sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Using the expected value 'avg' and standard error 'se', compute the probability that you win money betting on green 100 times.
1 - pnorm(0, avg, se)

# 0.4479091

# QUESTION 2: American Roulette Monte Carlo simulation

# Create a Monte Carlo simulation that generates 10,000 outcomes of S, the sum of 100 bets. 
# Compute the average and standard deviation of the resulting list and compare them to the expected 
# value (-5.263158) and standard error (40.19344) for S that you calculated previously.

# Replicate the sample code for B <- 10000 simulations.
# Use sample function to simulate n <- 100 outcomes of either a win (17) or a loss (-1) for the bet. 
# Then, add up the winnings over all iterations of the model.
# Use set.seed(1)

p_green <- 2 / 38
p_not_green <- 1-p_green
n <- 100

# Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches the expected result after random sampling.
set.seed(1)

# Create an object called `S` that replicates the sample code for `B` iterations and sums the outcomes.
S <- replicate(B, {
    outcomes <- sample(c(17, -1), n, replace = TRUE, prob = c(p_green, p_not_green))
    sum(outcomes)})

mean(S)
sd(S)

# -5.9086
# 40.30608

# QUESTION 3: American Roulette Monte Carlo vs CLT

# In this section, you calculated the probability of winning money in American roulette using 
# the CLT. Now, calculate the probability of winning money from the Monte Carlo simulation. You 
# will have to copy and utilize the code from Part 2, where the variable S (that contains a list of 
# 10,000 simulated outcomes) was first defined, including the variables previously used. 

# Use the mean function to calculate the probability of winning money from the Monte Carlo simulation, S.

# Calculate the proportion of outcomes in the vector `S` that exceed $0

p_green <- 2 / 38
p_not_green <- 1-p_green
n <- 100
B <- 10000
set.seed(1)

# Monte Carlo simulation - probability of winning money in American roulette
S <- replicate(B, {
    outcomes <- sample(c(17, -1), n, replace = TRUE, prob = c(p_green, p_not_green))
    sum(outcomes)})

# Calculate the proportion of outcomes in the vector that exceed $0
mean(S > 0)
# 0.4232


# QUESTION 4: American Roulette average winnings per bet
# Create a random variable Y that contains your average winnings per bet after betting on green 10,000 times.
# Run a single Monte Carlo simulation of 10,000 bets. 
# Calculate the average result per bet placed.

set.seed(1)
n <- 10000
p_green <- 2 / 38
p_not_green <- 1 - p_green

# Create a vector called `X` that contains the outcomes of `n` bets
X <- sample(c(17, -1), n, replace = TRUE, prob = c(p_green, p_not_green))

# Define a variable `Y` that contains the mean outcome per bet. Print this mean to the console.
Y <- mean(X)
Y
# 0.008


# QUESTION 5: American Roulette per bet expected value
# What is the expected value of Y, the average outcome per bet after betting on green 10,000 times?
# Using the chances of winning $17 (p_green) and the chances of losing $1 (p_not_green), calculate 
# the expected outcome of a bet that the ball will land in a green pocket.
# Use the expected value formula rather than a Monte Carlo simulation.
# Print this value to the console (do not assign it to a variable).

p_green <- 2 / 38
p_not_green <- 1 - p_green

# Calculate the expected outcome of `Y`, which is the expected outcome per bet 
# a . p + b . (1 - p) = expected value formula
# a = 17 
# b = -1

17 * p_green + (-1) * p_not_green
# -0.05263158


# QUESTION 6: American Roulette per bet standard error
# What is the standard error of Y, the average result of 10,000 spins?

n <- 10000
p_green <- 2 / 38
p_not_green <- 1 - p_green

# Compute the standard error of 'Y', the mean outcome per bet from 10,000 b
# SD = |b - a| sqr(p(1-p))
# SE = sqr(n) . SD

1/sqrt(n) * abs(17 - -1) * sqrt(p_green * p_not_green)
# 0.04019344


# QUESTION 7: American Roulette winnings per game are positive

# What is the probability that your winnings are positive after betting on green 10,000 times?

# Execute the code that we wrote in previous exercises to determine the average and standard error.
# Use the pnorm function to determine the probability of winning more than $0.

n <- 10000
p_green <- 2/38
p_not_green <- 1-p_green

# average 
avg <- 17*p_green + -1*p_not_green

# standard error
se <- 1/sqrt(n) * (17 - -1)*sqrt(p_green*p_not_green)

# Given this average and standard error, determine the probability of winning more than $0. Print the result to the console.
print(1 - pnorm(0, avg, se))
# 0.0952


# QUESTION 8: American Roulette Monte Carlo again
# Create a Monte Carlo simulation that generates 10,000 outcomes of S, the average outcome from 
# 10,000 bets on green. Compute the average and standard deviation of the resulting list to confirm the 
# results from previous exercises using the Central Limit Theorem.

p_green <- 2/38
p_not_green <- 1-p_green

# Number of independent bets on green
n <- 10000
# Number of times we want the simulation to run
B <- 10000
set.seed(1)

S <- replicate(B, {
    outcome <- sample(c(17, -1), size = n, replace = TRUE, prob = c(p_green, p_not_green))
    mean(outcome)})

# Compute the average of `S`
mean(S)

# Compute the standard deviation of `S`
sd(S)

# -0.05223142
# 0.03996168



# QUESTION 9: American Roulette Comparison

# Create a Monte Carlo simulation that generates 10,000 outcomes of S, the average 
# outcome from 10,000 bets on green. Compute the average and standard deviation of the resulting 
# list to confirm the results from previous exercises using the Central Limit Theorem.

# Use the replicate function to model 10,000 iterations of a series of 10,000 bets.
# Each iteration inside replicate should simulate 10,000 bets and determine the average outcome of those 10,000 bets.
# Find the average of the 10,000 average outcomes. Print this value to the console.
# Compute the standard deviation of the 10,000 simulations. Print this value to the console.

p_green <- 2/38
p_not_green <- 1-p_green

n <- 10000
B <- 10000
set.seed(1)

# Compute the proportion of outcomes in the vector 'S' where you won more than $0
S <- replicate(B, {
    outcome <- sample(c(17, -1), size = n, replace = TRUE, prob = c(p_green, p_not_green))
    mean(outcome)})

mean(S > 0)
# 0.0977
