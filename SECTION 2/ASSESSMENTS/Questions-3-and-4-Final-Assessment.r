# In this 3-part question, you will convert raw ACT scores to Z-scores and answer some questions about them.

# Convert act_scores to Z-scores. Recall from Data Visualization (the second course in this series) 
# that to standardize values (convert values into Z-scores, that is, values distributed with a mean 
# of 0 and standard deviation of 1), you must subtract the mean and then divide by the standard deviation. 
# Use the mean and standard deviation of act_scores, not the original values used to generate random test scores.

# 3A) What is the probability of a Z-score greater than 2 (2 standard deviations above the mean)?
z_scores <- (act_scores - mean(act_scores))/sd(act_scores)
mean(z_scores > 2)
# 0.0233


# 3B) What ACT score value corresponds to 2 standard deviations above the mean (Z = 2)?
20.9 + (5.68 * 2)
# 32.26


# 3C) A Z-score of 2 corresponds roughly to the 97.5th percentile.
# Use qnorm() to determine the 97.5th percentile of normally distributed 
# data with the mean and standard deviation observed in act_scores.
# What is the 97.5th percentile of act_scores?
qnorm(0.975, act_avg, act_sd)
# 32.07179


# 4A) What is the minimum integer score such that the probability of that score or lower is at least .95?
mean(act_scores <= 31)
# 0.9645

mean(act_scores <= 30)
# 0.9473
# answer= 31


# 4B) Use qnorm() to determine the expected 95th percentile, the value for which the probability 
# of receiving that score or lower is 0.95, given a mean score of 20.9 and standard deviation of 5.7.
# What is the expected 95th percentile of ACT scores?
qnorm(0.95, 20.9, 5.7)
# 30.27567


# 4C) As discussed in the Data Visualization course, we can use quantile() to determine sample quantiles from the data.
# Make a vector containing the quantiles for p <- seq(0.01, 0.99, 0.01), the 1st through 99th percentiles 
# of the act_scores data. Save these as sample_quantiles.
# In what percentile is a score of 26?
# Your answer should be an integer (i.e. 60), not a percent or fraction. Note that a score between the 
# 98th and 99th percentile should be considered the 98th percentile, for example, and that quantile numbers are 
# used as names for the vector sample_quantiles.
p <- seq(0.01, 0.99, 0.01)
sample_quantiles <- quantile(act_scores, p)
sample_quantiles
#     78%       79%       80%       81%       82%       83%       84% 
# 25.235280 25.415344 25.600346 25.808931 25.992660 26.210946 26.422927


# 4D) Make a corresponding set of theoretical quantiles using qnorm() over the interval 
# p <- seq(0.01, 0.99, 0.01) with mean 20.9 and standard deviation 5.7. Save these as 
# theoretical_quantiles. Make a QQ-plot graphing sample_quantiles on the y-axis versus 
# theoretical_quantiles on the x-axis.
theoretical_quantiles <- qnorm(p, 20.0, 5.7)
qplot(theoretical_quantiles, sample_quantiles) + geom_abline()
