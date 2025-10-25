# The ACT is a standardized college admissions test used in the United States. 
# The four multi-part questions in this assessment all involve simulating some 
# ACT test scores and answering probability questions about them.

# For the three year period 2016-2018, ACT standardized test scores were approximately 
# normally distributed with a mean of 20.9 and standard deviation of 5.7. (Real ACT scores 
# are integers between 1 and 36, but we will ignore this detail and use continuous values instead.)

# First we'll simulate an ACT test score dataset and answer some questions about it.

# Set the seed to 16, then use rnorm() to generate a normal distribution of 10000 tests with a 
# mean of 20.9 and standard deviation of 5.7. Save these values as act_scores. You'll be using this dataset 
# throughout these four multi-part questions.

# 1A) What is the mean of act_scores?
set.seed(16, sample.kind = "Rounding")

act_sd <- 5.7
act_avg <- 20.9

act_scores <- rnorm(10000, act_avg, act_sd)
mean(act_scores)
# 20.84012

# 1B) What is the standard deviation of act_scores?
sd(act_scores)
# 5.675237

# 1C) A perfect score is 36 or greater (the maximum reported score is 36).
# In act_scores, how many perfect scores are there out of 10,000 simulated tests?
sum(act_scores >= 36)
# 41

# 1D) In act_scores, what is the probability of an ACT score greater than 30?
mean(act_scores >= 30)
# 0.0527

# 1E) In act_scores, what is the probability of an ACT score less than or equal to 10?
mean(act_scores <= 10)
# 0.0282

# QUESTION 2:

# Set x equal to the sequence of integers 1 to 36. Use dnorm to determine the value 
# of the probability density function over x given a mean of 20.9 and standard deviation of 5.7; 
# save the result as f_x. Plot x against f_x.
x <- 1:36
f_x <- dnorm(x, 20.9, 5.7)
library(ggplot2)
library(tidyverse)

data.frame(x, f_x) %>%
  ggplot(aes(x, f_x)) +
  geom_line()
