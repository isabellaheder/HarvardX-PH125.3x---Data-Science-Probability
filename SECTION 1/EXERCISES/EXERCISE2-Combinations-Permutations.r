# QUESTION 1: Sampling with replacement
# Say you’ve drawn 5 balls from the a box that has 3 cyan balls, 5 magenta balls, and 7 yellow balls, with replacement, 
# and all have been yellow. What is the probability that the next one is yellow?

cyan <- 3
magenta <- 5
yellow <- 7

# Assign the variable 'p_yellow' as the probability that a 
# yellow ball is drawn from the box.
box <- rep(c('cyan', 'magenta', 'yellow'), times = c(3, 5, 7))
p_yellow <- mean(box == 'yellow')
print(p_yellow)

# Using the variable 'p_yellow', calculate the probability of 
# drawing a yellow ball on the sixth draw. Print this value to the console.
print(p_yellow)

# QUESTION 2: Rolling a die
# If you roll a 6-sided die once, what is the probability of not seeing a 6? If you roll a 6-sided die six times, 
# what is the probability of not seeing a 6 on any of those rolls?

# Assign the variable 'p_no6' as the probability of not seeing 
# a 6 on a single roll.
p_no6 <- 5/6

# Calculate the probability of not seeing a 6 on 
# six rolls using `p_no6`. Print your result to the console: do not assign it to a variable.
print(p_no6^6)

# QUESTION 3: Probability the Celtics win a game
# Two teams, say the Celtics and the Cavs, are playing a seven game series. The Cavs are 
# a better team and have a 60% chance of winning each game. What is the probability that the Celtics 
# win at least one game? Remember that the Celtics must win one of the first four games, or the series will be over!

# Assign the variable `p_cavs_win4` as the probability that 
# the Cavs will win the first four games of the series.
p_cavs_win4 <- (60/100) * (60/100) * (60/100) * (60/100)

# Using the variable `p_cavs_win4`, calculate the probability that 
# the Celtics win at least one game in the first four games of the series.
1 - p_cavs_win4

# QUESTION 4: Monte Carlo simulation for Celtics winning a game
# Create a Monte Carlo simulation to confirm your answer to the previous problem by estimating how 
# frequently the Celtics win at least 1 of 4 games. Use B <- 10000 simulations. 
# The provided sample code simulates a single series of four random games, simulated_games.

simulated_games <- sample(c("lose","win"), 4, replace = TRUE, prob = c(0.6, 0.4))

# Let's run the Monte Carlo simulation 10,000 times.
B <- 10000

# Use the `set.seed` function to make sure your answer matches 
# the expected result after random sampling.
set.seed(1)

# Create an object called `celtic_wins` that replicates two steps 
# for B iterations: (1) generating a random four-game 
# series `simulated_games` using the example code, then (2) determining 
# whether the simulated series contains at least one win for the Celtics.
# Calculate the frequency out of B iterations that the Celtics won at least one game.
celtic_wins <- replicate(B, {
  simulated_games <- sample(c("lose", "win"), 4, replace = TRUE, prob = c(0.6, 0.4))
  any(simulated_games == "win")})
mean(celtic_wins)
