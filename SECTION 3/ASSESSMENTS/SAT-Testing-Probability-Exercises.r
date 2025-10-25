# The SAT is a standardized college admissions test used in the United States. The following 
# two multi-part questions will ask you some questions about SAT testing.

# This is a 6-part question asking you to determine some probabilities of what happens when 
# a student guessed for all of their answers on the SAT. Use the information below to inform 
# your answers for the following questions.

# An old version of the SAT college entrance exam had a -0.25 point penalty for every 
# incorrect answer and awarded 1 point for a correct answer. The quantitative test consisted of 
# 44 multiple-choice questions each with 5 answer choices. Suppose a student chooses answers by 
# guessing for all questions on the test.

# QUESTION 1:

# 1A) What is the probability of guessing correctly for one question?
1/5
# 0.2

# 1B) What is the expected value of points for guessing on one question?

p <- 0.2
a <- 1
b <- -0.25
exp_value <- a*p + b*(1-p)
exp_value
# 0


# 1C) What is the expected score of guessing on all 44 questions?
44 * 0
# 0

# 1D) What is the standard error of guessing on all 44 questions?

p <- 0.2
a <- 1
b <- -0.25

std <- sqrt(44) * abs(b-a) * sqrt(p*(1-p))
std
# 3.316625

# 1E) Use the Central Limit Theorem to determine the probability that a guessing student scores 8 points or higher on the test.
p <- 0.2
a <- 1
b <- -0.25

exp_value <- a*p + b*(1-p)
std <- sqrt(44) * abs(b-a) * sqrt(p*(1-p))

1-pnorm(8, exp_value, std)
# 0.007930666


# 1F) Set the seed to 21, then run a Monte Carlo simulation of 10,000 students guessing on the test.

What is the probability that a guessing student scores 8 points or higher?

set.seed(21)

B <- 10000
n <- 44
p <- 0.2

montecarlo <- replicate(B, {
  score <- sample(c(1, -0.25), n, replace = TRUE, prob = c(p, 1-p))
  sum(score)})

mean(montecarlo >= 8)
# 0.008

# QUESTION 2

# The SAT was recently changed to reduce the number of multiple choice options from 5 to 4 
# and also to eliminate the penalty for guessing.
# In this two-part question, you'll explore how that affected the expected values for the test.

# 2A) Suppose that the number of multiple choice options is 4 and that there is no 
# penalty for guessing - that is, an incorrect question gives a score of 0.
# What is the expected value of the score when guessing on this new test?

p <- 0.25
a <- 1
b <- 0
n <- 44

exp_value <- n * a*p + b*(1-p)
exp_value
# 11


# 2B) Consider a range of correct answer probabilities p <- seq(0.25, 0.95, 0.05) representing a range of student skills.
# What is the lowest p such that the probability of scoring over 35 exceeds 80%?

p <- seq(0.25, 0.95, 0.05)
x <- sapply(p, function(f){
  exp_value <- n * a*f + b*(1-f)
  std <- sqrt(n) * abs(b-a) * sqrt(f*(1-f))
  1-pnorm(35, exp_value, std)})

min(p[which(x > 0.8)])
# 0.85

# QUESTION 3
# A casino offers a House Special bet on roulette, which is a bet on five pockets (00, 0, 1, 2, 3) 
# out of 38 total pockets. The bet pays out 6 to 1. In other words, a losing bet yields -$1 and 
# a successful bet yields $6. A gambler wants to know the chance of losing money if he 
# places 500 bets on the roulette House Special.

# The following 7-part question asks you to do some calculations related to this scenario.

# 3A) What is the expected value of the payout for one bet?
p <- 5/38
a <- 6
b <- -1
exp_value <- a * p + b * (1-p)
exp_value
# -0.0789


# 3B) What is the standard error of the payout for one bet?

p <- 5/38
a <- 6
b <- -1
std <- abs(b-a) * sqrt(p * (1-p))
std

# 2.38


# 3C) What is the expected value of the average payout over 500 bets?
# Remember there is a difference between expected value of the average and expected value of the sum.

-0.0789

# 3D) What is the standard error of the average payout over 500 bets?
# Remember there is a difference between the standard error of the average and standard error of the sum.

n <- 500
2.38 / sqrt(n)

# 0.106


# 3E) What is the expected value of the sum of 500 bets?

-0.0789 * 500 
# -39.45

# 3F) What is the standard error of the sum of 500 bets?

n <- 500
sqrt(n) * 2.38

# 52.9

# 3G) Use pnorm() with the expected value of the sum and standard error of the sum to calculate the probability of losing money over 500 bets, Pr(X0).

pnorm(0, -39.45, 52.9)
# 0.772
