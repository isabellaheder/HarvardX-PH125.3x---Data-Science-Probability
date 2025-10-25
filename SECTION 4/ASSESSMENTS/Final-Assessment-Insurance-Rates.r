# QUESTION 1:
# An insurance company offers a one-year term life insurance policy that pays $150,000 
# in the event of death within one year. The premium (annual cost) for this policy for a 50 year 
# old female is $1,150. Suppose that in the event of a claim, the company forfeits the premium and 
# loses a total of $150,000, and if there is no claim the company gains the premium amount of $1,150. 
# The company plans to sell 1,000 policies to this demographic.

# 1A) The death_prob data frame from the dslabs package contains information about the estimated 
# probability of death within 1 year (prob) for different ages and sexes.

# Use death_prob to determine the death probability of a 50 year old female, p.

p <- death_prob %>%
  filter(sex == "Female" & age == "50") %>%
  pull(prob)
p
# 0.00319


# 1B) The loss in the event of the policy holder's death is -$150,000 and the gain if the policy 
# holder remains alive is the premium $1,150.
# What is the expected value of the company's net profit on one policy for a 50 year old female?

loss <- -150000
gain <- 1150

exp_value <- loss*p + gain*(1-p)
exp_value
# 667


# 1C) Calculate the standard error of the profit on one policy for a 50 year old female.
std <- abs(gain-loss) * sqrt(p*(1-p))
std
# 8527


# 1D) What is the expected value of the company's profit over all 1,000 policies for 50 year old females?

n <- 1000
n * exp_value
# 667378


# 1E) What is the standard error of the sum of the expected value over all 1,000 
# policies for 50 year old females?

sqrt(n) * std
# 269658


# 1F) Use the Central Limit Theorem to calculate the probability that the insurance company 
# loses money on this set of 1,000 policies.

pnorm(0, n*exp_value, sqrt(n)*std)
# 0.00666

# QUESTION 2
# 50 year old males have a different probability of death than 50 year old females. We will calculate a 
# profitable premium for 50 year old males in the following four-part question.

# 2A) Use death_prob to determine the probability of death within one year for a 50 year old male.

p_male <- death_prob %>%
  filter(sex == "Male" & age == "50") %>%
  pull(prob)
p_male
# 0.00501


# 2B) Suppose the company wants its expected profits from 1,000 50 year old males with $150,000 life 
# insurance policies to be $700,000. Use the formula for expected value of the sum of draws with the 
# following values and solve for the premium b:

# E[S] = 700000
# n = 1000
# p = death probability of age 50 male
# a = 150000
# b = premium

p <- p_male
exp_sum <- 700000
n <- 1000
a <- -150000

b <- (exp_sum/n-a*p)/(1-p)
b
# 1459


# 2C) Using the new 50 year old male premium rate, calculate the standard error of the sum of 1,000 premiums.

std_sum <- sqrt(n)*abs(b-a)*sqrt(p*(1-p))
std_sum
# 338262

# 2D) What is the probability of losing money on a series of 1,000 policies to 50 year old males?
# Use the Central Limit Theorem.

pnorm(0, exp_sum, std_sum)
# 0.0193

# QUESTION 3:
# Life insurance rates are calculated using mortality statistics from the recent past. They are 
# priced such that companies are almost assured to profit as long as the probability of death remains 
# similar. If an event occurs that changes the probability of death in a given age group, the company risks significant losses.
# In this 6-part question, we'll look at a scenario in which a lethal pandemic disease increases 
# the probability of death within 1 year for a 50 year old to .015. Unable to predict the outbreak, the company 
# has sold 1,000 $150,000 life insurance policies for $1,150.

# 3A) What is the expected value of the company's profits over 1,000 policies?

p <- 0.015
n <- 1000

exp_value <- n*(loss * p + profit * (1-p))
exp_value
# -1117250


# 3B) What is the standard error of the expected value of the company's profits over 1,000 policies?

std <- sqrt(n) * abs(profit-loss) * sqrt(p*(1-p))
std
# 580994.3


# 3C) What is the standard error of the expected value of the company's profits over 1,000 policies?

pnorm(0, exp_value, std)
# 0.9727597


# 3D) Suppose the company can afford to sustain one-time losses of $1 million, but larger losses will force it to go out of business.
# What is the probability of losing more than $1 million?

pnorm( -1 * 10^6, exp_value, std)
# 0.57996


# 3E) Investigate death probabilities p <- seq(.01, .03, .001).
# What is the lowest death probability for which the chance of losing money exceeds 90%?

p <- seq(.01, 0.03, 0.001) 
n <- 1000

p_loss <- sapply(p, function(p){
  exp_val <- n*(loss*p + profit*(1-p))
  se <- sqrt(n) * abs(profit-loss) * sqrt(p*(1-p))
  pnorm(0, exp_value, std)})

data.frame(p, p_loss) %>%
  filter(p_loss > 0.9) %>%
  pull(p) %>%
  min()

# 0.01

# 3F) Investigate death probabilities p <- seq(.01, .03, .0025).
# What is the lowest death probability for which the chance of losing over $1 million exceeds 90%?

p_loss <- sapply(p, function(p){
  exp_val <- n*(loss*p + profit*(1-p))
  se <- sqrt(n) * abs(profit-loss) * sqrt(p*(1-p))
  pnorm(-1*10^6, exp_value, std)})

data.frame(p, p_loss) %>%
  filter(p_loss > 0.9) %>%
  pull(p) %>%
  min()
# 0.02

# QUESTION 4:

# 4A) Define a sampling model for simulating the total profit over 1,000 loans with probability 
# of claim p_loss = .015, loss of -$150,000 on a claim, and profit of $1,150 when there is no claim. 
# Set the seed to 25, then run the model once.
# What is the reported profit (or loss) in millions (that is, divided by 106)?

set.seed(25)
p <- 0.015
outcome <- sample(c(loss, profit), n, prob = c(p, 1-p), replace = TRUE)
sum(outcome)/10^6

# -1.41955

# 4B) Set the seed to 27, then run a Monte Carlo simulation of your sampling model with 10,000 
# replicates to simulate the range of profits/losses over 1,000 loans.
# What is the observed probability of losing $1 million or more?

set.seed(27)
B <- 10000

profits <- replicate(B, {
  outcome <- sample(c(loss, profit), n, prob = c(p, 1-p), replace = TRUE)
  sum(outcome)/10^6 })

mean(profits < -1)
# 0.5388

# QUESTION 5:

# Question 5, which has 4 parts, continues the pandemic scenario from Questions 3 and 4.
# Suppose that there is a massive demand for life insurance due to the pandemic, and the 
# company wants to find a premium cost for which the probability of losing money is under 5%, 
# assuming the death rate stays stable at p = 0.015.

# 5A) Calculate the premium required for a 5% chance of losing money given n=1000 loans, 
# probability of death p=0.015, and loss per claim l = -150000. Save this premium as x for use in further questions.

p <- 0.015
n <- 1000
loss <- -150000
z <- qnorm(0.05)
x <- -loss * ( n * p - z * sqrt (n * p * (1-p)))  / ( n*(1-p) + z * sqrt(n * p * (1-p)))
x
# 3268.063


# 5B) What is the expected profit per policy at this rate?

loss * p + x * (1-p)
# 969.0422


# 5C) What is the expected profit over 1,000 policies?

exp_value <- n * (loss * p + x * (1-p))
exp_value
# 969042.2


# 5D) Run a Monte Carlo simulation with B=10000to determine the probability of losing money on 1,000 policies given the new premium x, loss on a claim of $150,000, and probability of claim p=0.015. Set the seed to 28 before running your simulation.

set.seed(28)
B <- 10000
profit <- replicate(B, {
  outcome <- sample(c(x, loss), n,
                  prob=c(1-p, p), replace = TRUE)
  sum(outcome)})

mean(profit < 0)
# 0.0554

# QUESTION 6:
# The company cannot predict whether the pandemic death rate will stay stable. Set the seed to 29, 
# then write a Monte Carlo simulation that for each of B=10000 iterations:
# randomly changes p by adding a value between -0.01 and 0.01 with sample(seq(-0.01, 0.01, length = 100), 1)
# uses the new random  to generate a sample of n=1000 policies with premium x and loss per claim l = -150000
# returns the profit over n policies (sum of random variable)

# The outcome should be a vector of B total profits. Use the results of the Monte Carlo simulation to 
# answer the following three questions.

# (Hint: Use the process from the lecture for modeling a situation for loans that changes the 
# probability of default for all borrowers simultaneously.)

# 6A) What is the expected value over 1,000 policies?

p <- 0.015
n <- 1000
loss <- -150000
z <- qnorm(0.05)
x <- -loss * (n * p - z * sqrt(n * p * (1 - p))) / (n * (1 - p) + z*sqrt(n * p * (1 - p)))
B <- 10000

set.seed(29)    

profit <- replicate(B, {
    p_2 <- p + sample(seq(-0.01, 0.01, length = 100), 1)
    outcome <- sample(c(x, loss), n, 
                    prob=c(1-p_2, p_2), replace = TRUE) 
    sum(outcome)})

mean(profit)
# 989748.7


# 6B) What is the probability of losing money?
mean(profit < 0)
# 0.191


# 6C) What is the probability of losing more than $1 million?
mean(profit < -1*10^6)
# 0.0426
