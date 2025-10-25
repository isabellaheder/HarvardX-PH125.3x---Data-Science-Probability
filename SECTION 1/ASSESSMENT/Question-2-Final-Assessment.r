# Question 2: Restaurant management

# Use the information below to answer the following five questions.

# A restaurant manager wants to advertise that his lunch special offers enough choices to eat 
# different meals every day of the year. He doesn't think his current special actually 
# allows that number of choices, but wants to change his special if needed to allow at least 365 choices.

#A meal at the restaurant includes 1 entree, 2 sides, and 1 drink. He currently offers a choice of 
# 1 entree from a list of 6 options, a choice of 2 different sides from a list of 6 options, 
# and a choice of 1 drink from a list of 2 options.

# 2A) How many meal combinations are possible with the current menu?

6 * nrow(combinations(6,2)) * 2
# 180

# 2B) The manager has one additional drink he could add to the special.
# How many combinations are possible if he expands his original special to 3 drink options?

6 * 15 * 3
# 270

# 2C) The manager decides to add the third drink but needs to expand the number of options. The manager 
# would prefer not to change his menu further and wants to know if he can meet his goal by letting customers choose more sides.
# How many meal combinations are there if customers can choose from 6 entrees, 3 drinks, and select 3 sides from the current 6 options?

nrow(combinations(6, 3))
# 20
6 * 20 * 3
# 360

# 2D) The manager is concerned that customers may not want 3 sides with their meal. He is willing 
# to increase the number of entree choices instead, but if he adds too many expensive options it could 
# eat into profits. He wants to know how many entree choices he would have to offer in order to meet his goal.

# Write a function that takes a number of entree choices and returns the number of meal combinations 
# possible given that number of entree options, 3 drink choices, and a selection of 2 sides from 6 options.

# Use sapply() to apply the function to entree option counts ranging from 1 to 12.

# What is the minimum number of entree options required in order to generate more than 365 combinations?

n_entrees <- function(N) {
    result <- 15 * 3 * N
    result }
N <- seq(1, 12)
n_entrees_aplicando <- sapply(N, n_entrees)
n_entrees_aplicando
# 45  90 135 180 225 270 315 360 405 450 495 540
# answer: 9

# 2E) The manager isn't sure he can afford to put that many entree choices on the lunch menu and thinks it would 
# be cheaper for him to expand the number of sides. He wants to know how many sides he would 
# have to offer to meet his goal of at least 365 combinations.

# Write a function that takes a number of side choices and returns the number of meal combinations 
# possible given 6 entree choices, 3 drink choices, and a selection of 2 sides from the specified number of side choices.

# Use sapply() to apply the function to side counts ranging from 2 to 12.

# What is the minimum number of side options required in order to generate more than 365 combinations?

side_choices <- function(n) {}
side_choices <- function(n) {
 6 * nrow(combinations(n, 2)) * 3 }
meals <- sapply(2:12, side_choices)
meals
#  18   54  108  180  270  378  504  648  810  990 1188
# answer: 7, because it starts from 2
