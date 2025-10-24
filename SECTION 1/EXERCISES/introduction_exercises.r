
# I have a box with 3 cyan balls, 5 magenta balls, and 7 yellow ones.
box <- rep(c(˜cyan˜, ˜magenta˜, ˜yellow˜), times = c(3, 5, 7))

# QUESTION 1: What is the probability that the ball will be cyan?
mean(box == 'cyan')
# 0.2

# QUESTION 2: What is the probability that the ball will not be cyan?
1 - 0.2
# 0.8

# QUESTION 3: Instead of taking just one draw, consider taking two draws. You take the second draw without returning the first draw to the box. We call this sampling without replacement.
# What is the probability that the first draw is cyan and that the second draw is not cyan?

cyan1 <- 0.2
# total 14 balls - 3 cyan
notcyan2 <- 12/14
cyan1 * notcyan2
# 0.17

# SAMPLING WITH REPLACEMENT 
# Now repeat the experiment, but this time, after taking the first draw and recording the color, return it back to the box and shake the box. We call this sampling with replacement.

# QUESTION 4: What is the probability that the first draw is cyan and that the second draw is not cyan?
0.2 * 0.8 
# 0.16

